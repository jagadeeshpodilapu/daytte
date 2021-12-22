import 'package:daytte/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatController extends GetxController {
  final show = false.obs;
  FocusNode focusNode = FocusNode();
  final sendButton = false.obs;
  RxList<MessageModel> messages = RxList<MessageModel>();
  TextEditingController textController = TextEditingController();
  ScrollController scrollController = ScrollController();

  late IO.Socket socket;

  @override
  void onInit() {
    super.onInit();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        show.value = false;
        update();
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void connect(int sourchatId) {
    socket = IO.io("http://65.0.174.202:9000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();

    socket.onConnect((data) {
      print("Connected");
      socket.on("msgToClient", (msg) {
        setMessage("destination", msg["message"]);
        print("recievd msg $msg");
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      });
    });
    update();
    print(" isconnect " + socket.connected.toString());
  }

  void setMessage(String type, msg) {
    MessageModel messageModel = MessageModel(
        type: type,
        message: msg,
        time: DateTime.now().toString().substring(10, 16));

    messages.add(messageModel);
    print("set message $messages");

    update();
  }

  void sendMessage(String message, int roomId, String roomName, String userId,
      String userName) {
    setMessage("source", message);
    socket.emit("msgToServer", {
      "name": userName,
      "text": message,
      "room": 'general',
      "userId": userId
    });
    print("name $userName  $message $userId");
    update();
  }
}
