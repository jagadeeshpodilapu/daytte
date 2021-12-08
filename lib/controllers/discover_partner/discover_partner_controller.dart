import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:daytte/controllers/findnearest/find_nearest_controller.dart';
import 'package:daytte/model/user_gallery_model.dart';
import 'package:daytte/model/user_liked_model.dart';
import 'package:daytte/services/base_service/base_client.dart';
import 'package:daytte/services/likes_service.dart';
import 'package:daytte/view/dialogs/dialogHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:story_view/story_view.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:swipe_cards/swipe_cards.dart';

class DiscoverPartnerController extends BaseController {
  MatchEngine? matchEngine;
  StoryController storyController = StoryController();
  List<SwipeItem> swipeItems = <SwipeItem>[];
  List<StoryItem> profilePics = <StoryItem>[];
  UserGalleryModel? userGalleryModel;
  RxInt gallery = 0.obs;
  RxBool isLoading = true.obs;

  final storage = GetStorage();
  UserLikedModel? userLikedModel;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void onInit() {
    super.onInit();
  }

  Future fetchUserGallery(String userId) async {
    isLoading(true);
    final response = await BaseClient()
        .get('/galleries?skip=0&limit=10&userId=$userId', storage.read('token'))
        .catchError(handleError);
    if (response == null) return;
    profilePics.clear();
    swipeItems.clear();
    if (response != null) {
      print("find nearest response $response");
      isLoading(false);
      userGalleryModel = UserGalleryModel.fromJson(response);
      gallery.value = userGalleryModel?.data.galleries?.length ?? 0;
      print('galleryImages and length $response $userId ${gallery.value}');
      if (userGalleryModel!.data.galleries!.length > 0) {
        for (int i = 0; i < userGalleryModel!.data.galleries!.length; i++) {
          profilePics.add(
            StoryItem.pageImage(
              url: userGalleryModel!.data.galleries?[i].imgPath ??
                  "assets/images/placeholder.jpg",
              controller: storyController,
              imageFit: BoxFit.cover,
              duration: Duration(seconds: 10),
              shown: true,
            ),
          );
        }
      } else {
        profilePics.add(
          StoryItem.pageImage(
            url: "assets/images/placeholder.jpg",
            controller: storyController,
            imageFit: BoxFit.cover,
            duration: Duration(milliseconds: 5000),
          ),
        );
        swipeItems.add(
          SwipeItem(
              likeAction: () {}, nopeAction: () {}, superlikeAction: () {}),
        );
        gallery.value = 1;
      }
    }
    update();
  }

  Future postLikesData(String likedTo, bool isLiked) async {
    print("this post like method called");
    Map<String, dynamic> payload = {
      "likedBy": storage.read('id'),
      "likedTo": likedTo,
      "likeType": "normal",
      "isLiked": isLiked
    };

    final response =
        await LikesService().postLikes(payload, storage.read('token'));
    if (response == null) return;

    if (response != null) {
      userLikedModel = UserLikedModel.fromJson(response);
    }
    update();
  }
}
