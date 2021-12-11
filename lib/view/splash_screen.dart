import 'dart:async';

import 'package:daytte/consts/image_constants.dart';
import 'package:daytte/controllers/splash_controller/splashController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    Timer(4.seconds, () {
      
      Get.find<SplashController>().gotoPage();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          fit: StackFit.expand,
      children: [
        SvgPicture.asset(
          ImageConstants.splash_background,
          fit: BoxFit.cover,
        ),
        SvgPicture.asset(
          ImageConstants.hearth_background,
          fit: BoxFit.cover,
        ),
        Center(
          child: SvgPicture.asset(
            ImageConstants.wooly_background,
            fit: BoxFit.cover,
          ),
        ),
      ],
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
