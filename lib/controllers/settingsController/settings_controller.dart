import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:daytte/controllers/permissionController/permission_controller.dart';
import 'package:daytte/model/response_model.dart';
import 'package:daytte/model/single_user_model.dart';
import 'package:daytte/routes/app_routes.dart';
import 'package:daytte/services/base_service/base_client.dart';
import 'package:daytte/view/dialogs/dialogHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends BaseController {
  RxDouble maxDistance = 20.0.obs;
  Rx<RangeValues> rangeValues = RangeValues(18, 30).obs;
  RxBool showme = true.obs;
  final storage = GetStorage();
  SingleUserModel? userInfoModel;
  ResponseModel? responseModel;

  @override
  void onInit() {
    getUserSettingsPreferences();
    super.onInit();
  }

  changeMaxDistance(double distance) {
    maxDistance.value = distance;
    update();
  }

  updateAgeRange(RangeValues range) {
    rangeValues.value = range;
    update();
  }

  void showMeOnDaytee() {
    showme.toggle();
    update();
  }

/*   getUserAddressName()async {
    final coordinates = new Coordinates(1.10, 45.50);
 final addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
first = addresses.first;
print("${first.featureName} : ${first.addressLine}");
  } */

  Future updateUserPreferences(int i) async {
    Map payload = {};
    if (i == 0) {
      payload = {
        "filterRadius": maxDistance.value.toInt(),
        "showAgeRange": [
          rangeValues.value.start.toInt(),
          rangeValues.value.end.toInt()
        ],
        "showMe": showme.value
      };
    } else {
      payload = {"is_deleted": true};
    }

    DialogHelper.showLoading('Loading...');
    final response = await BaseClient()
        .patch('/users/${storage.read("id")}', payload, storage.read('token'))
        .catchError(BaseController().handleError);

    if (response != null) {
      responseModel = ResponseModel.fromJson(response);
      print("user response single settings $responseModel $response");
    }
    DialogHelper.hideLoading();
  }

  void clearStorage() {
    storage.write("id", "");
    storage.write("token", "");
    storage.write("page", "0");
    storage.write("isLogged", false);
    Get.offAllNamed(AppRoutes.LOGINVIEW);
  }

  Future getUserSettingsPreferences() async {
    final response = await BaseClient()
        .get('/users/${storage.read("id")}', storage.read('token'))
        .catchError(BaseController().handleError);

    if (response != null) {
      userInfoModel = SingleUserModel.fromJson(response);
      maxDistance.value =
          userInfoModel?.data.user?.filterRadius?.toDouble() ?? 0.0;
      rangeValues.value = RangeValues(
        userInfoModel?.data.user?.showAgeRange?.first.toDouble() ?? 18,
        userInfoModel?.data.user?.showAgeRange?.last.toDouble() ?? 30,
      );
      showme.value = userInfoModel?.data.user?.showMe ?? true;
    }
    update();
  }
}
