import 'dart:convert';

import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:daytte/controllers/permissionController/permission_controller.dart';
import 'package:daytte/model/response_model.dart';
import 'package:daytte/model/single_user_model.dart';
import 'package:daytte/routes/app_routes.dart';
import 'package:daytte/services/base_service/base_client.dart';
import 'package:daytte/view/dialogs/dialogHelper.dart';
import 'package:dio/dio.dart';
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

  final PermissionController location = Get.find<PermissionController>();

  @override
  void onInit() {
    getUserSettingsPreferences();
    getAddressFromLatLng(
        location.locationData?.latitude, location.locationData?.longitude);
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
    storage.erase();
    Get.offAllNamed(AppRoutes.LOGINVIEW);
  }

  Future getUserSettingsPreferences() async {
    final response = await BaseClient()
        .get('/users/${storage.read("id")}', storage.read('token'))
        .catchError(BaseController().handleError);

    print("seetiings model response $response");

    if (response != null) {
      userInfoModel = SingleUserModel.fromJson(response);
      maxDistance.value =
          userInfoModel?.data.user?.filterRadius?.toDouble() ?? 0.0;
      rangeValues.value = RangeValues(
        userInfoModel?.data.user?.showAgeRange?.first.toDouble() ??
            18.toDouble(),
        userInfoModel?.data.user?.showAgeRange?.last.toDouble() ??
            30.toDouble(),
      );
      print("user response  settings ${userInfoModel?.data.user?.location}");
      showme.value = userInfoModel?.data.user?.showMe ?? true;
    }
    update();
  }

  getAddressFromLatLng(lat, lng) async {
    String apiKey = "AIzaSyDmbVg7qWTFADor0O6zQgqRtAPEunh380c";
    String _host = 'https://maps.google.com/maps/api/geocode/json';
    final url = '$_host?key=$apiKey&language=en&latlng=$lat,$lng';
    final http = Dio();
    if (lat != null && lng != null) {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.data);
        String _formattedAddress = data["results"][0]["formatted_address"];
        print("response ==== $_formattedAddress");
        return _formattedAddress;
      } else
        return null;
    } else
      return null;
  }
}
