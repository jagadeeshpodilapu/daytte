import 'dart:async';

import 'package:daytte/view/screens/permissions/enable_permission.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart';

import '../../model/user_info_model.dart';
import '../../routes/app_routes.dart';
import '../../services/base_service/base_client.dart';
import '../../view/dialogs/dialogHelper.dart';
import '../base_controller/baseController.dart';

class OtpController extends BaseController {
  final storage = GetStorage();
  Timer? _timer;

  TextEditingController otpInput = TextEditingController();

  int start = 30;
  late String mobileNumber;
  UserInfoModel? userInfoModel;
  User? user;
  bool isChange = false;
  RxString deviceToken = ''.obs;

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
    storage.write('page', "1");
    mobileNumber = Get.arguments ?? "";
    getDeviceToken();
    startTimer();
  }

  getDeviceToken() async {
    deviceToken.value = (await FirebaseMessaging.instance.getToken())!;
    storage.write("device_token", deviceToken.value);
    print("device token $deviceToken.value");
  }

  @override
  void onClose() {
    _timer!.cancel();
  }

  Future verifyOtp(String otp, String mobile) async {
    Map<String, dynamic> payload = {
      "mobile_number": "+91$mobile",
      "otp": otp,
      "device_token": deviceToken.value
    };

    print("payload otp $payload");
    DialogHelper.showLoading('Verifying Otp');
    final response = await BaseClient()
        .post('/auth/verifyOtp', payload)
        .catchError(handleError);

    if (response == null) return;

    userInfoModel = UserInfoModel.fromJson(response);

    storage.write("token", userInfoModel?.userProperties.accessToken);
    storage.write("id", userInfoModel?.userProperties.user?.id);
    print("user response is $response");

    if (userInfoModel != null) {
      if (userInfoModel!.userProperties.user!.newUser!) {
        var location = await Location().hasPermission();
        if (location != PermissionStatus.granted) {
          Get.off(() => EnablePermsions());
        } else {
          Get.offAndToNamed(AppRoutes.SIGNUPVIEW);
        }
      } else {
        storage.write('page', "8");
        Navigator.popAndPushNamed(Get.context!, AppRoutes.HOMEVIEW);
      }
    }
    print("otp response $response");
  }

  reSendOtp(String mobile) async {
    Map<String, dynamic> payload = {
      "mobile_number": "+91$mobile",
    };

    DialogHelper.showLoading('Sending Otp');

    final response = await BaseClient()
        .post('/auth/resendOtp', payload)
        .catchError(handleError);
    print("response resend $response");
    DialogHelper.hideLoading();
  }
}
