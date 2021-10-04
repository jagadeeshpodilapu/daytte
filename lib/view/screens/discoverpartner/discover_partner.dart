import 'package:daytte/consts/image_constants.dart';
import 'package:daytte/model/content_images.dart';
import 'package:daytte/view/screens/profiledetails/profile_details.dart';
import 'package:daytte/view/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:swipe_cards/swipe_cards.dart';

class DiscoverPartner extends StatefulWidget {
  @override
  _DiscoverPartnerState createState() => _DiscoverPartnerState();
}

class _DiscoverPartnerState extends State<DiscoverPartner> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  List<StoryItem> profilePics = <StoryItem>[];
  List<String> images = [
    "https://wallpaper-house.com/data/out/10/wallpaper2you_426193.jpg",
    "https://wallpaper-house.com/data/out/4/wallpaper2you_37383.jpg",
    "https://wallpaper-house.com/data/out/10/wallpaper2you_426193.jpg",
    "https://wallpaper-house.com/data/out/4/wallpaper2you_37383.jpg",
    "https://wallpaper-house.com/data/out/10/wallpaper2you_426193.jpg",
  ];
  late MatchEngine _matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  StoryController controller = StoryController();
  @override
  void initState() {
    controller = StoryController();
    for (int i = 0; i < images.length; i++) {
      profilePics.add(
        StoryItem.pageImage(
          url: images[i],
          controller: controller,
          imageFit: BoxFit.cover,
          duration: Duration(milliseconds: 5000),
        ),
      );
      _swipeItems.add(
        SwipeItem(
          content: Content(text: images[i]),
        ),
      );
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.grey,
            ),
            onPressed: () => Get.to(() => Settings()),
          ),
          backgroundColor: Colors.white,
          title: Text(
            "Discover Partner",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: Container(
          height: Get.height * 0.85,
          width: Get.width,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: GestureDetector(
            onTap: () => Get.to(() => ProfileView()),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8.0, right: 8.0),
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
                      matchEngine: _matchEngine,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          color: Colors.white,
                          child: Stack(children: [
                            Container(
                              height: MediaQuery.of(context).size.height *0.55,
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              color: Colors.transparent,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: StoryView(
                                  controller: controller,
                                  storyItems: profilePics,
                                  repeat: false,
                                  onStoryShow: (storyItem) {
                                    final index =
                                        profilePics.indexOf(storyItem);

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
                                      borderRadius: BorderRadius.circular(20),
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
                                        style: TextStyle(color: Colors.white),
                                      )),
                                )),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
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
                                  Text(
                                    "Seema Khan",
                                    style: buildTextStyle(30, Colors.black),
                                  ),
                                  Text(
                                      "Full-time Travelller. Globe Trotter.. Occasional Photographer. Part time Singer/Dancer",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: buildTextStyle(16, Colors.grey)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      buildContainer(
                                          ImageConstants.ic_rewind, 24, 24),
                                      buildContainer(
                                          ImageConstants.ic_love, 26, 26),
                                      buildContainer(
                                          ImageConstants.ic_close, 20, 20),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ]),
                        );
                      },
                      onStackFinished: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Stack Finished"),
                          duration: Duration(milliseconds: 500),
                        ));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
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
              _matchEngine.currentItem?.nope();
            } else if (icon == ImageConstants.ic_love) {
              _matchEngine.currentItem?.like();
            } else if (icon == ImageConstants.ic_close) {
              _matchEngine.currentItem?.superLike();
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
