import 'package:daytte/controllers/university/university_controller.dart';
import 'package:get/get.dart';

class UniversityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UniversityController());
  }
}
