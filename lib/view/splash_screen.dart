import 'dart:async';

import '../consts/image_constants.dart';
import '../routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () => Get.offNamed(AppRoutes.LOGINVIEW));
  }

  getDeviceToken() async {
// Get the token each time the application loads
    /*   String? token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      print(token);
      storeage.writeIfNull("token", '$token');
    } */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      child: Image.asset(
        ImageConstants.splash,
        fit: BoxFit.cover,
      ),
    )

        /* SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            FractionallySizedBox(
              heightFactor: 0.6,
              alignment: Alignment.topCenter,
              child: Container(
                child: Image.asset(
                  'assets/images/girl.jpg',
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.colorBurn,
                ),
                /* decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.blue, Colors.blue],
                )), */
              ),
                 
            ),
            FractionallySizedBox(
              heightFactor: 0.4,
              alignment: Alignment.bottomCenter,
              child: Center(
                child: Image.asset(
                  ImageConstants.daytte_logo,
                  height: 200,
                  width: 200,
                ),
              ),
            ),
          ],
        ), */
        );
  }
}
