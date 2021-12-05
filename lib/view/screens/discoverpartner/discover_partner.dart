import 'package:daytte/consts/constants.dart';
import '../../../model/find_nearest_model.dart';
import '../../../routes/app_routes.dart';
import 'expand_discover_partner.dart';
import '../findnearest/expire_banner.dart';
import '../../widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../../../consts/image_constants.dart';
import '../../../controllers/discover_partner/discover_partner_controller.dart';

class DiscoverPartner extends StatefulWidget {
  @override
  State<DiscoverPartner> createState() => _DiscoverPartnerState();
}

class _DiscoverPartnerState extends State<DiscoverPartner>
    with AutomaticKeepAliveClientMixin {
  final User user = Get.arguments;
  final keyOne = GlobalKey();

  @override
  void initState() {
    super.initState();
    final controller = Get.find<DiscoverPartnerController>();
    controller.fetchUserGallery(user.id.toString());

    /* WidgetsBinding.instance?.addPostFrameCallback(
      (_) => ShowCaseWidget.of(Get.context!)?.startShowCase([
        keyOne,
      ]),
    ); */
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: _appBarWidget(theme),
      backgroundColor: Color(0xffF7F8FA),
      body: GetBuilder<DiscoverPartnerController>(
          init: DiscoverPartnerController(),
          builder: (controller) {
            return Column(
              children: [
                ExpireBannerWidget(),
                Stack(
                  children: [
                    Container(
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
                                              matchEngine:
                                                  controller.matchEngine ??
                                                      MatchEngine(),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        AppRoutes
                                                            .PROFILEVIEW,
                                                        arguments: user);
                                                  },
                                                  child: Container(
                                                    color: Colors.white,
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          height:
                                                              Get.height *
                                                                  0.47,
                                                          child: Stack(
                                                            children: [
                                                              Container(
                                                                height:
                                                                    Get.height *
                                                                        0.45,
                                                                width: Get
                                                                    .width,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                color: Colors
                                                                    .transparent,
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          15.0),
                                                                  child:
                                                                      StoryView(
                                                                    controller:
                                                                        controller.storyController,
                                                                    storyItems:
                                                                        controller.profilePics,
                                                                    repeat:
                                                                        false,
                                                                    onStoryShow:
                                                                        (storyItem) {
                                                                      final index = controller
                                                                          .profilePics
                                                                          .indexOf(storyItem);
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                              _distanceWidget(),
                                                              _personsMatchingPercentage(),
                                                            ],
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              addVerticalSpace(
                                                                  8),
                                                              _userNamesWidget(
                                                                  theme),
                                                              addVerticalSpace(
                                                                  8),
                                                              _usersShortDescriptionWidget(
                                                                  theme),
                                                              addVerticalSpace(
                                                                  15),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  buildContainer(
                                                                      ImageConstants
                                                                          .ic_rewind,
                                                                      24,
                                                                      24,
                                                                      controller),
                                                                  buildContainer(
                                                                      ImageConstants
                                                                          .ic_love,
                                                                      26,
                                                                      26,
                                                                      controller),
                                                                  buildContainer(
                                                                      ImageConstants
                                                                          .ic_close,
                                                                      20,
                                                                      20,
                                                                      controller),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                              onStackFinished: () {
                                                ScaffoldMessenger.of(
                                                        context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "No More Profile Available"),
                                                        duration: Duration(
                                                            milliseconds:
                                                                500)));
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
                          Positioned(
                              top: Get.height * 0.45,
                              right: 30,
                              child: GestureDetector(
                                  onTap: () => Get.to(
                                      () => ExpandPartnerDetails(),
                                     arguments: user),
                                  child: _downArrowWidget)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }

  Text _usersShortDescriptionWidget(TextTheme theme) {
    return Text("${user.shortDescription}",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: theme.subtitle2
            ?.copyWith(fontSize: 18, fontWeight: FontWeight.normal));
  }

  Text _userNamesWidget(TextTheme theme) {
    return Text(
      "${user.firstname} ${user.lastname}",
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
    return  Container(
        color: Colors.white,
        height: 50,
        width: 50,
        child: MaterialButton(
          color: Colors.white,
          shape: buildRoundedRectangleBorder(),
          padding: EdgeInsets.all(8),
          onPressed: () {

            if(user.id != controller.dataIds[controller.index].id && controller.dataIds.length > controller.index){
              controller.fetchUserGallery(controller.dataIds[controller.index].id.toString());
              print("sgetting id .${user.id}.==.${controller.dataIds[controller.index].id.toString()}");
              print("sgetting id ...${controller.dataIds[controller.index].id.toString()}");
              controller.getIndex();
            }
            //  if(user.id == controller.dataIds[controller.index].id){
            //   controller.getIndex();
            //   controller.fetchUserGallery(controller.dataIds[controller.index].id.toString());
            //   print("else if condition getting id .${user.id}.==.${controller.dataIds[controller.index].id.toString()}");
            // }

            if (icon == ImageConstants.ic_rewind) {
              controller.matchEngine?.currentItem?.nope();
            } else if (icon == ImageConstants.ic_love) {
              controller.matchEngine?.currentItem?.like();
            } else if (icon == ImageConstants.ic_close) {
              controller.matchEngine?.currentItem?.superLike();
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

  @override
  bool get wantKeepAlive => true;
}

class CustomShowcaseWidget extends StatelessWidget {
  final Widget child;
  final String? description;
  final GlobalKey globalKey;

  const CustomShowcaseWidget({
    @required this.description,
    required this.child,
    required this.globalKey,
  });

  @override
  Widget build(BuildContext context) => Showcase(
        key: globalKey,
        showcaseBackgroundColor: Colors.pink.shade400,
        contentPadding: EdgeInsets.all(12),
        showArrow: false,
        disableAnimation: true,
        // title: 'Hello',
        // titleTextStyle: TextStyle(color: Colors.white, fontSize: 32),
        description: description,
        descTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        // overlayColor: Colors.white,
        // overlayOpacity: 0.7,
        child: child,
      );
}
