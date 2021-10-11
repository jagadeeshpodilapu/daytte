import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../chatrequest/chat_request.dart';
import '../chatscreen/chat_screen.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  bool isAll = true;
  bool isChat = false;
  List<Map> profileImages = [
    {
      "profileImage": "assets/images/girl.jpg",
      "profileName": "Julia Morris",
      "profileTag": "Don't think about tomorrow",
      "timeLeft": "23 min",
      "msg": "4",
      "isOnline": false
    },
    {
      "profileImage": "assets/images/girl.jpg",
      "profileName": "Maria Long",
      "profileTag": "Don't think about tomorrow",
      "timeLeft": "23 min",
      "msg": "4",
      "isOnline": false,
    },
    {
      "profileImage": "assets/images/girl.jpg",
      "profileName": "Crystal Castillo",
      "profileTag": "Don't think about tomorrow",
      "timeLeft": "23 min",
      "msg": "4",
      "isOnline": true,
    },
    {
      "profileImage": "assets/images/girl.jpg",
      "profileName": "Christina Evans",
      "profileTag": "Don't think about tomorrow",
      "timeLeft": "23 min",
      "msg": "4",
      "isOnline": true,
    },
    {
      "profileImage": "assets/images/girl.jpg",
      "profileName": "Emma Adams",
      "profileTag": "Don't think about tomorrow",
      "timeLeft": "23 min",
      "msg": "4",
      "isOnline": true,
    },
    {
      "profileImage": "assets/images/girl.jpg",
      "profileName": "Denis Burton",
      "profileTag": "Don't think about tomorrow",
      "timeLeft": "23 min",
      "msg": "4",
      "isOnline": false,
    },
    {
      "profileImage": "assets/images/girl.jpg",
      "profileName": "Ronaldo",
      "profileTag": "Don't think about tomorrow",
      "timeLeft": "23 min",
      "msg": "4",
      "isOnline": false,
    },
    {
      "profileImage": "assets/images/girl.jpg",
      "profileName": "Messey",
      "profileTag": "Don't think about tomorrow",
      "timeLeft": "23 min",
      "msg": "4",
      "isOnline": false,
    },
    {
      "profileImage": "assets/images/girl.jpg",
      "profileName": "Suresh",
      "profileTag": "Don't think about tomorrow",
      "timeLeft": "23 min",
      "msg": "4",
      "isOnline": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  MaterialButton(
                    child: buildColumn("All", 18, isAll),
                    onPressed: () {
                      setState(() {
                        isAll = true;
                        isChat = false;
                      });
                    },
                  ),
                  MaterialButton(
                    //color: Colors.yellow,
                    child: buildColumn("Chat Request", 100,
                        isChat), //Text("Chat Request",style: TextStyle(color: Colors.black)),
                    onPressed: () {
                      setState(() {
                        isAll = false;
                        isChat = true;
                      });
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
      body: ListView.separated(
        itemCount: profileImages.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => Get.to(() => ChatScreen()),
            title: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage:
                        AssetImage(profileImages[index]["profileImage"]),
                    child: Align(
                      alignment: Alignment(1, -0.7),
                      child: profileImages[index]["isOnline"]
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
                      Text(profileImages[index]["profileName"]),
                      SizedBox(
                        height: 5,
                      ),
                      Text(profileImages[index]["profileTag"],style: TextStyle(
                        color: Color(0xFF757e90),
                        fontSize: 12
                      ),),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text(profileImages[index]["timeLeft"],style: TextStyle(
                        color: Color(0xFF757e90),
                         fontSize: 12
                        )),
                      SizedBox(
                        height: 5,
                      ),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Color(0xffff5a5a),
                        child: Text(profileImages[index]["msg"],style: TextStyle(color: Colors.white),),
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
      ),
    );
  }

  Column buildColumn(
    String text,
    double width,
    bool boolAll,
  ) {
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
