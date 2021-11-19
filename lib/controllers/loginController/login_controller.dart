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
    final response =
        await BaseClient().post('/auth/sendOtp', payload).catchError((error) {
      print("send resposnse error $error");
      BaseController().handleError(error);
    });

    DialogHelper.hideLoading();
    if (response != null) {
      print("send Otp response  $response");
      Get.toNamed(AppRoutes.OTPVERIFICATION, arguments: mobileController.text);
    }
  }
}
