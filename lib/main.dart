import 'package:daytte/routes/app_pages.dart';
import 'package:daytte/routes/app_routes.dart';
import 'package:daytte/view/screens/video_Audio/video_audio.dart';
import 'package:daytte/view/splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/imagepickercontroller/image_picker_binding.dart';

void main() {
  runApp(/* DevicePreview(builder: (_) => */ MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Daytte',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: ImagePickerBinding(),
      initialRoute: AppRoutes.SPLASHVIEW,
      getPages: AppPages.routes,
    );
  }
}
