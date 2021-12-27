import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:daytte/model/message_model.dart';

class ChatListController extends BaseController {
  bool isAll = true;
  bool isChat = false;

  ChatModel? sourceChat;
  // var chatmodels = List<ChatModel>.empty(growable: true).obs;
  List<ChatModel> chatmodels = [];

  @override
  void onInit() {
    super.onInit();
    addDataUser();
  }

  void addDataUser() {
    chatmodels.add(ChatModel(
        name: "jagadeesh",
        messageCount: 0,
        time: "4 ",
        lastMessage: "Hi Everyone",
        roomId: 1,
        userId: '1234'));
    chatmodels.add(ChatModel(
        name: "Venkatesh",
        messageCount: 0,
        time: "4 ",
        lastMessage: "Hi Everyone",
        roomId: 2,
        userId: '5678'));

    update();
  }

  funcIsAll(bool all, bool chat) {
    isAll = all;
    isChat = chat;
    update();
  }
}
