import 'package:daytte/model/message_model.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  ChatModel? sourceChat;
  // var chatmodels = List<ChatModel>.empty(growable: true).obs;
  List<ChatModel> chatmodels = [];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    addDataUser();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void addDataUser() {
    chatmodels.add(new ChatModel(
      name: "jagadeesh",
      messageCount: 0,
      time: "4 ",
      lastMessage: "Hi Everyone",
      roomId: 1,
      userId: '1234'
    ));
    chatmodels.add(new ChatModel(
      name: "Raji",
      messageCount: 0,
      time: "4 ",
      lastMessage: "Hi Everyone",
      roomId: 2,
      userId: '5678'
    ));

    update();
  }

  
}
