import '../../../consts/image_constants.dart';
import '../../../utils/common_functions.dart';
import '../video_Audio/video_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
          onPressed: () => onBackPressed(),
        ),
        title: Text(
          "Grace",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => Get.to(()=>AudioVideoCall(isVideoCall: false)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                ImageConstants.ic_call,
                height: 20,
                width: 20,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Get.to(
              () =>
              AudioVideoCall(isVideoCall: true,),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(ImageConstants.ic_video_call),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Center(
                    child: Text(
                  "Today at 12:13 AM",
                  style: TextStyle(color: Colors.black26),
                )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 16,
                        child: Text("AH",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 2)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 12),
                            child: Text(
                              "Hello, I want to request",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 18),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    const Color(0xFF6d25ba),
                                    const Color(0xffba25b8),
                                  ],
                                  begin: const FractionalOffset(0.0, 0.0),
                                  end: const FractionalOffset(1.0, 0.0),
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.clamp),
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 2)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 12),
                            child: Text(
                              "Hello, I want to request",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 16,
                        child: Text("AH",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 16,
                        child: Text("AH",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 2)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 12),
                            child: Text(
                              "Hello, I want to request",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 18),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    const Color(0xFF6d25ba),
                                    const Color(0xffba25b8),
                                  ],
                                  begin: const FractionalOffset(0.0, 0.0),
                                  end: const FractionalOffset(1.0, 0.0),
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.clamp),
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 2)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 12),
                            child: Text(
                              "Hello, I want to request",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 16,
                        child: Text("AH",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 16,
                        child: Text("AH",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 2)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 12),
                            child: Text(
                              "Hello, I want to request",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 18),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    const Color(0xFF6d25ba),
                                    const Color(0xffba25b8),
                                  ],
                                  begin: const FractionalOffset(0.0, 0.0),
                                  end: const FractionalOffset(1.0, 0.0),
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.clamp),
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 2)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 12),
                            child: Text(
                              "Hello, I want to request",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 16,
                        child: Text("AH",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 90),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: MediaQuery.of(context).size.height,
                                color: Color(0xff737373),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Center(
                                          child: Container(
                                            height: 4,
                                            width: 50,
                                            color: Colors.grey.shade200,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.yellow,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(20),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Icon(
                                                      Icons.image,
                                                      size: 40,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 30),
                                              ],
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.yellow,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(20),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Icon(
                                                      Icons.insert_drive_file,
                                                      size: 40,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Image.asset(
                          ImageConstants.ic_chat_add,
                          width: 35,
                          height: 35,
                        ),
                      ),
                    ),

                    // Edit text
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black26)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                // Image.asset(ImageConstants.ic_chat_add,height: 30,width: 30,),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxHeight: 90,
                                    maxWidth:
                                        MediaQuery.of(context).size.width / 2,
                                  ),
                                  child: TextField(
                                    // controller: textEditingController,
                                    minLines: 1,
                                    maxLines: 5,
                                    onChanged: (value) {
                                      setState(() {
                                        // message = value;
                                      });
                                    },
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15.0),
                                    decoration: InputDecoration.collapsed(
                                      hintText: 'Type your message...',
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Button send message
                    Material(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Image.asset(ImageConstants.ic_send,
                            width: 35, height: 45),
                      ),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.grey, width: 0.5)),
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
