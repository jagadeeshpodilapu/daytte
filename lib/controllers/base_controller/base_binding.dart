import 'package:get/get.dart';

import 'baseController.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BaseController());
  }
}
