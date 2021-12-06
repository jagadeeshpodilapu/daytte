import 'package:daytte/controllers/edit_details/edit_details_controller.dart';
import 'package:daytte/model/response_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../model/pasion_model.dart';
import '../../routes/app_routes.dart';
import '../../services/base_service/base_client.dart';
import '../../view/dialogs/dialogHelper.dart';
import '../base_controller/baseController.dart';

class PassionController extends BaseController {
  final storage = GetStorage();
  int page = 0, limit = 20;
  PassionModel? passionModel;
  ResponseModel? responseModel;
  List<String> listName = [];
  List<String> listId = [];
  List<String> selected = [];
  @override
  void onInit() {
    fetchPassion();
    super.onInit();
  }

  Future fetchPassion() async {
    final response = await BaseClient()
        .get('/passion?skip=$page&limit=$limit', storage.read('token'))
        .catchError(BaseController().handleError);

    if (response != null) {
      passionModel = PassionModel.fromJson(response);
      passionModel!.data.passion!.forEach((element) {
        listName.add(element.name.toString());
        listId.add(element.id.toString());
      });
    }
    update();
  }

  Future postPassition() async {
    Map<String, dynamic> payload = {"passion": listId};
    DialogHelper.showLoading('Loading...');
    final response = await BaseClient()
        .patch('/users/${storage.read("id")}', payload, storage.read('token'))
        .catchError(BaseController().handleError);

    DialogHelper.hideLoading();
    if (response != null) {
      String passionScreen = storage.read("passion")??"";
      if (passionScreen == "EditProfilePassion") {
        responseModel = ResponseModel.fromJson(response);
        Get.toNamed(AppRoutes.EDITDETAILS);
      } else {
        responseModel = ResponseModel.fromJson(response);
        storage.write("page", "3");
        Get.offAndToNamed(AppRoutes.UNIVERSITY);
      }
    }
  }
}
