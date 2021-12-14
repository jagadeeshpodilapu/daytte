import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:daytte/controllers/otpController/otp_controller.dart';
import 'package:daytte/model/response_model.dart';
import 'package:daytte/routes/app_routes.dart';
import 'package:daytte/services/base_service/base_client.dart';
import 'package:daytte/view/dialogs/dialogHelper.dart';
import 'package:daytte/view/widgets/enums.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InterestController extends BaseController {
  Gender selctedGender = Gender.Male;

  final storage = GetStorage();
  ResponseModel? responseModel;

  @override
  void onInit() {
    storage.write("page", "5");
    super.onInit();
  }

  handleGenderChange(Gender? value) {
    selctedGender = value!;
    update();
  }


  Future updateInterestedStatus() async {
    Map<String, dynamic> payload = {
      "interestedIn": selctedGender.toString().split('.').last
    };
    DialogHelper.showLoading('Loading...');
    final response = await BaseClient()
        .patch('/users/${storage.read("id")}', payload, storage.read('token'))
        .catchError(BaseController().handleError);
    print("response Gender $response");
    DialogHelper.hideLoading();
    if (response != null) {
      String getStorageValue = storage.read("setting") ?? "";
      if (getStorageValue == "selectGender") {
        responseModel = ResponseModel.fromJson(response);
        Get.back();
        storage.write("setting", "");
      } else {
        responseModel = ResponseModel.fromJson(response);
        // storage.write("page", "5");
        Get.offAndToNamed(AppRoutes.ABOUTVIEW);
      }
    }
  }
}
