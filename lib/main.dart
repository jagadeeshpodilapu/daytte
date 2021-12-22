import 'package:daytte/controllers/splash_controller/splash_binding.dart';
import 'package:daytte/routes/app_routes.dart';
import 'package:daytte/services/internet_connect_checker.dart';
import 'package:daytte/themes/color_styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'routes/app_pages.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
// If you're going to use other Firebase services in the background, such as Firestore,
// make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
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
