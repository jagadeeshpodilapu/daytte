import 'package:daytte/controllers/aboutus_controller/about_us_binding.dart';
import 'package:daytte/view/screens/aboutus/aboutus.dart';

import '../controllers/imagepickercontroller/image_picker_binding.dart';
import '../controllers/otpController/otp_binding.dart';
import '../controllers/signupcontroller/signup_binding.dart';
import '../controllers/university/university_binding.dart';
import 'app_routes.dart';
import '../view/screens/choosegender/choose_gender.dart';
import '../view/screens/home/home.dart';
import '../view/screens/login/login.dart';
import '../view/screens/otpverification/otp_verification.dart';
import '../view/screens/passion/passion_screen.dart';
import '../view/screens/pick_images_sources/pick_source_images.dart';
import '../view/screens/signup/signup.dart';
import '../view/screens/university/university.dart';
import '../view/splash_screen.dart';

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
        name: AppRoutes.UNIVERSITY,
        page: () => UniversityView(),
        bindings: [UniversityBinding()]),
    GetPage(
        name: AppRoutes.ABOUTVIEW,
        page: () => AboutUs(),
        bindings: [AboutUsBinding()]),
    GetPage(
        name: AppRoutes.HOMEVIEW,
        page: () => Home(),
        bindings: [ImagePickerBinding()]),
  ];
}
