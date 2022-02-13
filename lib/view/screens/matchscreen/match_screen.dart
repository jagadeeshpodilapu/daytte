import 'package:daytte/consts/constants.dart';
import 'package:daytte/consts/image_constants.dart';
import 'package:daytte/model/user_liked_model.dart';
import 'package:daytte/routes/app_routes.dart';
import 'package:daytte/services/base_service/create_chat.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MatchScreen extends StatefulWidget {
  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  UserLikedData matchedData = Get.arguments;
  final storage = GetStorage();

  Future createChat() {
    var payload = {
      "sender": "${storage.read('id')}",
      "receiver": "${matchedData.likedTo?.id}",
      "message": "",
      "isRead": true,
      "messageType": 1
    };
    final result = CreateChatService().chatCreate(payload);
    return result;
  }

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
                      addVerticalSpace((Get.height * 0.15).h),
                      _matchTextHeader(),
                      _matchedWidget(),
                      addVerticalSpace(60.h),
                      _matchedUsersNames(),
                    ],
                  ),
                ],
              ),
              addVerticalSpace(50.h),
              _buttonWidget(context, Constants.chatNow, onTapEvent: () async {
                await createChat();

                return Get.toNamed(AppRoutes.HOMEVIEW, arguments: 2);
              }),
              addVerticalSpace(20.h),
              _buttonWidget(context, "Continue Swiping", color: Colors.black,
                  onTapEvent: () {
                return Get.back();
              }),
            ],
          ),
        ],
      ),
    );
  }

  ElevatedButton _buttonWidget(BuildContext context, String title,
      {Color? color, Function()? onTapEvent}) {
    return ElevatedButton(
        onPressed: onTapEvent,
        style: ElevatedButton.styleFrom(
            primary: Colors.white, fixedSize: Size((Get.width * 0.7).w, 45.h)),
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
      "${matchedData.likedBy?.firstname ?? ""} and ${matchedData.likedTo?.firstname ?? ""} like each other",
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
    );
  }

  Padding _matchedWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0.h),
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
        addVerticalSpace(100.h),
        Positioned(
          right: -10.w,
          child: CircleAvatar(
            radius: 78.r,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 74.r,
              backgroundColor: Colors.grey,
              backgroundImage:
                  NetworkImage(matchedData.likedBy?.profileImg ?? ""),
            ),
          ),
        ),
        Positioned(
          left: -20.w,
          child: CircleAvatar(
            radius: 80.r,
            backgroundColor: Colors.white,
            child: CircleAvatar(
                radius: 76.r,
                backgroundColor: Colors.grey,
                backgroundImage:
                    NetworkImage(matchedData.likedTo?.profileImg ?? "")),
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
    path.lineTo(0, (size.height - 140).h);
    path.quadraticBezierTo(
        (size.width / 2).w, (size.height - 100).h, size.width, (size.height - 140).h);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
