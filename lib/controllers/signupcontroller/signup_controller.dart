import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:daytte/controllers/otpController/otp_controller.dart';
import 'package:daytte/model/location_model.dart';
import 'package:daytte/routes/app_routes.dart';
import 'package:daytte/services/base_service/base_client.dart';
import 'package:daytte/view/dialogs/dialogHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class SignupController extends GetxController {
  final List<String> gender = ["Male", "Female"];

  Position? currentPostion;

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController email = TextEditingController();

  final controller = Get.find<OtpController>();

  String dateformate = '';
  DateTime selectedDate = DateTime.now();
  final storage = GetStorage();

  /*  void onClickRadioButton(value) {
    select = value;
    update();
  } */

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1970),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      dob..text = DateFormat('dd/MM/yyyy ').format(picked);
      dateformate = DateFormat('yyyy-MM-dd').format(picked);
      update();
    }
  }

  void _getUserLocation() async {
    var position = await GeolocatorPlatform.instance
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    // currentPostion = LocationModel( lang:position.longitude, lat:position!.latitude) as Position?;
  }

  Future postUserInfo() async {
    Map<String, dynamic> payload = {
      "firstname": firstName.text,
      "lastname": lastName.text,
      "email": email.text,
      "dob": dateformate,
      "lat": 0.006180,
      "long": 0.005836
    };

    DialogHelper.showLoading('Loading...');
    final response = await BaseClient()
        .patch('/users/${controller.userInfoModel!.userProperties.user!.id}',
            payload, storage.read('token'))
        .catchError(BaseController().handleError);
    print(
        "response Otp $response  ${storage.read('token')} ${controller.userInfoModel!.userProperties.user!.id}");
    DialogHelper.hideLoading();
    if (response != null) {
      Get.toNamed(AppRoutes.CHOOSEGENDER);
    }
  }
}