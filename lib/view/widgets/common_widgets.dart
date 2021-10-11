import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/common_functions.dart';

Widget linearGradientBackground() {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        end: Alignment.topRight,
        begin: Alignment.bottomLeft,
        colors: [
          Color(0xFF3c0fc7),
          Color(0xFFc86dd7),
        ],
         /* stops: [
            0.4,
           1
          ] */
      ),
    ),
  );
}

  Widget appBarLinearGradient(String title) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon:Icon(Icons.arrow_back),
           color: Colors.white,
            iconSize: 26,
            onPressed:()=>Get.back(),
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
      style: TextStyle(color: Colors.black, fontSize: 20),
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
  );
}

TextStyle tileTextStyle() {
  return TextStyle(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18);
}
