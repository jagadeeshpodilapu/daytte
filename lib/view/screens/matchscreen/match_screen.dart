import 'package:daytte/consts/constants.dart';
import 'package:daytte/consts/image_constants.dart';
import 'package:daytte/model/user_liked_model.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MatchScreen extends StatelessWidget {
  UserLikedToModel matchedData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(ImageConstants.match_bg, fit: BoxFit.cover),
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  /* CustomPaint(
                    child: Container(
                      width: Get.width,
                      height: Get.width,
                    ),
                    painter: HeaderCurvedContainer(),
                  ), */
                  Column(
                    children: [
                      addVerticalSpace(Get.height * 0.15),
                      _matchTextHeader(),
                      _matchedWidget(),
                      addVerticalSpace(60),
                      _matchedUsersNames(),
                    ],
                  ),
                ],
              ),
              addVerticalSpace(50),
              _buttonWidget(context, Constants.chatNow),
              addVerticalSpace(20),
              _buttonWidget(context, "Continue Swiping", color: Colors.black),
            ],
          ),
        ],
      ),
    );
  }

  ElevatedButton _buttonWidget(BuildContext context, String title,
      {Color? color}) {
    return ElevatedButton(
        onPressed: () {
          if (title == "Continue Swiping") {
            Get.back();
          }
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.white, fixedSize: Size(Get.width * 0.7, 45)),
        child: Text(title,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: color ?? Color(0xff7004E3))));
  }

  SafeArea _matchTextHeader() {
    return SafeArea(
      child: Text(
        Constants.itsMatch,
        style: Theme.of(Get.context!)
            .textTheme
            .headline4
            ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Text _matchedUsersNames() {
    return Text(
      "${matchedData.userLikedDataInfo.likedBy?.firstname ?? ""} and ${matchedData.userLikedDataInfo.likedTo?.firstname ?? ""} like each other",
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
    );
  }

  Padding _matchedWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // overflow: Overflow.visible,
        children: [
          Column(
            children: [
              _matchedProfiles(),
            ],
          ),
        ],
      ),
    );
  }

  Stack _matchedProfiles() {
    return Stack(
      clipBehavior: Clip.none,
      //overflow: Overflow.visible,
      children: [
        addVerticalSpace(100),
        Positioned(
          right: -10,
          child: CircleAvatar(
            radius: 78,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 74,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(
                  matchedData.userLikedDataInfo.likedBy?.profileImg ?? ""),
            ),
          ),
        ),
        Positioned(
          left: -20,
          child: CircleAvatar(
            radius: 80,
            backgroundColor: Colors.white,
            child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(
                    matchedData.userLikedDataInfo.likedTo?.profileImg ?? "")),
          ),
        ),
      ],
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    var rect = Offset.zero & size;
    paint.shader = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        const Color(0xFFc86dd7),
        const Color(0xff3c0fc7),
      ],
    ).createShader(rect);
    Path path = Path();
    path.lineTo(0, size.height - 140);
    path.quadraticBezierTo(
        size.width / 2, size.height - 100, size.width, size.height - 140);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
