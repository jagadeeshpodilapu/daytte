import 'package:daytte/consts/image_constants.dart';
import 'package:daytte/controllers/discover_partner/discover_partner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:swipe_cards/swipe_cards.dart';

class DiscoverPartner extends StatelessWidget {
  final controller = Get.put(DiscoverPartnerController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          key: controller.scaffoldKey,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.grey,
              ),
              onPressed: () {}, // => Get.to(() => Settings()),
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Discover Partner",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
          ),
          body: Container(
            height: Get.height * 0.80,
            width: Get.width,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: GestureDetector(
              onTap: () {},
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, top: 8.0, right: 8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          elevation: 4,
                          child: SwipeCards(
                            matchEngine: controller.matchEngine,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      height: Get.height * 0.47,
                                      child: Stack(children: [
                                        Container(
                                          height: Get.height * 0.45,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          alignment: Alignment.center,
                                          color: Colors.transparent,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            child: StoryView(
                                              controller: controller.controller,
                                              storyItems:
                                                  controller.profilePics,
                                              repeat: false,
                                              onStoryShow: (storyItem) {
                                                final index = controller
                                                    .profilePics
                                                    .indexOf(storyItem);

                                                // if (index > 0) {
                                                //   setState(() {
                                                //     date = widget.user.stories[index].date;
                                                //   });
                                                // }
                                              },
                                              // StoryItem.pageImage(
                                              //     url: "${images[index]}", controller: controller)

                                              // child: Image.asset(
                                              //   "${images[index]}",
                                              //   fit: BoxFit.contain,
                                              // ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            top: 20,
                                            left: 16,
                                            child: Container(
                                              height: 35,
                                              padding: EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                              ),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.black),
                                              child: TextButton.icon(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.location_on,
                                                    size: 20,
                                                    color: Colors.white,
                                                  ),
                                                  label: Text(
                                                    "2.3Km away",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                            )),
                                        Positioned(
                                          bottom: 0,
                                          left: Get.width * 0.25,
                                          child: Container(
                                            height: 40,
                                            padding: EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
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
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                          ),
                                        ),
                                      ]),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Seema Khan",
                                            style: buildTextStyle(
                                                30, Colors.black),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                              "Full-time Travelller. Globe Trotter.. Occasional Photographer. Part time Singer/Dancer",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: buildTextStyle(
                                                  16, Colors.grey)),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              buildContainer(
                                                  ImageConstants.ic_rewind,
                                                  24,
                                                  24),
                                              buildContainer(
                                                  ImageConstants.ic_love,
                                                  26,
                                                  26),
                                              buildContainer(
                                                  ImageConstants.ic_close,
                                                  20,
                                                  20),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            onStackFinished: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("No More Profile Available"),
                                duration: Duration(milliseconds: 500),
                              ));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Container buildContainer(String icon, double height, double width) {
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
              controller.matchEngine.currentItem?.nope();
            } else if (icon == ImageConstants.ic_love) {
              controller.matchEngine.currentItem?.like();
            } else if (icon == ImageConstants.ic_close) {
              controller.matchEngine.currentItem?.superLike();
            }
          },
          child: Image.asset(
            icon,
            height: height,
            width: width,
          ),
        ));
  }

  TextStyle buildTextStyle(double fontSize, Color color) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
    );
  }

  RoundedRectangleBorder buildRoundedRectangleBorder() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
      side: BorderSide(color: Colors.white),
    );
  }
}
