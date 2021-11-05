import 'package:daytte/controllers/findnearest/find_nearest_controller.dart';

import '../../model/content_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:swipe_cards/swipe_cards.dart';

class DiscoverPartnerController extends GetxController {
  late MatchEngine matchEngine;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  StoryController controller = StoryController();
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  List<StoryItem> profilePics = <StoryItem>[];

  final nearestController = Get.find<FindNearestController>();

  @override
  void onInit() {
    super.onInit();
    controller = StoryController();
    for (int i = 0;
        i < nearestController.findNearestModel!.data.users!.length;
        i++) {
      profilePics.add(
        StoryItem.pageImage(
          url: nearestController
                  .findNearestModel?.data.users?[i].profileImg?.imgPath ??
              "",
          controller: controller,
          imageFit: BoxFit.cover,
          duration: Duration(milliseconds: 5000),
        ),
      );
      _swipeItems.add(
        SwipeItem(likeAction: () {}, nopeAction: () {}, superlikeAction: () {}),
      );
    }

    matchEngine = MatchEngine(swipeItems: _swipeItems);
  }
}
