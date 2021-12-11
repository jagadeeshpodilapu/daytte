import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:daytte/model/like_details_model.dart';
import 'package:daytte/services/base_service/base_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InterestController extends BaseController {
  bool isActive = false;
  int page = 1, limit = 10;
  final storage = GetStorage();
  RxInt users = 0.obs;
  LikeDetailsModel? likedDetailsModel;

  @override
  void onInit() {
    fetchLikedPeople();
    super.onInit();
  }

  Future fetchLikedPeople() async {
    String userId = storage.read("id");
    final response = await BaseClient()
        .get(
            '/like?page=$page&limit=$limit&likedByMe=$isActive&likedBy=$userId',
            storage.read('token'))
        .catchError(BaseController().handleError);
    if (response != null) {
      likedDetailsModel = LikeDetailsModel.fromJson(response);
      users.value = likedDetailsModel?.data.likes?.length ?? 0;
    }
    update();
  }

}

class YouLikedController extends BaseController {
  bool isActive = true;
  int page = 1, limit = 10;
  final storage = GetStorage();
  RxInt users = 0.obs;
  LikeDetailsModel? likedDetailsModel;

  @override
  void onInit() {
    fetchLikedPeople();
    super.onInit();
  }

  Future fetchLikedPeople() async {
    String userId = storage.read("id");
    final response = await BaseClient()
        .get(
            '/like?page=$page&limit=$limit&likedByMe=$isActive&likedBy=$userId',
            storage.read('token'))
        .catchError(BaseController().handleError);
    if (response != null) {
      likedDetailsModel = LikeDetailsModel.fromJson(response);
      users.value = likedDetailsModel?.data.likes?.length ?? 0;
    }
    update();
  }

}

