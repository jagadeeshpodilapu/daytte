import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:daytte/model/like_details_model.dart';
import 'package:daytte/model/liked_to_model.dart';
import 'package:daytte/services/base_service/base_client.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LikedController extends BaseController {
  bool isActive = false;
  int page = 1, limit = 20;
  final storage = GetStorage();
  RxInt users = 0.obs;
  LikedModel? likedModel;

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
      print("liked response $response");
      likedModel = LikedModel.fromJson(response);
      likedModel?.data.likes!
          .removeWhere((element) => element.likedBy?.id == storage.read('id'));
      users.value = likedModel?.data.likes?.length ?? 0;
    }
    update();
  }
}

class YouLikedController extends BaseController {
  bool isActive = true;
  int page = 1, limit = 20;
  final storage = GetStorage();
  RxInt users = 0.obs;
  LikedToModel? likedToModel;

  @override
  void onInit() {
    fetchLikedPeople();
    super.onInit();
  }

  Future fetchLikedPeople() async {
    String userId = storage.read("id");
    final response = await BaseClient()
        .get(
            '/like?page=$page&limit=$limit&likedByMe=true&likedBy=${storage.read('id')}',
            storage.read('token'))
        .catchError(BaseController().handleError);
    if (response == null) return;
    if (response != null) {
      likedToModel = LikedToModel.fromJson(response);
      likedToModel?.data.likes!
          .removeWhere((element) => element.likedTo?.id == userId);
      users.value = likedToModel?.data.likes?.length ?? 0;
    }
    update();
  }
}
