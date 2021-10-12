import 'package:get/get.dart';

class ChatListController extends GetxController {
  bool isAll = true;
  bool isChat = false;
  List<Map> profileImages = [
    {
      "profileImage": "assets/images/girl.jpg",
      "profileName": "Julia Morris",
      "profileTag": "Don't think about tomorrow",
      "timeLeft": "23 min",
      "msg": "4",
      "isOnline": false
    },
    {
      "profileImage": "assets/images/girl.jpg",
      "profileName": "Maria Long",
      "profileTag": "Don't think about tomorrow",
      "timeLeft": "23 min",
      "msg": "4",
      "isOnline": false,
    },
    {
      "profileImage": "assets/images/girl.jpg",
      "profileName": "Crystal Castillo",
      "profileTag": "Don't think about tomorrow",
      "timeLeft": "23 min",
      "msg": "4",
      "isOnline": true,
    },
    {
      "profileImage": "assets/images/girl.jpg",
      "profileName": "Christina Evans",
      "profileTag": "Don't think about tomorrow",
      "timeLeft": "23 min",
      "msg": "4",
      "isOnline": true,
    },
    {
      "profileImage": "assets/images/girl.jpg",
      "profileName": "Emma Adams",
      "profileTag": "Don't think about tomorrow",
      "timeLeft": "23 min",
      "msg": "4",
      "isOnline": true,
    },
    {
      "profileImage": "assets/images/girl.jpg",
      "profileName": "Denis Burton",
      "profileTag": "Don't think about tomorrow",
      "timeLeft": "23 min",
      "msg": "4",
      "isOnline": false,
    },
    {
      "profileImage": "assets/images/girl.jpg",
      "profileName": "Ronaldo",
      "profileTag": "Don't think about tomorrow",
      "timeLeft": "23 min",
      "msg": "4",
      "isOnline": false,
    },
    {
      "profileImage": "assets/images/girl.jpg",
      "profileName": "Messey",
      "profileTag": "Don't think about tomorrow",
      "timeLeft": "23 min",
      "msg": "4",
      "isOnline": false,
    },
    {
      "profileImage": "assets/images/girl.jpg",
      "profileName": "Suresh",
      "profileTag": "Don't think about tomorrow",
      "timeLeft": "23 min",
      "msg": "4",
      "isOnline": false,
    },
  ];

  funcIsAll(bool all, bool chat) {
    isAll = all;
    isChat = chat;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
