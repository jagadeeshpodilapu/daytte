import 'dart:async';
import 'dart:convert';

import 'package:daytte/utils/common_functions.dart';

import '../base_controller/baseController.dart';
import '../../model/user_info_model.dart';
import '../../routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../services/base_service/base_client.dart';
import '../../view/dialogs/dialogHelper.dart';

class OtpController extends GetxController {
  final storage = GetStorage();
  Timer? _timer;

  TextEditingController otpInput = TextEditingController();

  int start = 30;
  late String mobileNumber;
  UserInfoModel? userInfoModel;
  User? user;
  bool isChange = false;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          timer.cancel();
        } else {
          start--;
        }
      },
    );
  }

  funcIsChange(bool boolChange) {
    isChange = boolChange;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    mobileNumber = Get.arguments ?? "";
    startTimer();
  }

  @override
  void onClose() {
    _timer!.cancel();
  }

  verifyOtp(String otp, String mobile) async {
    Map<String, dynamic> payload = {
      "mobile_number": "+91$mobile",
      "otp": otp,
      "device_token": "randomstringss"
    };

    DialogHelper.showLoading('Verifying Otp');
    final response = await BaseClient()
        .post('/auth/verifyOtp', payload)
        .catchError(BaseController().handleError);

    userInfoModel = UserInfoModel.fromJson(response);

    storage.write("token", userInfoModel?.userProperties.accessToken);

    printData(className: this.runtimeType, data: response);

    DialogHelper.hideLoading();
    if (response != null) {
      if (userInfoModel != null) {
        if (userInfoModel!.userProperties.user!.newUser!) {
          gotoPage();
        } else {
          Get.toNamed(AppRoutes.HOMEVIEW);
        }
      }
    }
  }

  reSendOtp(String mobile) async {
    Map<String, dynamic> payload = {
      "mobile_number": "+91$mobile",
    };

    DialogHelper.showLoading('Sending Otp');
    final response = await BaseClient()
        .post('/auth/resendOtp', payload)
        .catchError(BaseController().handleError);
    print("response resend $response");
    DialogHelper.hideLoading();
  }

  void gotoPage() {
    final String pageNumber = storage.read('page');
    switch (pageNumber) {
      case '1':
        Get.toNamed(AppRoutes.SIGNUPVIEW);
        break;
      case '2':
        Get.toNamed(AppRoutes.CHOOSEGENDER);
        break;
      case '3':
        Get.toNamed(AppRoutes.PASSION);
        break;
      case '4':
        Get.toNamed(AppRoutes.UNIVERSITY);
        break;
      case '5':
        Get.toNamed(AppRoutes.INTERESTED);
        break;
      case '6':
        Get.toNamed(AppRoutes.ABOUTVIEW);
        break;
      case '7':
        Get.toNamed(AppRoutes.PROFILEVIEW);
        break;
    }
  }
}
