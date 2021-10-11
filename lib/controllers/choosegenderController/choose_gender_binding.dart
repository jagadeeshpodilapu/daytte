import 'package:daytte/controllers/choosegenderController/choose_gender_controller.dart';
import 'package:get/get.dart';

class ChooseGenderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseGenderController());
  }
}
