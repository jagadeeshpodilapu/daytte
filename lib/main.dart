import 'package:daytte/controllers/splash_controller/splash_binding.dart';
import 'package:daytte/routes/app_routes.dart';
import 'package:daytte/services/internet_connect_checker.dart';
import 'package:daytte/view/screens/discoverpartner/swipe.dart';
import 'package:daytte/view/screens/permissions/permissions.dart';
import 'package:daytte/view/screens/university/university.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'routes/app_pages.dart';
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
        scaffoldBackgroundColor: Color(0xffF7F8FA),
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headline1: TextStyle(color: Color(0xff363636)),
          headline2: TextStyle(color: Color(0xff363636)),
          headline3: TextStyle(color: Color(0xff363636)),
          headline4: TextStyle(color: Color(0xff363636)),
          headline5: TextStyle(color: Color(0xff363636)),
          headline6: TextStyle(color: Color(0xff363636)),
          subtitle1: TextStyle(color: Color(0xff363636)),
          subtitle2: TextStyle(color: Color(0xff363636)),
          bodyText1: TextStyle(color: Color(0xff363636)),
          bodyText2: TextStyle(color: Color(0xff363636)),
        ),
      ),
      // home: ProfileViewEdit(),
      initialBinding: SplashBinding(),
      initialRoute: AppRoutes.SPLASHVIEW,
      defaultTransition: Transition.rightToLeft,
      getPages: AppPages.routes,
    );
  }
}
