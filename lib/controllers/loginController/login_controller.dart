import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:daytte/routes/app_routes.dart';
import 'package:daytte/services/base_service/base_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:daytte/view/dialogs/dialogHelper.dart';

class LoginController extends GetxController {
  TextEditingController mobileController = TextEditingController();

  void sendOtp(payload) async {
    DialogHelper.showLoading('Sending Otp');
    final response = await BaseClient()
        .post('http://65.0.174.202:8000', '/auth/sendOtp', payload)
        .catchError(BaseController().handleError);

    DialogHelper.hideLoading();
    if (response != null) {
      Get.toNamed(AppRoutes.OTPVERIFICATION, arguments: mobileController.text);
    }
  }
}
