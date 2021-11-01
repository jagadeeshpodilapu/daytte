import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

void onBackPressed() => Get.back();

printData({Object? className, String? method, Object? data}) {
  return debugPrint("$className : $method : $data");
}
