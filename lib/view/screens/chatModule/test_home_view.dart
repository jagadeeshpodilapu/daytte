import 'package:daytte/model/message_model.dart';
import 'package:daytte/view/screens/chatModule/chat_view.dart';
import 'package:daytte/view/screens/chatModule/controller/test_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestHomeView extends GetView<TestHomeController> {
  
  List<ChatModel>? chatmodels;
  ChatModel? sourceChat;
  TestHomeView({this.chatmodels, this.sourceChat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HomeView'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: chatmodels?.length,
          itemBuilder: (contex, index) => InkWell(
            onTap: () {
              print(sourceChat?.roomId.toString());
              print(sourceChat?.name.toString());
              Get.to(ChatView(
                chatModel: chatmodels,
                sourceChat: sourceChat,
              ));
            },
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person_outline),
                    backgroundColor: Colors.blueGrey,
                  ),
                  title: Text(
                    chatmodels?[index].name ?? "",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(Icons.done_all),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        chatmodels?[index].lastMessage ?? "",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  // trailing: Text(chatmodels[index].time),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 80),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
