import 'package:daytte/view/screens/chatModule/controller/test_controlle.dart';
import 'package:daytte/view/screens/chatModule/test_home_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TestView extends GetView<TestController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginView'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: controller.chatmodels.length,
          itemBuilder: (contex, index) => InkWell(
                onTap: () {
                  controller.sourceChat = controller.chatmodels.removeAt(index);
                  Get.to(TestHomeView(
                      chatmodels: controller.chatmodels,
                      sourceChat: controller.sourceChat));
                },
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 23,
                    child: Icon(
                      Icons.person,
                      size: 26,
                      color: Colors.white,
                    ),
                    backgroundColor: Color(0xFF25D366),
                  ),
                  title: Text(
                    controller.chatmodels[index].name ?? "",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )),
    );
  }
}
