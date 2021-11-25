import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/common_functions.dart';

LinearGradient get gradientColors => LinearGradient(
        colors: <Color>[
          Color(0xFF7004E3),
          Color(0xFF8511E6),
          Color(0xFF9A1EE9),
        ],
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
  return SizedBox(width: width);
}

Widget addVerticalSpace(double height) {
  return SizedBox(height: height);
}

SliverGridDelegateWithFixedCrossAxisCount get sliverCountAxis {
  return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 4.0,
      childAspectRatio: 2.3 / 3,
      mainAxisSpacing: 4.0);
}

Widget appBarLinearGradient(String title) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          iconSize: 26,
          onPressed: () => Get.back(),
        ),
        Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        SizedBox(),
      ],
    ),
  );
}

AppBar appBarWidget(String title, {Color? color}) {
  return AppBar(
    backgroundColor: color ?? Colors.white,
    elevation: 0.0,
    leading: IconButton(
        onPressed: () => onBackPressed(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: Color(0xff363636),
          size: 25,
        )),
    title: Text(
      title,
      style: Theme.of(Get.context!).textTheme.headline6,
    ),
    centerTitle: true,
  );
}

TextStyle tileTextStyle() {
  return TextStyle(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18);
}

void snackbarMessage(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
    "$message",
    style: TextStyle(color: Colors.white),
  )));
}
