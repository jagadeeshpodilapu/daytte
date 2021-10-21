import 'package:get/get.dart';

import 'select_image_controller.dart';

class ImagePickerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectImagesController());
  }
}
