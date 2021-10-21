import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../services/base_service/base_client.dart';
import '../../view/dialogs/dialogHelper.dart';
import '../base_controller/baseController.dart';

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
