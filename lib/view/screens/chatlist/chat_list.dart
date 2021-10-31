import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/chatlist_controller/chatlist_controller.dart';
import '../chatrequest/chat_request.dart';
import '../chatscreen/chat_screen.dart';

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      child: chatHeaders("All", 18, controller.isAll),
                      onPressed: () {
                        controller.funcIsAll(true, false);
                      },
                    ),
                    MaterialButton(
                      //color: Colors.yellow,
                      child:
                          chatHeaders("Chat Request", 100, controller.isChat),
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
                            style: TextStyle(
                                color: Color(0xff363636).withOpacity(0.7),
                                fontWeight: FontWeight.w900,
                                fontFamily: "Muli",
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0)),
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
      body: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: const Color(0x0d000000),
              offset: Offset(0, 0),
              blurRadius: 10,
              spreadRadius: 0)
        ], color: const Color(0xffffffff)),
        child: GetBuilder<ChatListController>(
          init: ChatListController(),
          builder: (controller) {
            return ListView.separated(
              itemCount: controller.profileImages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () => Get.to(() => ChatScreen()),
                  title: Container(
                    width: Get.width,
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
                            Text(
                              controller.profileImages[index]["profileName"],
                              style: const TextStyle(
                                  color: const Color(0xff363636),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Muli",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              controller.profileImages[index]["profileTag"],
                              style: const TextStyle(
                                  color: const Color(0xff757e90),
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "Muli",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text(controller.profileImages[index]["timeLeft"],
                                style: const TextStyle(
                                    color: const Color(0xff757e90),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "SFProDisplay",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0)),
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
      ),
    );
  }

  Widget chatHeaders(
    String text,
    double width,
    bool boolAll,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(text,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: "Avenir",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0)),
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
      ),
    );
  }
}
