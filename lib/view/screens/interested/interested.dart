import 'package:daytte/consts/constants.dart';
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
      appBar: appBarWidget(Constants.interested),
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
                    Container(
                      child: ListTile(
                        leading: buildText(Constants.interestedMen),
                        trailing: Radio(
                            activeColor: Color(0xFF7004E3),
                            value: Gender.Male,
                            groupValue: controller.selctedGender,
                            onChanged: (Gender? value) =>
                                controller.handleGenderChange(value)),
                      ),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xff9a9a9a), width: 2)),
                      margin: EdgeInsets.all(8),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xff9a9a9a), width: 2)),
                      margin: EdgeInsets.all(8),
                      child: ListTile(
                        leading: buildText(Constants.interestedWomen),
                        trailing: Radio(
                            activeColor: Color(0xFF7004E3),
                            value: Gender.Female,
                            groupValue: controller.selctedGender,
                            onChanged: (Gender? value) =>
                                controller.handleGenderChange(value)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xff9a9a9a), width: 2)),
                      margin: EdgeInsets.all(8),
                      child: ListTile(
                        leading: buildText(Constants.interestedEveryOne),
                        trailing: Radio(
                            value: Gender.Everyone,
                            activeColor: Color(0xFF7004E3),
                            groupValue: controller.selctedGender,
                            onChanged: (Gender? value) =>
                                controller.handleGenderChange(value)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ButtonWidget(
              buttonTitle: Constants.next,
              action: () async {
                await controller.updateInterestedStatus();
                if (controller.responseModel != null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("${controller.responseModel?.message}")));
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
