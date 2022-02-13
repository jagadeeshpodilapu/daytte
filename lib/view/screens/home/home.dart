import 'package:daytte/consts/constants.dart';
import 'package:daytte/view/screens/chatlist/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controllers/home/home_controller.dart';
import '../editdetails/edit_details.dart';
import '../findnearest/find_nearest.dart';
import '../likedetails/like_details.dart';

class Home extends StatelessWidget {
  int index = Get.arguments ?? 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SafeArea(
        child: GetBuilder<HomeController>(
          init: HomeController(index),
          builder: (controller) => Scaffold(
            backgroundColor: Colors.grey[200],
            body: [
              FindTheNearest(),
              LikesPage(),
              ChatList(),
              EditDetails(),
            ].elementAt(controller.currentIndex).paddingOnly(bottom: 8),
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0.r),
                topRight: Radius.circular(30.0.r),
              ),
              child: Container(
                height: 80.h,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(34.90343995940204)),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0x0d000000),
                          offset: Offset(0, -6),
                          blurRadius: 27.r,
                          spreadRadius: 0)
                    ],
                    color: const Color(0xffffffff)),
                child: BottomNavigationBar(
                  elevation: 0.0,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white,
                  currentIndex: controller.currentIndex,
                  selectedItemColor: Color(0xFF3c0fc7),
                  onTap: (index) => controller.onTapped(index),
                  items: [
                    BottomNavigationBarItem(
                        activeIcon: _icons('assets/icon/home_active.svg'),
                        icon: _icons('assets/icon/home_grey.svg'),
                        label: Constants.home),
                    BottomNavigationBarItem(
                        activeIcon: _icons('assets/icon/heart_active.svg'),
                        icon: _icons('assets/icon/heart_grey.svg'),
                        label: Constants.likes),
                    BottomNavigationBarItem(
                        activeIcon: _icons('assets/icon/chat_active.svg'),
                        icon: _icons('assets/icon/chat_grey.svg'),
                        label: Constants.chat),
                    BottomNavigationBarItem(
                        activeIcon: SvgPicture.asset(
                          'assets/icon/profile_grey.svg',
                          height: 30.h,
                          width: 30.w,
                          color: Color(0xFF3c0fc7),
                        ),
                        icon: _icons('assets/icon/profile_grey.svg'),
                        label: Constants.profile),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SvgPicture _icons(String icon) {
    return SvgPicture.asset(
      icon,
      height: 32.h,
      width: 34.w,
      //  color: Color(0xFF3c0fc7),
    );
  }
}
