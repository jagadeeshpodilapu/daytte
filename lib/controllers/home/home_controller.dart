import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  int currentIndex = 0;

  void onTapped(int index) {
    currentIndex = index;
    update();
  }
}
