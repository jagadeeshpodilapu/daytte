import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  
  int currentIndex = 0;

  HomeController(this.currentIndex);

  @override
  void onInit() {
    currentIndex = currentIndex;
    super.onInit();
  }

  void onTapped(int index) {
    currentIndex = index;
    update();
  }
}
