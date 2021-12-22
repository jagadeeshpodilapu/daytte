import 'package:get/get.dart';

class TestHomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print("initlku ");
  }

  @override
  void onReady() {
    super.onReady();
    print("initlku2 ");
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
