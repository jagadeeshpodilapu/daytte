import 'package:daytte/view/screens/otpverification/otp_verification.dart';

import '../base_controller/baseController.dart';
import '../../routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../services/base_service/base_client.dart';
import '../../view/dialogs/dialogHelper.dart';

class LoginController extends GetxController {
  TextEditingController mobileController = TextEditingController();

  void sendOtp(payload) async {
    DialogHelper.showLoading('Sending Otp');
    final response = await BaseClient()
        .post('/auth/sendOtp', payload)
        .catchError(BaseController().handleError);

    DialogHelper.hideLoading();
    if (response != null) {
      Get.toNamed(AppRoutes.OTPVERIFICATION, arguments: mobileController.text);
    }
  }
}
