import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/common_functions.dart';

Widget linearGradientBackground() {
  return Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment(0, 1.5157552083333334),
            end: Alignment(1.3039388020833333, -0.19459635416666668),
            colors: [const Color(0xff3c0fc7), const Color(0xffc86dd7)])),
  );
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

AppBar appBarWidget(String title) {
  return AppBar(
    leading: IconButton(
        onPressed: () => onBackPressed(),
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 30,
        )),
    title: Text(
      title,
      style: const TextStyle(
          color: const Color(0xff000000),
          fontWeight: FontWeight.w600,
          fontFamily: "SFProText",
          fontStyle: FontStyle.normal,
          fontSize: 17.0),
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
  );
}

TextStyle tileTextStyle() {
  return TextStyle(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18);
}
