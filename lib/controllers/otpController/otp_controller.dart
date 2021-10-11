import 'dart:convert';
import '../base_controller/baseController.dart';
import '../../model/user_info_model.dart';
import 'package:daytte/routes/app_routes.dart';
import 'package:get_storage/get_storage.dart';
import '../../services/base_service/base_client.dart';
import '../../view/dialogs/dialogHelper.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final storage = GetStorage();

  UserInfoModel? userInfoModel;
  User? user;

  verifyOtp(String otp, String mobile) async {
    Map<String, dynamic> payload = {
      "mobile_number": "+91$mobile",
      "otp": otp,
      "device_token": "randomstringss"
    };

    DialogHelper.showLoading('Verifying Otp');
    final response = await BaseClient()
        .post('/auth/verifyOtp', payload)
        .catchError(BaseController().handleError);

    userInfoModel = userInfoModelFromJson(json.encode(response));

    storage.write("token", userInfoModel!.userProperties.accessToken);

    DialogHelper.hideLoading();
    if (response != null) {
      Get.toNamed(AppRoutes.SIGNUPVIEW);
    }
  }

  reSendOtp(String mobile) async {
    Map<String, dynamic> payload = {
      "mobile_number": "+91$mobile",
    };

    DialogHelper.showLoading('Sending Otp');
    final response = await BaseClient()
        .post('/auth/resendOtp', payload)
        .catchError(BaseController().handleError);
    print("response resend $response");
    DialogHelper.hideLoading();
    if (response != null) {
      Get.toNamed(AppRoutes.PASSION);
    }
  }
}
