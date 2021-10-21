import 'package:daytte/view/widgets/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/interests/interests_controller.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/common_widgets.dart';

class InterestedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Intrested"),
      body: GetBuilder<InterestController>(
        init: InterestController(),
        builder: (controller) => Column(
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
                          value: Gender.Male,
                          groupValue: controller.selctedGender,
                          onChanged: (Gender? value) =>
                              controller.handleGenderChange(value)),
                    ),
                    ListTile(
                      leading: buildText('Im Interested in Women'),
                      trailing: Radio(
                          activeColor: Color(0xFFfc5185),
                          value: Gender.Female,
                          groupValue: controller.selctedGender,
                          onChanged: (Gender? value) =>
                              controller.handleGenderChange(value)),
                    ),
                    ListTile(
                      leading: buildText('Im Interested in Everyone'),
                      trailing: Radio(
                          value: Gender.Everyone,
                          activeColor: Color(0xFFfc5185),
                          groupValue: controller.selctedGender,
                          onChanged: (Gender? value) =>
                              controller.handleGenderChange(value)),
                    ),
                  ],
                ),
              ),
            ),
            ButtonWidget(
              buttonTitle: "Next",
              action: ()async {
                await controller.updateInterestedStatus();
                 if (controller.responseModel != null) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "${controller.responseModel?.message}")));
                            }
                
              },
            )
          ],
        ),
      ),
    );
  }

  Text buildText(String text) => Text(text, style: TextStyle(fontSize: 16));
}
