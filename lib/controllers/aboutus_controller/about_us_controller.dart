import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:daytte/controllers/otpController/otp_controller.dart';
import 'package:daytte/routes/app_routes.dart';
import 'package:daytte/services/base_service/base_client.dart';
import 'package:daytte/view/dialogs/dialogHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AboutUsController extends GetxController {
  TextEditingController shortDisc = TextEditingController();
  final controller = Get.find<OtpController>();
  final storage = GetStorage();

  updateShortDescription() async {
    final payload = {"shortDescription": shortDisc.text};
    DialogHelper.showLoading('Loading...');
    final response = await BaseClient()
        .patch('/users/${controller.userInfoModel?.userProperties.user?.id}',
            payload, storage.read('token'))
        .catchError(BaseController().handleError);
    print("response Gender $response");
    DialogHelper.hideLoading();
    if (response != null) {
      print("result of gender $response");
      Get.toNamed(AppRoutes.HOMEVIEW);
    }
  }
}
