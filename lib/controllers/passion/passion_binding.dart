import 'package:daytte/controllers/passion/passion_controller.dart';
import 'package:get/get.dart';

class PassionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PassionController());
  }
}
