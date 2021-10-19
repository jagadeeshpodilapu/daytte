import 'package:get/get.dart';

import 'like_details_controller.dart';

class LikeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LikeController());
  }
}
