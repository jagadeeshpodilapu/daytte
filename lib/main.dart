import 'package:daytte/controllers/splash_controller/splash_binding.dart';
import 'package:daytte/routes/app_routes.dart';
import 'package:daytte/services/internet_connect_checker.dart';
import 'package:daytte/themes/color_styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'routes/app_pages.dart';

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
    return ScreenUtilInit(
      designSize: Size(375, 720),
      builder: () => GetMaterialApp(
        title: 'Daytte',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: backgroundColor,
          fontFamily: 'Roboto',
        ),
        //  home: ChatList(),
        initialBinding: SplashBinding(),
        initialRoute: AppRoutes.SPLASHVIEW,
        defaultTransition: Transition.rightToLeft,
        getPages: AppPages.routes,
      ),
    );
  }
}
