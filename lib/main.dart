import 'package:daytte/controllers/splash_controller/splash_binding.dart';
import 'package:daytte/routes/app_routes.dart';
import 'package:daytte/services/internet_connect_checker.dart';
import 'package:daytte/themes/color_styles.dart';
import 'package:daytte/view/screens/chatrequest/chat_request.dart';
import 'package:daytte/view/screens/discoverpartner/swipe.dart';
import 'package:daytte/view/screens/permissions/enable_permission.dart';
import 'package:daytte/view/screens/signup/signup.dart';
import 'package:daytte/view/screens/university/university.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'routes/app_pages.dart';
import 'view/dialogs/premium_dialogs/platinum_package.dart';
import 'view/screens/discoverpartner/expand_discover_partner.dart';
import 'view/screens/permissions/meet_people.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget with WidgetsBindingObserver {
  MyApp() {
    NetworkUtils().streamSubscribeConnectivityListener();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Daytte',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: backgroundColor,
        fontFamily: 'Roboto',
      ),
    //  home: CheckTest(),
      initialBinding: SplashBinding(),
      initialRoute: AppRoutes.SPLASHVIEW,
      defaultTransition: Transition.rightToLeft,
      getPages: AppPages.routes,
    );
  }
}
