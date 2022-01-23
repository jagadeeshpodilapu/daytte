import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:daytte/model/chat_all_model.dart';
import 'package:daytte/model/chat_history_model.dart';
import 'package:daytte/model/message_model.dart';
import 'package:daytte/services/base_service/base_client.dart';
import 'package:daytte/services/base_service/chat_history_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatController extends BaseController {
  final show = false.obs;
  FocusNode focusNode = FocusNode();
  final sendButton = false.obs;
  RxList<MessageModel> messages = RxList<MessageModel>();
  TextEditingController textController = TextEditingController();
  ScrollController scrollController = ScrollController();
  bool isAll = true;
  bool isChat = false;
  final storage = GetStorage();
  bool isConnect = false;
  late IO.Socket socket;
  ChatAllModel? chatmodel;
  List<User> users = [];
  RxInt usersLength = 0.obs;
  ChatHistoryModel? chatHistoryModel;
  RxBool isTyping = true.obs;

  String activeRoom = "general";

  @override
  void onInit() {
    super.onInit();
    fetchChatUsers();
  }

  @override
  void onReady() {
    super.onReady();
    isConnect = false;
  }

  @override
  void onClose() {
    socket.disconnect();
    socket.clearListeners();
    socket.close();
    isConnect = false;
  }

  void connect() {
    socket = IO.io("http://65.0.174.202:9000/chat", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();

    socket.onConnect((data) {
      print("Connected  $data");
      isConnect = true;
      socket.emit("joinRoom", this.activeRoom);

      /*   socket.on("listChatHistory", (chatHistory) {
        print("chatHistory data is $chatHistory");
        socket.emit('allChats', {
          "sender": '61cc7208a5541d18568e3b05',
          "receiver": '61c99db3a5541d18568e382e',
          "page": 1,
          "limit": 10,
          "room": this.activeRoom,
        });
      }); */
      print("isconnect" + socket.connected.toString());
      socket.on("msgToClient", (msg) {
        setMessage(
            "destination", msg["message"], msg['sender'], msg['receiver']);

        print("message $msg");
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      });
    });

    socket.onDisconnect((_) {
      isConnect = false;
      socket.emit("leaveRoom", this.activeRoom);
    });
    isConnect = true;
  }

  void setMessage(
      String type, dynamic msg, String senderId, String receiverId) {
    MessageModel messageModel = MessageModel(
      type: type,
      message: msg,
      senderId: senderId,
      receiverd: receiverId,
      time: DateTime.now().toString().substring(10, 16),
    );

    messages.add(messageModel);
    // messages.value = messages.reversed.toList();
    update();
  }

  void sendMessage(
      {required String message,
      required String receiverId,
      required String senderId}) {
    // setMessage("source", message, senderId, receiverId);
    socket.emit("msgToServer", {
      "sender": senderId,
      "receiver": receiverId,
      "message": message,
      "room": this.activeRoom,
      "isRead": true,
      "messageType": 1,
    });
    print("name   $message $receiverId ");
  }

  funcIsAll(bool all, bool chat) {
    isAll = all;
    isChat = chat;
    update();
  }

  isListRevere() {
    isTyping.value = false;
    update();
  }

  Future fetchChatUsers() async {
    final response = await BaseClient()
        .get('/users/chat/all?page=1&limit=10&userId=${storage.read('id')}',
            storage.read('token'))
        .catchError(BaseController().handleError);

    if (response != null) {
      chatmodel = ChatAllModel.fromJson(response);
      if (chatmodel != null) {
        users = chatmodel?.data.users ?? [];
        usersLength.value = chatmodel?.data.users?.length ?? 0;
      }
      update();
    }
  }
  // http://65.0.174.202:9000/chat?sender=61ed0af4650082734809304d&receiver=61ed0af4650082734809304e&page=1&limit=10

  Future fetchChatAllDetails(String sender, String reciever) async {
    final response = await ChatHistoryService()
        .getChatHistory(
            "61cc7208a5541d18568e3b05", "61c99db3a5541d18568e382e", 1, 150)
        .catchError(BaseController().handleError);

    if (response != null) {
      chatHistoryModel = ChatHistoryModel.fromJson(response);

      if (chatHistoryModel!.data.chats!.isNotEmpty) {
        chatHistoryModel?.data.chats?.forEach((element) {
          print("chat history list reversed ${element.message}");

          setMessage(
            "destination",
            element.message,
            element.sender.toString(),
            element.receiver.toString(),
          );
          print("messages length is ${messages.length}");
        });
      }
    }
  }
}
