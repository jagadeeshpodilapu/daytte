import 'package:daytte/controllers/permissionController/permission_binding.dart';

import '../controllers/discover_partner/discover_partner_binding.dart';
import '../controllers/edit_details/edit_detail_binding.dart';
import '../controllers/findnearest/find_nearest_binding.dart';
import '../controllers/loginController/login_bining.dart';
import '../controllers/passion/passion_binding.dart';
import '../controllers/settingsController/settins_binding.dart';
import '../view/screens/discoverpartner/discover_partner.dart';
import '../view/screens/editdetails/edit_details.dart';
import '../view/screens/interested/interested.dart';
import '../view/screens/likedetails/like_details.dart';
import '../view/screens/profiledetails/profile_details.dart';
import '../view/screens/settings/settings.dart';
import 'package:get/get.dart';
import '../controllers/aboutus_controller/about_us_binding.dart';
import '../controllers/imagepickercontroller/image_picker_binding.dart';
import '../controllers/otpController/otp_binding.dart';
import '../controllers/signupcontroller/signup_binding.dart';
import '../controllers/university/university_binding.dart';
import '../view/screens/aboutus/aboutus.dart';
import '../view/screens/choosegender/choose_gender.dart';
import '../view/screens/home/home.dart';
import '../view/screens/login/login.dart';
import '../view/screens/otpverification/otp_verification.dart';
import '../view/screens/passion/passion_screen.dart';
import '../view/screens/pick_images_sources/pick_source_images.dart';
import '../view/screens/signup/signup.dart';
import '../view/screens/university/university.dart';
import '../view/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static List<GetPage> routes = [
    GetPage(
        name: AppRoutes.SPLASHVIEW,
        page: () => SplashScreen(),
        bindings: [SignupBinding(), PermissionBinding()]),
    GetPage(
        name: AppRoutes.LOGINVIEW,
        page: () => Login(),
        bindings: [LoginBinding(), OtpBinding()]),
    GetPage(
        name: AppRoutes.SIGNUPVIEW,
        page: () => SignUp(),
        bindings: [SignupBinding(), OtpBinding()]),
    GetPage(
        name: AppRoutes.OTPVERIFICATION,
        page: () => OtpVerification(),
        bindings: [OtpBinding()]),
    GetPage(name: AppRoutes.CHOOSEGENDER, page: () => ChooseGender()),
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
        name: AppRoutes.PASSION,
        page: () => PassionSCreen(),
        bindings: [PassionBinding()]),
    GetPage(
        name: AppRoutes.HOMEVIEW,
        page: () => Home(),
        bindings: [FindNearestBinding()]),
    GetPage(
        name: AppRoutes.PROFILEVIEW, page: () => ProfileView(), bindings: []),
    GetPage(name: AppRoutes.LIKESVIEW, page: () => LikesPage(), bindings: []),
    GetPage(
        name: AppRoutes.DISCOVER,
        page: () => DiscoverPartner(),
        bindings: [DiscoverPartnerBinding()]),
    GetPage(
        name: AppRoutes.INTERESTED,
        page: () => InterestedScreen(),
        bindings: []),
    GetPage(
        name: AppRoutes.SETTINGSVIEW,
        page: () => Settings(),
        bindings: [SettingsBinding()]),
    GetPage(
        name: AppRoutes.EDITDETAILS,
        page: () => EditDetails(),
        bindings: [EditDetailsBinding(), FindNearestBinding()]),
  ];
}
