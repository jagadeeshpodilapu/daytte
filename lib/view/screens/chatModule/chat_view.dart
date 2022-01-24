import 'package:daytte/consts/image_constants.dart';
import 'package:daytte/model/chat_all_model.dart';
import 'package:daytte/utils/common_functions.dart';
import 'package:daytte/view/screens/chatModule/controller/chat_controller.dart';
import 'package:daytte/view/screens/chatModule/widgets/own_message_card.dart';
import 'package:daytte/view/screens/chatModule/widgets/replay_card.dart';
import 'package:daytte/view/screens/video_Audio/video_audio.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChatView extends GetView<ChatController> {
  User? user;

  ChatView({required this.user}); // Controller dependency injected

  @override
  Widget build(BuildContext context) {
    controller.activeRoom = user?.chatUser?.id??"";
    controller.isConnect == false ? controller.connect() : null;

    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 1,
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () {
                  onBackPressed();
                  controller.socket.disconnect();
                },
              ),
              title: Text(user?.chatUser?.firstname ?? "",
                  style: TextStyle(color: Colors.black)),
              centerTitle: false,
              actions: [
                GestureDetector(
                  onTap: () => Get.to(() => AudioVideoCall(isVideoCall: false)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      ImageConstants.ic_call,
                      height: 36,
                      width: 36,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.to(
                    () => AudioVideoCall(
                      isVideoCall: true,
                    ),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(ImageConstants.ic_video,
                          width: 37, height: 37)),
                ),
                addHorizontalSpace(10)
              ],
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: WillPopScope(
                child: Column(
                  children: [
                    addVerticalSpace(10),
                    Expanded(
                      child: Obx(() {
                        print("is reveres ${controller.isTyping.value}");
                        return ListView.builder(
                          shrinkWrap: true,
                         // reverse: controller.isTyping.value,
                          controller: controller.scrollController,
                          itemCount: controller.messages.length,
                          itemBuilder: (context, index) {
                            print(
                                "message is came ${controller.messages.length}");
                            if (index == controller.messages.length) {
                              return Container(
                                height: 70,
                              );
                            }

                            if (controller.messages[index].senderId ==
                                controller.storage.read('id')) {
                              return OwnMessageCard(
                                message:
                                    controller.messages[index].message ?? "",
                              );
                            } else {
                              return ReplyCard(
                                message: controller.messages[index].message,
                              );
                            }
                          },
                        );
                      }),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 70,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Card(
                                      margin: EdgeInsets.only(
                                          left: 10, right: 10, bottom: 5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Obx(() => TextFormField(
                                            controller:
                                                controller.textController,
                                            focusNode: controller.focusNode,
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            keyboardType:
                                                TextInputType.multiline,
                                            maxLines: 5,
                                            minLines: 1,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Type a message",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                              prefixIcon: IconButton(
                                                icon: Icon(
                                                  controller.show.value
                                                      ? Icons.keyboard
                                                      : Icons
                                                          .emoji_emotions_outlined,
                                                  color: Colors.grey,
                                                ),
                                                onPressed: () {},
                                              ),
                                              suffixIcon: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.attach_file,
                                                      color: Colors.grey,
                                                    ),
                                                    onPressed: () {
                                                      // showModalBottomSheet(
                                                      //     backgroundColor:
                                                      //     Colors.transparent,
                                                      //     context: context,
                                                      //     builder: (builder) =>
                                                      //         bottomSheet());
                                                    },
                                                  ),
                                                  IconButton(
                                                    icon: Container(
                                                      height: 35,
                                                      width: 35,
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey,
                                                          shape:
                                                              BoxShape.circle),
                                                      child: Icon(
                                                        Icons
                                                            .arrow_forward_sharp,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    splashRadius: 0.2,
                                                    onPressed: () {
                                                      if (controller
                                                          .textController
                                                          .text
                                                          .isNotEmpty) {
                                                        controller
                                                            .scrollController
                                                            .animateTo(
                                                                controller
                                                                    .scrollController
                                                                    .position
                                                                    .maxScrollExtent,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        300),
                                                                curve: Curves
                                                                    .easeOut);

                                                        controller.sendMessage(
                                                            message: controller
                                                                .textController
                                                                .text,
                                                            receiverId: user
                                                                    ?.chatUser
                                                                    ?.id ??
                                                                "",
                                                            senderId: controller
                                                                .storage
                                                                .read('id'));
                                                        controller
                                                            .textController
                                                            .clear();

                                                        controller
                                                            .isListRevere();
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                              contentPadding: EdgeInsets.all(5),
                                            ),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                onWillPop: () {
                  if (controller.show.value) {
                    controller.show.value = false;
                  } else {
                    Navigator.pop(context);
                  }
                  return Future.value(false);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
