import 'package:daytte/model/pasion_model.dart';
import 'package:daytte/model/response_model.dart';
import 'package:daytte/routes/app_routes.dart';
import 'package:daytte/view/dialogs/dialogHelper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../services/base_service/base_client.dart';
import '../base_controller/baseController.dart';

class UniversityController extends BaseController {
  PassionModel? universityListModel;
  ResponseModel? responseModel;
  int page = 0;
  int limit = 25;
  final storage = GetStorage();

  @override
  void onInit() {
    fetchUniversityList();
    storage.write("page", "4");
    super.onInit();
  }

  fetchUniversityList() async {
    final response = await BaseClient()
        .get('/institution?skip=$page&limit=$limit', storage.read('token'))
        .catchError(BaseController().handleError);
    if (response == null) return;
    if (response != null) {
      universityListModel = PassionModel.fromJson(response);
    }
    update();
  }

  Future postUniversityList(String university) async {
    Map<String, dynamic> payload = {"institute": university};
    DialogHelper.showLoading('Loading...');
    final response = await BaseClient()
        .patch('/users/${storage.read('id')}', payload,storage.read('token'))
        .catchError(BaseController().handleError);
    if (response == null) return;
    DialogHelper.hideLoading();
    if (response != null) {
      String universityScreen = storage.read("university") ?? "";
      if (universityScreen == "EditProfileUniversity") {
        print("edit details edit");
        responseModel = ResponseModel.fromJson(response);
        Get.back();
        storage.write("university", '');
      } else {
        responseModel = ResponseModel.fromJson(response);
        // storage.write("page", "4");
        Get.offAndToNamed(AppRoutes.INTERESTED);
      }
    }
    update();
  }
}
