import 'package:daytte/consts/constants.dart';
import 'package:daytte/consts/image_constants.dart';
import 'package:daytte/view/screens/chatModule/chat_view.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/chatlist_controller/chatlist_controller.dart';
import '../chatrequest/chat_request.dart';
import '../chatscreen/chat_screen.dart';

class ChatList extends GetView<ChatListController> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Color(0xffF7F8FA),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: SafeArea(
          child: GetBuilder<ChatListController>(
            init: ChatListController(),
            builder: (controller) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: chatRequestHeaders(controller, theme),
                ),
                messageHeaderWithActionsWidget(theme)
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: shadowBackground(),
        child: GetBuilder<ChatListController>(
          init: ChatListController(),
          builder: (controller) {
            return ListView.separated(
              itemCount: controller.chatmodels.length,
              itemBuilder: (context, index) {
                return messageCard(context, controller, index, theme);
              },
              separatorBuilder: (context, index) {
                return Container(
                  height: 2,
                  color: Colors.grey[300],
                  margin: EdgeInsets.symmetric(horizontal: 16),
                );
              },
            );
          },
        ),
      ),
    );
  }

  BoxDecoration shadowBackground() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
            color: const Color(0x0d000000),
            offset: Offset(0, 0),
            blurRadius: 10,
            spreadRadius: 0)
      ],
      color: const Color(0xffffffff),
    );
  }

  Widget messageCard(BuildContext context, ChatListController controller,
      int index, TextTheme theme) {
    return ListTile(
      onTap: () {
       // controller.sourceChat = controller.chatmodels.removeAt(index);
        Get.to(
          ChatView(
              chatModel: controller.chatmodels,
              sourceChat: controller.sourceChat,selectedIndex: index,),
        );
      },
      title: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            userCircleAvatarWidget(controller, index),
            addHorizontalSpace(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                userNameWidget(controller, index, theme),
                addVerticalSpace(5),
                userLastMessageWidget(controller, index, theme),
              ],
            ),
            Spacer(),
            Column(
              children: [
                timeLeftWidget(controller, index),
                SizedBox(height: 5),
                messageCountWidget(controller, index)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget messageCountWidget(ChatListController controller, int index) {
    return CircleAvatar(
      radius: 10,
      backgroundColor: Color(0xff7004E3),
      child: Text(
        '4',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget timeLeftWidget(ChatListController controller, int index) {
    return Text('23 min',
        style: const TextStyle(
            color: const Color(0xff9A9A9A),
            fontWeight: FontWeight.w500,
            fontFamily: "SFProDisplay",
            fontStyle: FontStyle.normal,
            fontSize: 14.0));
  }

  Text userLastMessageWidget(
      ChatListController controller, int index, TextTheme theme) {
    return Text(
      "Hi EveryOne",
      style: theme.headline6?.copyWith(color: Color(0xff9A9A9A), fontSize: 14),
    );
  }

  Text userNameWidget(
      ChatListController controller, int index, TextTheme theme) {
    return Text(
      controller.chatmodels[index].name ?? "",
      style: theme.headline6?.copyWith(fontSize: 18),
    );
  }

  CircleAvatar userCircleAvatarWidget(
      ChatListController controller, int index) {
    return CircleAvatar(
      radius: 35,
      backgroundImage: AssetImage(ImageConstants.girl),
      child: Align(
        alignment: Alignment(1, -0.7),
        child: true
            ? CircleAvatar(radius: 5, backgroundColor: Color(0xff08E300))
            : SizedBox(),
      ),
    );
  }

  AppBar messageHeaderWithActionsWidget(TextTheme theme) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(Constants.message,
                style: theme.headline6?.copyWith(fontSize: 22)),
          ),
          Icon(
            Icons.more_vert,
            color: Colors.black,
            size: 28,
          )
        ],
      ),
    );
  }

  Widget chatRequestHeaders(ChatListController controller, TextTheme theme) {
    return Row(
      children: [
        MaterialButton(
          child: chatHeadersText("All", 18, controller.isAll, theme),
          onPressed: () {
            controller.funcIsAll(true, false);
          },
        ),
        MaterialButton(
          //color: Colors.yellow,
          child: chatHeadersText(
              Constants.charRequest, 100, controller.isChat, theme),
          //Text("Chat Request",style: TextStyle(color: Colors.black)),
          onPressed: () {
            controller.funcIsAll(false, true);
            Get.to(() => ChatRequest());
          },
        )
      ],
    );
  }

  Widget chatHeadersText(
      String text, double width, bool boolAll, TextTheme theme) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(text, style: theme.headline6?.copyWith(fontSize: 16)),
          SizedBox(
            height: 5,
          ),
          boolAll
              ? Container(
                  height: 4,
                  width: width,
                  color: Color(0xFF3c0fc7),
                )
              : SizedBox(
                  height: 5,
                )
        ],
      ),
    );
  }
}
