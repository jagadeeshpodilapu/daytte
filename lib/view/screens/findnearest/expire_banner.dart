import 'package:daytte/consts/constants.dart';
import 'package:daytte/consts/image_constants.dart';
import 'package:daytte/themes/app_styles.dart';
import 'package:daytte/themes/color_styles.dart';
import 'package:daytte/view/dialogs/premium_dialogs/platinum_package.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ExpireBannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            SvgPicture.asset(
              ImageConstants.expire_banner_bg,
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Padding(
                      padding: const EdgeInsets.only(bottom:6.0,right: 10),
                      child: Column(
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
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:6.0,right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 40),
                                child: PremiumPackages());
                          },
                        );
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                        child: Text(
                          Constants.updatePlan,
                          style: AppStyles.title3
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
