import 'package:daytte/controllers/chatlist_controller/chatlist_controller.dart';
import 'package:get/get.dart';

class ChatListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatListController());
  }
}
