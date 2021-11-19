import 'package:daytte/consts/constants.dart';
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
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.bold),
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
              Container(
                decoration: controller.selectedIndex.value == index
                    ? BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF7004E3),
                            Color(0xFF8511E6),
                            Color(0xFF9222EC)
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: [0, 0.2, 0.5],
                        ),
                      )
                    : BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xff9a9a9a), width: 2)),
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.transparent,
                  child: SvgPicture.asset(
                    controller.genderData[index]['icon'],
                    color: controller.selectedIndex.value == index
                        ? Colors.white
                        : Colors.grey,
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                controller.genderData[index]['gender'],
                style: Theme.of(Get.context!)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
