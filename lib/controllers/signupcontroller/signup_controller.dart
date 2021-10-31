import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../model/location_model.dart';
import '../../routes/app_routes.dart';
import '../../services/base_service/base_client.dart';
import '../../view/dialogs/dialogHelper.dart';
import '../base_controller/baseController.dart';
import '../otpController/otp_controller.dart';

class SignupController extends GetxController {
  final List<String> gender = ["Male", "Female"];
  LocationModel? locationModel;
  Position? currentPostion;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController email = TextEditingController();

  

  String dateformate = '';
  DateTime selectedDate = DateTime.now();
  final storage = GetStorage();

  /*  void onClickRadioButton(value) {
    select = value;
    update();
  } */

  @override
  void onInit() {
    _getUserLocation();
    super.onInit();
  }

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
    locationModel =
        LocationModel(lang: position.longitude, lat: position.latitude);
  }

  Future postUserInfo() async {
    Map<String, dynamic> payload = {
      "firstname": firstName.text,
      "lastname": lastName.text,
      "email": email.text,
      "dob": dateformate,
      "lat": locationModel!.lat,
      "long": locationModel!.lang
    };

    DialogHelper.showLoading('Loading...');
    final response = await BaseClient()
        .patch('/users/${storage.read('id')}',
            payload, storage.read('token'))
        .catchError(BaseController().handleError);
    print("response Otp $payload");
    DialogHelper.hideLoading();
    if (response != null) {
      storage.write("page", "1");
      Get.offAndToNamed(AppRoutes.CHOOSEGENDER);
    }
  }

  // GenderEnum selectGender = GenderEnum.Male;

  String groupValue = '';
  RxBool check = false.obs;
  RxBool shareLocation = false.obs;

  void handlecheckbox(bool value) {
    check.value = value;
    update();
  }

  void handleSharelocation(bool value) {
    shareLocation.value = value;
    update();
  }
}
