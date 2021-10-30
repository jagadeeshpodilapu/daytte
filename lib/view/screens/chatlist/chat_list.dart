import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/chatlist_controller/chatlist_controller.dart';
import '../chatrequest/chat_request.dart';
import '../chatscreen/chat_screen.dart';

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: SafeArea(
          child: GetBuilder<ChatListController>(
            init: ChatListController(),
            builder: (controller) => Column(
              children: [
                Row(
                  children: [
                    MaterialButton(
                      child: buildColumn("All", 18, controller.isAll),
                      onPressed: () {
                        controller.funcIsAll(true, false);
                      },
                    ),
                    MaterialButton(
                          //color: Colors.yellow,
                          child:
                          buildColumn("Chat Request", 100, controller.isChat),
                          //Text("Chat Request",style: TextStyle(color: Colors.black)),
                          onPressed: () {
                            controller.funcIsAll(false, true);
                            Get.to(() => ChatRequest());
                          },
                        )
                      ],
                    ),
                    AppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text("Messages",
                                style: TextStyle(color: Colors.black)),
                          ),
                          Icon(
                            Icons.more_vert,
                            color: Colors.black,
                          )
                        ],
                      ),
                    )
                  ],
                ),
          ),
        ),
      ),
      body: GetBuilder<ChatListController>(
        builder: (controller) {
          return ListView.separated(
            itemCount: controller.profileImages.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () => Get.to(() => ChatScreen()),
                title: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(
                            controller.profileImages[index]["profileImage"]),
                        child: Align(
                          alignment: Alignment(1, -0.7),
                          child: controller.profileImages[index]["isOnline"]
                              ? CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.green,
                          )
                              : SizedBox(),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.profileImages[index]["profileName"]),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            controller.profileImages[index]["profileTag"],
                            style: TextStyle(
                                color: Color(0xFF757e90), fontSize: 12),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text(controller.profileImages[index]["timeLeft"],
                              style: TextStyle(
                                  color: Color(0xFF757e90), fontSize: 12)),
                          SizedBox(
                            height: 5,
                          ),
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Color(0xffff5a5a),
                            child: Text(
                              controller.profileImages[index]["msg"],
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          );
        },
      ),
    );
  }

  Column buildColumn(String text,
      double width,
      bool boolAll,) {
    return Column(
      children: [
        Text(text, style: TextStyle(color: Colors.black)),
        SizedBox(
          height: 5,
        ),
        boolAll
            ? Container(
          height: 3,
          width: width,
          color: Color(0xFF3c0fc7),
        )
            : SizedBox(
          height: 5,
        )
      ],
    );
  }
}
