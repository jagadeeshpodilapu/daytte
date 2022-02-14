import 'package:daytte/controllers/permissionController/permission_controller.dart';
import 'package:daytte/themes/app_styles.dart';
import 'package:daytte/themes/color_styles.dart';
import 'package:daytte/view/screens/permissions/enable_permission.dart';
import 'package:daytte/view/widgets/button_widget.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class MeetPeopleNearBy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: GetBuilder<PermissionController>(
        init: PermissionController(),
        builder: (controller) => Column(
          children: [
            addVerticalSpace(50.h),
            _expandLessButtonWidget(),
            _allowLocationButtonWidget(controller),
            addVerticalSpace((Get.height * 0.15).h),
            _meetPeopleWidget(theme),
            addVerticalSpace(20.h),
            _subTextWidget(theme),
          ],
        ),
      ),
    );
  }

  Widget _subTextWidget(TextTheme theme) {
    return Text(
      """
  Your location will be used to 
 show potential matches near you""",
      style: AppStyles.heading5
          .copyWith(color: secondaryTextColor, fontWeight: FontWeight.w400),
    );
  }

  Widget _meetPeopleWidget(TextTheme theme) {
    return Text("Meet Nearby People",
        style: AppStyles.heading1
            .copyWith(fontSize: 28.sp, fontWeight: FontWeight.w500));
  }

  Widget _allowLocationButtonWidget(PermissionController controller) {
    return Center(
      child: SizedBox(
        width: (Get.width * 0.8).w,
        child: RaisedGradientButton(
          onPressed: () {
            if (controller.permissionGranted == PermissionStatus.granted)
              return;
            controller.checkPermissions();
          },
          title: "Allow Location",
        ),
      ),
    );
  }

  Widget _expandLessButtonWidget() => Center(
      child: IconButton(
          onPressed: () {
            Get.to(() => EnablePermsions(), transition: Transition.upToDown);
          },
          icon: Icon(Icons.expand_less, size: 30.w, color: Colors.grey)));
}
