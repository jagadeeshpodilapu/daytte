import 'package:daytte/consts/constants.dart';
import 'package:daytte/consts/image_constants.dart';
import 'package:daytte/controllers/permissionController/permission_controller.dart';
import 'package:daytte/themes/app_styles.dart';
import 'package:daytte/themes/color_styles.dart';
import 'package:daytte/view/screens/permissions/meet_people.dart';
import 'package:daytte/view/widgets/button_widget.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class EnablePermsions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: GetBuilder<PermissionController>(
        init: PermissionController(),
        builder: (controller) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ripplesWidget(),
            addVerticalSpace(20),
            _enableLocationTextWidget(theme),
            addVerticalSpace(20),
            _permissionSubText(theme, """
       You’ll need to enable your 
      location in order to use Wooly"""),
            addVerticalSpace(Get.height * 0.2),
            SizedBox(
              width: Get.width * 0.8,
              child: RaisedGradientButton(
                onPressed: () {
                  if (controller.permissionGranted == PermissionStatus.granted)
                    return;
                  controller.checkPermissions();
                },
                title: "Allow Location",
              ),
            ),
            addVerticalSpace(20),
            GestureDetector(
              onTap: () {
                Get.to(() => MeetPeopleNearBy(),
                    transition: Transition.downToUp);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _permissionSubText(theme, "Tell Me More"),
                  Icon(Icons.expand_more, color: Colors.grey, size: 30)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _enableLocationTextWidget(TextTheme theme) =>
      Text(Constants.enableLocation, style: AppStyles.heading4.copyWith(fontWeight: FontWeight.w500,fontSize: 26));

  Widget _ripplesWidget() =>
      Center(child: SvgPicture.asset(ImageConstants.ic_ripples));

  Widget _permissionSubText(TextTheme theme, String text) {
    return Text(
      text,
      style: AppStyles.heading5.copyWith(color: secondaryTextColor,fontWeight:FontWeight.w500)
    );
  }
}
