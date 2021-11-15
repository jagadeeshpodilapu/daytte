import 'package:daytte/consts/constants.dart';
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
      appBar: appBarWidget(Constants.aboutYou),
      body: Form(
        key: _key,
        child: Column(
          children: [
            Container(
              height: Get.height * 0.7,
              child: aboutYoursWidget(),
            ),
            nextButtonWidget(context)
          ],
        ),
      ),
    );
  }

  Widget aboutYoursWidget() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller.shortDisc,
          decoration: InputDecoration(
            hintText: Constants.aboutYou,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
            ),
          ),
          maxLines: 10,
        ),
      ),
    );
  }

  ButtonWidget nextButtonWidget(BuildContext context) {
    return ButtonWidget(
        buttonTitle: Constants.next,
        action: () {
          if (controller.shortDisc.text.isNotEmpty) {
            controller.updateShortDescription();
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(Constants.aboutWarning)));
          }
        });
  }
}
