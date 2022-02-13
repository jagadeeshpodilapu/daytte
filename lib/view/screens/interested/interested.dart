import 'package:daytte/consts/constants.dart';
import 'package:daytte/themes/app_styles.dart';
import 'package:daytte/themes/color_styles.dart';
import 'package:daytte/view/widgets/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              height: (Get.height * 0.7).h,
              child: Card(
                elevation: 4,
                child: Column(
                  children: [
                    addVerticalSpace(10.h),
                    Container(
                      child: ListTile(
                        leading: controller.selctedGender == Gender.Male
                            ? buildTextBold(Constants.interestedMen)
                            : buildText(Constants.interestedMen),
                        trailing: Radio(
                            activeColor: Color(0xFF7004E3),
                            value: Gender.Male,
                            groupValue: controller.selctedGender,
                            onChanged: (Gender? value) =>
                                controller.handleGenderChange(value)),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                              color: controller.selctedGender == Gender.Male
                                  ? Color(0xFF7004E3)
                                  : Color(0xff9a9a9a),
                              width: 2)),
                      margin:
                          EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.0.h),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                              color: controller.selctedGender == Gender.Female
                                  ? primaryColor
                                  : secondaryTextColor,
                              width: 2.w)),
                      margin:
                          EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.0.h),
                      child: ListTile(
                        leading: controller.selctedGender == Gender.Female
                            ? buildTextBold(Constants.interestedWomen)
                            : buildText(Constants.interestedWomen),
                        trailing: Radio(
                            activeColor: primaryColor,
                            value: Gender.Female,
                            groupValue: controller.selctedGender,
                            onChanged: (Gender? value) =>
                                controller.handleGenderChange(value)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                              color: controller.selctedGender == Gender.Everyone
                                  ? primaryColor
                                  : secondaryTextColor,
                              width: 2.w)),
                      margin:
                          EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.0.h),
                      child: ListTile(
                        leading: controller.selctedGender == Gender.Everyone
                            ? buildTextBold(Constants.interestedEveryOne)
                            : buildText(Constants.interestedEveryOne),
                        trailing: Radio(
                            value: Gender.Everyone,
                            activeColor: primaryColor,
                            groupValue: controller.selctedGender,
                            onChanged: (Gender? value) =>
                                controller.handleGenderChange(value)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(12.0.w),
              child: RaisedGradientButton(
                title: Constants.next,
                borderRadius: 12.r,
                onPressed: () async {
                  await controller.updateInterestedStatus();
                  if (controller.responseModel != null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("${controller.responseModel?.message}")));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Text buildText(String text) => Text(text,
      style: AppStyles.title
          .copyWith(color: secondaryTextColor, fontWeight: FontWeight.w400));

  buildTextBold(String text) =>
      Text(text, style: AppStyles.title.copyWith(fontWeight: FontWeight.w400));
}
