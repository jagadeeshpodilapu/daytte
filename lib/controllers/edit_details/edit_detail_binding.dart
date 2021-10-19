import 'package:get/get.dart';

import 'edit_details_controller.dart';

class EditDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditDetailsController());
  }
}
