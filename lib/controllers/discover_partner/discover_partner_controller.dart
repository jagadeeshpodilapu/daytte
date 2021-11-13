import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:daytte/controllers/findnearest/find_nearest_controller.dart';
import 'package:daytte/model/user_gallery_model.dart';
import 'package:daytte/services/base_service/base_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:story_view/story_view.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:swipe_cards/swipe_cards.dart';

class DiscoverPartnerController extends GetxController {
  late MatchEngine matchEngine;
  StoryController storyController = StoryController();
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  List<StoryItem> profilePics = <StoryItem>[];
  UserGalleryModel? userGalleryModel;
  RxInt gallery = 0.obs;
  final nearestController = Get.find<FindNearestController>();
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();

    matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  Future fetchUserGallery(String userId) async {
    final response = await BaseClient()
        .get('/galleries?skip=0&limit=10&userId=$userId', storage.read('token'))
        .catchError(BaseController().handleError);

    if (response != null) {
      print("find nearest response $response");
      userGalleryModel = UserGalleryModel.fromJson(response);
      gallery.value = userGalleryModel?.data.galleries?.length ?? 0;
      print('galleryImages and length $response $userId ${gallery.value}');
      if (userGalleryModel!.data.galleries!.length > 0)
        for (int i = 0; i < userGalleryModel!.data.galleries!.length; i++) {
          profilePics.add(
            StoryItem.pageImage(
              url: userGalleryModel!.data.galleries?[i].imgPath ?? "",
              controller: storyController,
              imageFit: BoxFit.cover,
              duration: Duration(milliseconds: 5000),
            ),
          );
          _swipeItems.add(
            SwipeItem(
                likeAction: () {}, nopeAction: () {}, superlikeAction: () {}),
          );
        }
    }
    update();
  }
}
