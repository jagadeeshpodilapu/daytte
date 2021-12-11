import 'package:daytte/consts/constants.dart';
import 'package:daytte/consts/image_constants.dart';
import 'package:daytte/themes/app_styles.dart';
import 'package:daytte/themes/color_styles.dart';
import 'package:daytte/view/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controllers/choosegenderController/choose_gender_controller.dart';

class ChooseGender extends StatelessWidget {
  final controller = Get.put(ChooseGenderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Get.height * 0.1),
          Align(
            alignment: Alignment.center,
            child: Text(
              Constants.chooseGender,
              textAlign: TextAlign.center,
              style: AppStyles.heading3.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(2, (index) => genderCircleAvatar(index)),
          ),
          Spacer(),
          SizedBox(
            width: Get.width * 0.9,
            child: RaisedGradientButton(
              title: Constants.continueText,
              onPressed: () => controller.updateGenderStatus(),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget genderCircleAvatar(int index) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.selectedIndex.value = index;
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                children: [
                  controller.selectedIndex.value == index
                      ? SvgPicture.asset(
                          ImageConstants.blue_background,
                          fit: BoxFit.cover,
                        )
                      : SvgPicture.asset(
                          ImageConstants.grey_background,
                          fit: BoxFit.cover,
                        ),
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SvgPicture.asset(
                        controller.genderData[index]['icon'],
                        color: controller.selectedIndex.value == index
                            ? whiteColor
                            : greyColor,
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                controller.genderData[index]['gender'],
                style: AppStyles.heading4.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: controller.selectedIndex.value == index
                        ? textColor
                        : greyColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
