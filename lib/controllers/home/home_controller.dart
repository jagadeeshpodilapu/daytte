import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  int? index = Get.arguments ?? 0;
  int currentIndex = 0;

  @override
  void onInit() {
    currentIndex = index ?? 0;
    super.onInit();
  }

  void onTapped(int index) {
    currentIndex = index;
    update();
  }
}
