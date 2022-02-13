import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../consts/constants.dart';
import '../../widgets/common_widgets.dart';
import '../chatModule/chat_view.dart';
import '../chatModule/controller/chat_controller.dart';
import '../chatrequest/chat_request.dart';

class ChatList extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Color(0xffF7F8FA),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: SafeArea(
          child: GetBuilder<ChatController>(
            init: ChatController(),
            builder: (controller) => Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                /* Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: chatRequestHeaders(controller, theme),
                ), */
                messageHeaderWithActionsWidget(theme)
              ],
                ),
          ),
        ),
      ),
      body: Container(
        decoration: shadowBackground(),
        child: GetBuilder<ChatController>(
          init: ChatController(),
          builder: (controller) {
            return ListView.separated(
              itemCount: controller.chatmodel?.data.users?.length ?? 0,
              itemBuilder: (context, index) {
                return messageCard(context, index, theme);
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

  Widget messageCard(BuildContext context, int index, TextTheme theme) {
    return ListTile(
      onTap: () {
        Get.to(
              () => ChatView(user: controller.chatmodel?.data.users![index]),
        );
        controller.fetchChatAllDetails(
            "", controller.chatmodel?.data.users![index].chatUser?.id ?? "");
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
                timeLeftWidget(index),
                SizedBox(height: 5),
                messageCountWidget()
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget messageCountWidget() {
    return CircleAvatar(
      radius: 10,
      backgroundColor: Color(0xff7004E3),
      child: Text(
        '4',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget timeLeftWidget(int index) {
    return Text('23 min',
        style: const TextStyle(
            color: const Color(0xff9A9A9A),
            fontWeight: FontWeight.w500,
            fontFamily: "SFProDisplay",
            fontStyle: FontStyle.normal,
            fontSize: 14.0));
  }

  Text userLastMessageWidget(ChatController controller, int index, TextTheme theme) {
    return Text(
      controller.chatmodel?.data.users?[index].chatUser?.msg?.message ?? "",
      style: theme.headline6?.copyWith(color: Color(0xff9A9A9A), fontSize: 14),
    );
  }

  Text userNameWidget(ChatController controller, int index, TextTheme theme) {
    return Text(
      controller.chatmodel?.data.users?[index].chatUser?.firstname ?? "",
      style: theme.headline6?.copyWith(fontSize: 18),
    );
  }

  CircleAvatar userCircleAvatarWidget(ChatController controller, int index) {
    return CircleAvatar(
      radius: 35,
      backgroundImage: NetworkImage(
          controller.chatmodel?.data.users?[index].chatUser?.profileImg ?? ""),
      child: Align(
          alignment: Alignment(1, -0.7),
          child: CircleAvatar(radius: 5, backgroundColor: Color(0xff08E300))),
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

  Widget chatRequestHeaders(ChatController controller, TextTheme theme) {
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

  Widget chatHeadersText(String text, double width, bool boolAll, TextTheme theme) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(text, style: theme.headline6?.copyWith(fontSize: 16)),
          SizedBox(height: 5),
          boolAll
              ? Container(
            height: 4,
            width: width,
            color: Color(0xFF3c0fc7),
          )
              : SizedBox(height: 5)
        ],
      ),
    );
  }
}
