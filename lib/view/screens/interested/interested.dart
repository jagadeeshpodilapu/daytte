import '../../../controllers/interests/interests_controller.dart';
import '../aboutus/aboutus.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterestedScreen extends StatelessWidget {
  final controller = Get.put(InterestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Intrested"),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            height: Get.height * 0.7,
            child: Card(
              elevation: 4,
              child: Column(
                children: [
                  ListTile(
                    leading: buildText('Im Interested in Men'),
                    trailing: Radio(
                        activeColor: Color(0xFFfc5185),
                        value: 'men',
                        groupValue: controller.groupValue,
                        onChanged: controller.handleGenderChange),
                  ),
                  ListTile(
                    leading: buildText('Im Interested in Women'),
                    trailing: Radio(
                        activeColor: Color(0xFFfc5185),
                        value: 'women',
                        groupValue: controller.groupValue,
                        onChanged: controller.handleGenderChange),
                  ),
                  ListTile(
                    leading: buildText('Im Interested in Everyone'),
                    trailing: Radio(
                        value: 'other',
                        activeColor: Color(0xFFfc5185),
                        groupValue: controller.groupValue,
                        onChanged: controller.handleGenderChange),
                  ),
                ],
              ),
            ),
          ),
          ButtonWidget(
            buttonTitle: "Next",
            action: () {
              Get.to(() => AboutUs());
            },
          )
        ],
      ),
    );
  }

  Text buildText(String text) => Text(text, style: TextStyle(fontSize: 16));
}
