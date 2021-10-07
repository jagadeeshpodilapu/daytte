import '../../widgets/button_widget.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBarWidget("About Us"),
      body: Column(
        children: [
          Container(
            height: Get.height * 0.7,
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "About you",
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1))),
                  maxLines: 10,
                ),
              ),
            ),
          ),
          ButtonWidget(buttonTitle: "Next", action: () {})
        ],
      ),
    );
  }
}
