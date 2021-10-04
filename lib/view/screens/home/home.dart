import 'package:daytte/consts/image_constants.dart';
import 'package:daytte/view/screens/chatlist/chat_list.dart';
import 'package:daytte/view/screens/discoverpartner/discover_partner.dart';
import 'package:daytte/view/screens/editdetails/edit_details.dart';
import 'package:daytte/view/screens/likedetails/like_details.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  void onTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: [
            DiscoverPartner(),
            LikesPage(),
            ChatList(),
            EditDetails(),
          ].elementAt(currentIndex),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              elevation: 0.0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              currentIndex: currentIndex,
              selectedItemColor: Color(0xFF3c0fc7),
              onTap: (index) => onTapped(index),
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
    );
  }
}
