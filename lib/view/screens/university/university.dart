import 'package:daytte/consts/constants.dart';
import 'package:daytte/themes/app_styles.dart';
import 'package:daytte/themes/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controllers/edit_details/edit_details_controller.dart';
import '../../../controllers/university/university_controller.dart';
import '../../widgets/common_widgets.dart';

class UniversityView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(Constants.university),
      body: GetBuilder<UniversityController>(
        init: UniversityController(),
        builder: (controller) => Container(
          padding: EdgeInsets.all(8.w),
          height: (Get.height * 0.9).h,
          child: Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:  EdgeInsets.all(12.0.r),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: Constants.searchUniversity,
                      hintStyle:
                          AppStyles.title.copyWith(color: secondaryTextColor),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: secondaryTextColor.withOpacity(0.4), width: 2.w),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor, width: 2.w),
                      ),
                      // prefixIcon: Icon(Icons.search),
                    ),
                    textAlignVertical: TextAlignVertical.center,
                  ),
                ),
                controller.universityListModel?.data.passion?.length!=
                        0
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: controller.universityListModel
                                  ?.data.passion?.length ??
                              0,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () async {
                              await controller.postUniversityList(
                                  "${controller.universityListModel!.data.passion?[index].id}");
                              if (controller.responseModel != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "${controller.responseModel
                                                  ?.message}")));

                              }
                            },
                            child: Padding(
                              padding:  EdgeInsets.all(8.0.w),
                              child: Container(
                                padding: EdgeInsets.all(8.w),
                                margin: EdgeInsets.symmetric(horizontal: 4.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.r),
                                  border: Border.all(
                                    color: Color(0xff9a9a9a),
                                  ),
                                ),
                                child: Text(
                                  "${controller.universityListModel?.data.passion?[index].name}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Center(child: CircularProgressIndicator.adaptive())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
