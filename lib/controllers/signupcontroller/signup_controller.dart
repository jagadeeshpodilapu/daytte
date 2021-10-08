import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:daytte/routes/app_routes.dart';
import 'package:daytte/services/base_service/base_client.dart';
import 'package:daytte/view/dialogs/dialogHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SignupController extends GetxController {
  final List<String> gender = ["Male", "Female"];

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController email = TextEditingController();

  String dateformate = '';
  DateTime selectedDate = DateTime.now();

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
        .patch('http://65.0.174.202:8000', '/users/5fa8516a0eba1f6071011ffc',
            payload)
        .catchError(BaseController().handleError);
    print("response Otp $response");
    DialogHelper.hideLoading();
    if (response != null) {
      Get.toNamed(AppRoutes.CHOOSEGENDER);
    }
  }
}
