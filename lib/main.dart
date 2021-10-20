import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/imagepickercontroller/image_picker_binding.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
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
      initialRoute: AppRoutes.EdITDETAILS,
      getPages: AppPages.routes,
    );
  }
}
