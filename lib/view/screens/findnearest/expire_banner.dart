import 'package:daytte/consts/constants.dart';
import 'package:daytte/consts/image_constants.dart';
import 'package:daytte/themes/app_styles.dart';
import 'package:daytte/themes/color_styles.dart';
import 'package:daytte/view/dialogs/premium_dialogs/platinum_package.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
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
                      padding: const EdgeInsets.all(8.0),
                      child: Text("25",
                          style: AppStyles.heading1.copyWith(
                              fontSize: 40,
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
                    addHorizontalSpace(20),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: InkWell(
                        onTap: () {
                          Get.dialog(
                            Dialog(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: PremiumPackages()),
                              shape:
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                              insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
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
                          padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 4),
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
