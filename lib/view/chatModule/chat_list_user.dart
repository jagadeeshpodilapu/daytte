import 'package:daytte/view/chatModule/chat_model.dart';
import 'package:daytte/view/chatModule/custom_card.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  ChatPage({required this.chatmodels,required this.sourchat});
  final List<ChatModel> chatmodels;
  final ChatModel sourchat;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.chatmodels.length,
        itemBuilder: (contex, index) => CustomCard(
          chatModel: widget.chatmodels[index],
          sourchat: widget.sourchat,
        ),
      ),
    );
  }
}
