import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:daytte/services/base_service/base_client.dart';
import 'package:daytte/view/dialogs/dialogHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  RxDouble maxDistance = 20.0.obs;
  Rx<RangeValues> rangeValues = RangeValues(18, 30).obs;
  RxBool showme = true.obs;
  final storage = GetStorage();

  changeMaxDistance(double distance) {
    maxDistance.value = distance;
    updateUserPreferences();
    update();
  }

  updateAgeRange(RangeValues range) {
    rangeValues.value = range;
    updateUserPreferences();
    update();
  }

  void showMeOnDaytee() {
    showme.toggle();
    update();
  }

  Future updateUserPreferences() async {
    print("updateUserPreferences called");
    final payload = {
      "filterRadius": maxDistance.value.toInt(),
      "showAgeRange": [rangeValues.value],
      "showMe": showme.value
    };
    DialogHelper.showLoading('Loading...');
    final response = await BaseClient()
        .patch('/users/${storage.read("id")}', payload, storage.read('token'))
        .catchError(BaseController().handleError);

    if (response != null) {
      print("response settings $response");
    }
    DialogHelper.hideLoading();
  }
}
