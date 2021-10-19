import 'package:get/get.dart';

import 'interests_controller.dart';

class InterestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InterestController());
  }
}
