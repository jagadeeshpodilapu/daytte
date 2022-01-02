import 'package:daytte/consts/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../../../consts/image_constants.dart';
import '../../../controllers/discover_partner/discover_partner_controller.dart';
import '../../../model/find_nearest_model.dart';
import '../../../routes/app_routes.dart';
import '../../widgets/common_widgets.dart';
import '../findnearest/expire_banner.dart';
import 'expand_discover_partner.dart';

class DiscoverPartner extends StatefulWidget {
  @override
  State<DiscoverPartner> createState() => _DiscoverPartnerState();
}

class _DiscoverPartnerState extends State<DiscoverPartner> {
  final data = Get.arguments;
  late List<User> userList;

  final keyOne = GlobalKey();
  final controller = Get.find<DiscoverPartnerController>();
  final storyController = StoryController();
  List<SwipeItem>? _swipeItems = <SwipeItem>[];
  MatchEngine _matchEngine = MatchEngine();
  bool? matched;

  int? swipeItemIndex;

  @override
  void initState() {
    super.initState();

    userList = data['usersList'];

    getUserGallery(userIndex: 0);

    for (int i = 0; i < userList.length; i++) {
      _swipeItems?.add(
        SwipeItem(
            content: userList[i],
            likeAction: () async {
              await controller.postLikesData(userList[i].id.toString(), true);
            
              _matchEngine.currentItem?.like();
             getUserGallery(userIndex: i + 1);
            },
            nopeAction: () async {
              await controller.postLikesData(userList[i].id.toString(), false);
              _matchEngine.currentItem?.nope();
              getUserGallery(userIndex: i + 1);
            },
            superlikeAction: () async {
              // await controller.postLikesData(userList[i].id.toString(), true);
              // _matchEngine.currentItem?.like();
              // getUserGallery(userIndex: i + 1);
            }),
      );

      _matchEngine = MatchEngine(swipeItems: _swipeItems);
      //controller.fetchUserGallery();
    }
  }

  getUserGallery({required int userIndex}) async {
    controller.fetchUserGallery(userList[userIndex].id.toString());
    setState(() {});
  }

  @override
  void dispose() {
    storyController.dispose();
    _matchEngine.dispose();
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: _appBarWidget(theme),
      backgroundColor: Color(0xffF7F8FA),
      body: Hero(
        tag: "img",
        child: GetBuilder<DiscoverPartnerController>(
            init: DiscoverPartnerController(),
            builder: (controller) {
              return Column(
                children: [
                  ExpireBannerWidget(),
                  Stack(
                    children: [
                      Container(
                        child: Container(
                          height: Get.height * 0.75,
                          width: Get.width,
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Stack(
                            children: [
                              controller.isLoading.value
                                  ? Center(child: CircularProgressIndicator())
                                  : controller.gallery.value != 0
                                      ? Stack(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, top: 8, right: 8.0),
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                child: Center(),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 15.0),
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                elevation: 4,
                                                child: SwipeCards(
                                                  matchEngine: _matchEngine,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        Get.toNamed(
                                                            AppRoutes
                                                                .PROFILEVIEW,
                                                            arguments: userList[
                                                                index]);
                                                      },
                                                      child: userCard(
                                                          controller,
                                                          theme,
                                                          index),
                                                    );
                                                  },
                                                  onStackFinished: () {
                                                    Get.back();
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Center(
                                          child: Text(
                                              "No Gallery Pictures  Available"),
                                        ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }

  Widget userCard(
      DiscoverPartnerController controller, TextTheme theme, int index) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: Get.height * 0.47,
                child: Stack(
                  children: [
                    Container(
                      height: Get.height * 0.45,
                      width: Get.width,
                      alignment: Alignment.center,
                      color: Colors.transparent,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: StoryView(
                          controller: storyController,
                          storyItems: controller.profilePics,
                          repeat: false,
                          inline: false,
                        ),
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: controller.isSwipeMore.value,
                        child: Positioned.fill(
                            bottom: 15,
                            child: Container(
                              // color: Color(0xFF363636).withOpacity(0.8),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: Color(0xFF363636).withOpacity(0.8)),
                              child: GestureDetector(
                                onTap: () {
                                  controller.updateIsSwipe();
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icon/swipe_view_more.svg",
                                      height: 70,
                                      width: 70,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Swipe to view more",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ),
                    _distanceWidget(),
                    _personsMatchingPercentage(),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    addVerticalSpace(8),
                    _userNamesWidget(theme, index),
                    addVerticalSpace(8),
                    _usersShortDescriptionWidget(theme, index),
                    addVerticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildContainer(
                            ImageConstants.ic_rewind, 24, 24, controller),
                        buildContainer(
                            ImageConstants.ic_love, 26, 26, controller),
                        buildContainer(
                            ImageConstants.ic_close, 20, 20, controller),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: Get.height * 0.42,
          right: 10,
          child: GestureDetector(
              onTap: () => Get.to(() => ExpandPartnerDetails(),
                  arguments: userList[index]),
              child: _downArrowWidget),
        ),
      ],
    );
  }

  Text _usersShortDescriptionWidget(TextTheme theme, int index) {
    return Text("${userList[index].shortDescription}",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: theme.subtitle2
            ?.copyWith(fontSize: 18, fontWeight: FontWeight.normal));
  }

  Text _userNamesWidget(TextTheme theme, int index) {
    return Text(
      "${userList[index].firstname} ${userList[index].lastname}",
      style:
          theme.headline5?.copyWith(fontSize: 22, fontWeight: FontWeight.w700),
    );
  }

  Widget _personsMatchingPercentage() {
    return Visibility(
      visible: false,
      child: Positioned(
        bottom: 0,
        left: Get.width * 0.25,
        child: Container(
          height: 40,
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFF3c0fc7),
                Color(0xFFc86dd7),
              ],
            ),
          ),
          child: TextButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              label: Text(
                "95% Match!",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }

  Widget _distanceWidget() {
    return Positioned(
      left: 20,
      bottom: 30,
      child: Container(
        height: 35,
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xff363636).withOpacity(0.3)),
        child: TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.location_on,
              size: 20,
              color: Colors.white,
            ),
            label: Text(
              "2.3Km away",
              style: const TextStyle(
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                  fontSize: 12.0),
            )),
      ),
    );
  }

  AppBar _appBarWidget(TextTheme theme) {
    return AppBar(
      elevation: 0.0,
      leading: IconButton(
        icon: Icon(
          Icons.settings,
          color: Color(0xff363636),
        ),
        onPressed: () => Get.toNamed(AppRoutes.SETTINGSVIEW),
      ),
      backgroundColor: Color(0xffF7F8FA),
      title: Text(
        Constants.discoverPartner,
        style: theme.headline6,
      ),
      centerTitle: true,
    );
  }

  Widget buildContainer(String icon, double height, double width,
      DiscoverPartnerController controller) {
    return Container(
      color: Colors.white,
      height: 50,
      width: 50,
      child: MaterialButton(
        color: Colors.white,
        shape: buildRoundedRectangleBorder(),
        padding: EdgeInsets.all(8),
        onPressed: () {
          if (icon == ImageConstants.ic_rewind) {
            //  _matchEngine.currentItem?.nope();
          } else if (icon == ImageConstants.ic_love) {
            _matchEngine.currentItem?.like();
          } else if (icon == ImageConstants.ic_close) {
            _matchEngine.currentItem?.nope();
          }
        },
        child: Image.asset(
          icon,
          height: height,
          width: width,
        ),
      ),
    );
  }

  TextStyle buildTextStyle(double fontSize, Color color) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
    );
  }

  Widget get _downArrowWidget {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: 40,
        width: 40,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
          gradient: gradientColors,
        ),
        child: Icon(Icons.arrow_downward, color: Colors.white, size: 30),
      ),
    );
  }

  RoundedRectangleBorder buildRoundedRectangleBorder() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
      side: BorderSide(color: Colors.white),
    );
  }
}
