import '../../../consts/image_constants.dart';
import '../../../controllers/home/home_controller.dart';
import '../chatlist/chat_list.dart';
import '../editdetails/edit_details.dart';
import '../findnearest/find_nearest.dart';
import '../likedetails/like_details.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SafeArea(
        child: GetBuilder<HomeController>(
          init: HomeController(),
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
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(34.90343995940204)),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0x0d000000),
                          offset: Offset(0, -6),
                          blurRadius: 27,
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
                        icon: Icon(Icons.home_outlined,size: 30,), label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.thumb_up_alt_outlined,size: 30,),
                        label: "Likes"),
                    BottomNavigationBarItem(
                        activeIcon: SvgPicture.asset(
                          ImageConstants.ic_chat,
                          height: 25,
                          width: 25,
                          color: Color(0xFF3c0fc7),
                        ),
                        icon: SvgPicture.asset(
                          ImageConstants.ic_chat,
                          height: 25,
                          width: 25,
                        ),
                        label: "Chat"),
                    BottomNavigationBarItem(
                        icon: Icon(EvaIcons.personOutline,size: 30,), label: "Profile"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
