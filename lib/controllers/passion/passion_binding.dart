import 'package:get/get.dart';

import 'passion_controller.dart';

class PassionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PassionController());
  }
}
