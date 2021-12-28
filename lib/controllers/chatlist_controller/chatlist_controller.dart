import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:daytte/model/message_model.dart';
import 'package:get_storage/get_storage.dart';

class ChatListController extends BaseController {
  bool isAll = true;
  bool isChat = false;
  final storage = GetStorage();
  ChatModel? sourceChat;
  List<ChatModel> chatmodels = [];

  @override
  void onInit() {
    super.onInit();
  }

  void addDataUser() {
    chatmodels.add(ChatModel(
        name: "jagadeesh",
        messageCount: 0,
        time: "4 ",
        lastMessage: "Hi Everyone",
        roomId: 1,
        userId: storage.read('id')));
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
