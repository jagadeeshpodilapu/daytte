import 'package:daytte/controllers/choosegenderController/choose_gender_controller.dart';
import 'package:daytte/view/screens/otpverification/otp_verification.dart';
import 'package:daytte/view/screens/pick_images_sources/pick_source_images.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseGender extends StatelessWidget {
  final controller = Get.put(ChooseGenderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Get.height * 0.3),
          Text(
            "Choose your Gender",
            style: TextStyle(
                fontSize: 32,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(2, (index) => genderCircleAvatar(index)),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => controller.updateGenderStatus(),
            child: Container(
              height: 45,
              width: Get.width * 0.85,
              decoration: BoxDecoration(
                color: Color(0xFFfc5185),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                  child: Text('Continue'.toUpperCase(),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center)),
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
        child: Column(
          children: [
            Container(
              decoration: controller.selectedIndex.value == index
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color(0xFF3c0fc7),
                          Color(0xFFc86dd7),
                        ],
                      ),
                    )
                  : BoxDecoration(
                      color: Color(0xFFc86dd7).withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  controller.genderData[index]['icon'],
                  width: 60,
                  height: 60,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              controller.genderData[index]['gender'],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
