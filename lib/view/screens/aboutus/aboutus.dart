import 'package:daytte/controllers/aboutus_controller/about_us_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/button_widget.dart';
import '../../widgets/common_widgets.dart';

class AboutUs extends StatelessWidget {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  final controller = Get.put(AboutUsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBarWidget("About Me"),
      body: Form(
        key: _key,
        child: Column(
          children: [
            Container(
              height: Get.height * 0.7,
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller.shortDisc,
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
            Container(
              height: 40,
              child: ButtonWidget(
                buttonTitle: "Next",
                action: () {
                  if (_key.currentState!.validate()) {
                    print("form is validated");
                    controller.updateShortDescription();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please tell about YourSelf"),
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
