import 'package:daytte/consts/constants.dart';
import 'package:daytte/consts/image_constants.dart';
import 'package:daytte/themes/app_styles.dart';
import 'package:daytte/themes/color_styles.dart';
import 'package:daytte/view/dialogs/premium_dialogs/platinum_package.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ExpireBannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Visibility(
        visible: true,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              ImageConstants.expire_banner_bg,
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.all(8.0.w),
                      child: Text("25",
                          style: AppStyles.heading1.copyWith(
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w500,
                              color: whiteColor)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Constants.daysLeft,
                            style: AppStyles.title2.copyWith(
                                fontWeight: FontWeight.w500,
                                color: whiteColor)),
                        Text(Constants.expireMember,
                            style: AppStyles.title2.copyWith(
                                fontWeight: FontWeight.w400,
                                color: whiteColor)),
                      ],
                    ),
                    addHorizontalSpace(20.w),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: InkWell(
                        onTap: () {
                          Get.dialog(
                            Dialog(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.r),
                                  child: PremiumPackages()),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.r)),
                              insetPadding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 50.h),
                            ),
                          );
                          /*showDialog(
                        context: context,
                        builder: (context) {
                          return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 40),
                              child: PremiumPackages());
                        },
                      );*/
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0.w, vertical: 4.h),
                          child: Text(
                            Constants.updatePlan,
                            style: AppStyles.title3
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
