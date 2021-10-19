import 'package:get/get.dart';

import 'university_controller.dart';

class UniversityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UniversityController());
  }
}
