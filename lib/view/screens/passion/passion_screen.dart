import 'package:daytte/consts/constants.dart';
import 'package:daytte/themes/app_styles.dart';
import 'package:daytte/utils/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import '../../../controllers/passion/passion_controller.dart';
import '../../widgets/button_widget.dart';

class PassionSCreen extends StatelessWidget {
  static const MaterialColor blue = const MaterialColor(
    0xFF7004E3,
    const <int, Color>{
      50: const Color(0xFF7004E3),
      100: const Color(0xFF7004E3),
      200: const Color(0xFF7004E3),
      300: const Color(0xFF7004E3),
      400: const Color(0xFF7004E3),
      500: const Color(0xFF7004E3),
      600: const Color(0xFF7004E3),
      700: const Color(0xFF7004E3),
      800: const Color(0xFF7004E3),
      900: const Color(0xFF7004E3),
    },
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PassionController>(
        init: PassionController(),
        builder: (controller) => Scaffold(
              appBar: _appBarWidget(),
              backgroundColor: Color(0xffF7F8FA),
              body: ListView(
                children: [
                  SizedBox(height: 20.h),
                  ...List.generate(1, (index) {
                    return Theme(
                      data: ThemeData(
                        primarySwatch: blue,
                      ),
                      child: GroupButton(
                        spacing: 5.w,
                        isRadio: false,
                        selectedShadow: const [],
                        unselectedShadow: const [],
                        selectedBorderColor: Color(0xff7004E3),
                        unselectedBorderColor: Color(0xffE1E1E1),
                        unselectedTextStyle: AppStyles.title2.copyWith(
                            color: Color(0xFF9A9A9A),
                            fontWeight: FontWeight.w400),
                        borderRadius: BorderRadius.circular(30.r),
                        onSelected: (index, isSelected) {
                          controller.selected.add(controller.listId[index]);
                           print("selected passion ${controller.selected}");
                        },
                           
                        buttons: controller.listName,
                        selectedButtons: [],
                      ),
                    );
                  }),
                  SizedBox(height: 40.h),
                ],
              ),
              floatingActionButton: SizedBox(
                width: (Get.width * 0.9).w,
                child: RaisedGradientButton(
                  title: Constants.continueText,
                  onPressed: () async {
                    if (controller.selected.isNotEmpty) {
                      await controller.postPassition();
                      if (controller.responseModel != null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text("${controller.responseModel?.message}")));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(Constants.select2Pics),
                      ));
                    }
                  },
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            ));
  }

  AppBar _appBarWidget() {
    return AppBar(
      backgroundColor: Color(0xffF7F8FA),
      elevation: 0.0,
      leading: IconButton(
          onPressed: () => onBackPressed(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff363636),
            size: 20.w,
          )),
      title: Text(
        Constants.passion,
        style: AppStyles.heading4
            .copyWith(fontWeight: FontWeight.w400, fontSize: 18.sp),
      ),
      centerTitle: true,
    );
  }
}
