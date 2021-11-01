import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../routes/app_routes.dart';
import '../../services/base_service/base_client.dart';
import '../../view/dialogs/dialogHelper.dart';
import '../base_controller/baseController.dart';

class AboutUsController extends GetxController {
  TextEditingController shortDisc = TextEditingController();
  
  final storage = GetStorage();

  updateShortDescription() async {
    final payload = {"shortDescription": shortDisc.text};
    DialogHelper.showLoading('Loading...');
    final response = await BaseClient()
        .patch('/users/${storage.read("id")}',
            payload, storage.read('token'))
        .catchError(BaseController().handleError);
    print("response Gender $response");
    DialogHelper.hideLoading();
    if (response != null) {
      print("result of gender $response");
      storage.write("page", "6");
      Get.offAndToNamed(AppRoutes.EDITDETAILS);
    }
  }
}
