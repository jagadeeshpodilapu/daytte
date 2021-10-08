import 'package:daytte/controllers/imagepickercontroller/image_picker_binding.dart';
import 'package:daytte/controllers/otpController/otp_binding.dart';
import 'package:daytte/controllers/signupcontroller/signup_binding.dart';
import 'package:daytte/routes/app_routes.dart';
import 'package:daytte/view/screens/choosegender/choose_gender.dart';
import 'package:daytte/view/screens/home/home.dart';
import 'package:daytte/view/screens/login/login.dart';
import 'package:daytte/view/screens/otpverification/otp_verification.dart';
import 'package:daytte/view/screens/passion/passion_screen.dart';
import 'package:daytte/view/screens/pick_images_sources/pick_source_images.dart';
import 'package:daytte/view/screens/signup/signup.dart';
import 'package:daytte/view/splash_screen.dart';

import 'package:get/get.dart';

class AppPages {
  static List<GetPage> routes = [
    GetPage(
        name: AppRoutes.SPLASHVIEW, page: () => SplashScreen(), bindings: []),
    GetPage(name: AppRoutes.LOGINVIEW, page: () => Login(), bindings: []),
    GetPage(
        name: AppRoutes.SIGNUPVIEW,
        page: () => SignUp(),
        bindings: [SignupBinding()]),
    GetPage(
        name: AppRoutes.OTPVERIFICATION,
        page: () => OtpVerification(),
        bindings: [OtpBinding()]),
    GetPage(name: AppRoutes.CHOOSEGENDER, page: () => ChooseGender()),
    GetPage(name: AppRoutes.PASSION, page: () => PassionSCreen()),
    GetPage(
        name: AppRoutes.CHOOSEIMAGE,
        page: () => SelectImagesSource(),
        bindings: [ImagePickerBinding()]),
    GetPage(
        name: AppRoutes.HOMEVIEW,
        page: () => Home(),
        bindings: [ImagePickerBinding()]),
  ];
}
