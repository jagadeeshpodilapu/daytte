import 'dart:async';

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
    mobileNumber = Get.arguments;
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

    DialogHelper.hideLoading();
    if (response != null) {
      Get.toNamed(AppRoutes.SIGNUPVIEW);
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
    if (response != null) {
      Get.toNamed(AppRoutes.PASSION);
    }
  }
}
