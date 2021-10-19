import 'package:daytte/model/response_model.dart';

import '../base_controller/baseController.dart';
import '../otpController/otp_controller.dart';
import '../../model/pasion_model.dart';
import '../../routes/app_routes.dart';
import '../../services/base_service/base_client.dart';
import '../../view/dialogs/dialogHelper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PassionController extends GetxController {
  final storage = GetStorage();
  int page = 0, limit = 20;
  PassionModel? passionModel;
  ResponseModel? responseModel;
  List<String> listName = [];
  List<String> listId = [];
  List<String> selected = [];
  final otpController = Get.find<OtpController>();
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
        .patch('/users/${otpController.userInfoModel?.userProperties.user?.id}',
            payload, storage.read('token'))
        .catchError(BaseController().handleError);

    DialogHelper.hideLoading();
    if (response != null) {
      responseModel = ResponseModel.fromJson(response);
      Get.toNamed(AppRoutes.UNIVERSITY);
    }
  }
}
