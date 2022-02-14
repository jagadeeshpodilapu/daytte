import 'package:daytte/themes/app_styles.dart';
import 'package:daytte/themes/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/common_functions.dart';

LinearGradient get gradientColors => LinearGradient(
      colors: <Color>[
        Color(0xFF7004E3),
        Color(0xFF8511E6),
        Color(0xFF9A1EE9),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.5, 0.8, 1],
    );

/* Widget linearGradientBackground() {
  return Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment(0, 1.5157552083333334),
            end: Alignment(1.3039388020833333, -0.19459635416666668),
            colors: [const Color(0xff3c0fc7), const Color(0xffc86dd7)])),
  );
} */

Widget addHorizontalSpace(double width) {
  return SizedBox(width: width.w);
}

Widget addVerticalSpace(double height) {
  return SizedBox(height: height);
}

SliverGridDelegateWithFixedCrossAxisCount get sliverCountAxis {
  return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 4.0,
      childAspectRatio: 2.0 / 3,
      mainAxisSpacing: 4.0);
}

AppBar appBarWidget(String title, {Color? color,isBack=true}) {
  return AppBar(
    backgroundColor: color ?? Colors.white,
    
    elevation: 0.0,
    leading:isBack? IconButton(
        onPressed: () => onBackPressed(),
        icon: Icon(
          Icons.arrow_back_ios,
          color:textColor,
          size: 25.w,
        )):SizedBox(),
    title: Text(
      title,
      style:
          AppStyles.title.copyWith(fontWeight: FontWeight.w400, fontSize: 18),
    ),
    centerTitle: true,
  );
}

TextStyle tileTextStyle() {
  return TextStyle(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.sp);
}

void snackbarMessage(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        "$message",
        style: TextStyle(color: Colors.white),
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
