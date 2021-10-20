import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../consts/image_constants.dart';
import '../../../controllers/home/home_controller.dart';
import '../chatlist/chat_list.dart';
import '../editdetails/edit_details.dart';
import '../findnearest/find_nearest.dart';
import '../likedetails/like_details.dart';

class Home extends StatelessWidget {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SafeArea(
        child: Obx(
          () => Scaffold(
            backgroundColor: Colors.grey[200],
            body: [
              FindTheNearest(),
              LikesPage(),
              ChatList(),
              EditDetails(),
            ].elementAt(controller.currentIndex),
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                elevation: 0.0,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                currentIndex: controller.currentIndex,
                selectedItemColor: Color(0xFF3c0fc7),
                onTap: (index) => controller.onTapped(index),
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.thumb_up_alt_outlined), label: "Likes"),
                  BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                        ImageConstants.ic_chat,
                        height: 20,
                        width: 20,
                        color: Color(0xFF3c0fc7),
                      ),
                      icon: SvgPicture.asset(
                        ImageConstants.ic_chat,
                        height: 20,
                        width: 20,
                      ),
                      label: "Chat"),
                  BottomNavigationBarItem(
                      /*  activeIcon: SvgPicture.asset(
                          'assets/icons/profile.svg',
                          height: 20,
                          width: 20,
                          color: Color(0xFF3c0fc7),
                        ), */
                      icon: Icon(EvaIcons.personOutline),
                      label: "Profile"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
