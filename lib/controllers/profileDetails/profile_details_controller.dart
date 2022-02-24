import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:daytte/model/find_nearest_model.dart';
import 'package:daytte/model/user_gallery_model.dart';
import 'package:daytte/services/base_service/base_client.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileDetailsController extends BaseController {
  final storage = GetStorage();
  User? userData;
  RxBool isLoading = true.obs;
  UserGalleryModel? userGalleryModel;

  Future fetchUser(String userId) async {
    isLoading(true);
    final response = await BaseClient()
        .get('/users/$userId', storage.read('token'))
        .catchError((error) => BaseController().handleError(error));

    if (response != null) {
      isLoading(false);
      userData = User.fromJson(response['data']['user']);
      print("find nearest response $response  $userData");
    }
    update();
  }

  Future fetchUserGallery(String userId) async {
    isLoading(true);
    final response = await BaseClient()
        .get('/galleries?skip=0&limit=10&userId=$userId', storage.read('token'))
        .catchError((error) => BaseController().handleError(error));
    if (response != null) {
      isLoading(false);
      print("find nearest response $response");
      userGalleryModel = UserGalleryModel.fromJson(response);
    }
    update();
  }
}
