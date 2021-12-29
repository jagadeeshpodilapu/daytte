import 'package:daytte/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatController extends GetxController {
  final show = false.obs;
  FocusNode focusNode = FocusNode();
  final sendButton = false.obs;
  RxList<MessageModel> messages = RxList<MessageModel>();
  TextEditingController textController = TextEditingController();
  ScrollController scrollController = ScrollController();
  bool isAll = true;
  bool isChat = false;
  final storage = GetStorage();

  late IO.Socket socket;

  String activeRoom = "general";

  @override
  void onInit() {
    super.onInit();

   /*  focusNode.addListener(() {
      if (focusNode.hasFocus) {
        show.value = false;
        update();
      }
    }); */
    connect();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    socket.disconnect();
    socket.clearListeners();
    socket.close();
    print("on close called");
  }

  void connect() {
    socket = IO.io("http://65.0.174.202:9000/chat", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();

    socket.onConnect((data) {
      print("Connected  $data");

      socket.emit("joinRoom", this.activeRoom);

      print("isconnect" + socket.connected.toString());
      socket.on("msgToClient", (msg) {
        setMessage("destination", msg["text"], msg['userId']);

        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      });
    });
    socket.onDisconnect((_) {
      print('disconnect');
      socket.emit("leaveRoom", this.activeRoom);
    });
    update();
  }

  void setMessage(String type, msg, String userId) {
    MessageModel messageModel = MessageModel(
        type: type,
        message: msg,
        userId: userId,
        time: DateTime.now().toString().substring(10, 16));

    messages.add(messageModel);

    update();
  }

  void sendMessage(String message, int roomId, String roomName, String userId,
      String userName) {
    // setMessage("source", message, userId);
    socket.emit("msgToServer", {
      "name": userName,
      "text": message,
      "room": this.activeRoom,
      "userId": userId
    });
    print("name $userName  $message $userId ");
  }

  funcIsAll(bool all, bool chat) {
    isAll = all;
    isChat = chat;
    update();
  }
}
