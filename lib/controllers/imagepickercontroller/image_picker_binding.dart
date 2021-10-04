import 'package:daytte/controllers/imagepickercontroller/select_image_controller.dart';
import 'package:get/get.dart';

class ImagePickerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectImagesController());
  }
}
