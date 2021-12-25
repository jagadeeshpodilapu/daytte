import 'package:daytte/controllers/splash_controller/splashController.dart';
import 'package:daytte/view/screens/chatModule/controller/chat_controller.dart';
import 'package:daytte/view/screens/chatModule/controller/test_controlle.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(() => SplashController());
    Get.lazyPut(() => TestController());
    Get.lazyPut(() => ChatController());
  }
}
