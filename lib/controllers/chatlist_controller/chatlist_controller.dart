import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:daytte/model/chat_all_model.dart';
import 'package:daytte/model/message_model.dart';
import 'package:daytte/services/base_service/base_client.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChatListController extends BaseController {
  bool isAll = true;
  bool isChat = false;
  final storage = GetStorage();
  ChatModel? sourceChat;
  List<ChatModel> chatmodels = [];
  ChatAllModel? chatmodel;
  List<User> users = [];
  RxInt usersLength = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchChatAllDetails();
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

  Future fetchChatAllDetails() async {
    final response = await BaseClient()
        .get('/users/chat/all?page=1&limit=10&userId=61c98f83a5541d18568e37e6',
            storage.read('token'))
        .catchError(BaseController().handleError);

    print("storage value ${storage.read("id")} ${storage.read("token")}");

    if (response != null) {
      print("chat response $response");
      chatmodel = ChatAllModel.fromJson(response);
      if (chatmodel != null) {
        users = chatmodel?.data.users ?? [];
        usersLength.value = chatmodel?.data.users?.length ?? 0;
        print("users ==> $users ${usersLength.value}");
      }
      update();
    }
  }
}
