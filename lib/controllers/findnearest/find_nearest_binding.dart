import 'package:daytte/controllers/findnearest/find_nearest_controller.dart';
import 'package:get/get.dart';

class FindNearestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FindNearestController(), fenix: true);
  }
}
