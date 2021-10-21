import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../../model/content_images.dart';

class DiscoverPartnerController extends GetxController {
  late MatchEngine matchEngine;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  StoryController controller = StoryController();
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  List<StoryItem> profilePics = <StoryItem>[];
  List<String> images = [
    "https://wallpaper-house.com/data/out/10/wallpaper2you_426193.jpg",
    "https://wallpaper-house.com/data/out/4/wallpaper2you_37383.jpg",
    "https://wallpaper-house.com/data/out/10/wallpaper2you_426193.jpg",
    "https://wallpaper-house.com/data/out/4/wallpaper2you_37383.jpg",
    "https://wallpaper-house.com/data/out/10/wallpaper2you_426193.jpg",
  ];

  @override
  void onInit() {
    super.onInit();
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

    matchEngine = MatchEngine(swipeItems: _swipeItems);
  }
}
