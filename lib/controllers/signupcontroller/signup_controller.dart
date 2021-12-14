import 'package:daytte/controllers/permissionController/permission_controller.dart';
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

class SignupController extends BaseController {
  final List<String> gender = ["Male", "Female"];
  LocationModel? locationModel;

  final GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController email = TextEditingController();
  final location = Get.find<PermissionController>();

  String dateformate = '';
  DateTime selectedDate = DateTime.now();
  final storage = GetStorage();

  @override
  void onInit() {
    _getUserLocation();
    storage.write("page", "1");
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
    locationModel = LocationModel(
        lang: location.locationData?.longitude ?? 0.0,
        lat: location.locationData?.latitude ?? 0.0);
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
        .patch('/users/${storage.read('id')}', payload, storage.read('token'))
        .catchError(BaseController().handleError);
    print("response Otp $payload");
    DialogHelper.hideLoading();
    if (response != null) {
      // storage.write("page", "1");
      Get.offAndToNamed(AppRoutes.CHOOSEGENDER);
    }
  }

  // GenderEnum selectGender = GenderEnum.Male;

  String groupValue = '';
  RxBool check = false.obs;
  RxBool shareLocation = false.obs;

  void handlecheckbox() {
    check.toggle();
    update();
  }

  void handleSharelocation(bool value) {
    shareLocation.value = value;
    update();
  }
}
