import 'package:daytte/consts/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      // backgroundColor: Colors.transparent,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                CustomPaint(
                  child: Container(
                    width: Get.width,
                    height: Get.width,
                  ),
                  painter: HeaderCurvedContainer(),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SafeArea(
                        child: Text(Constants.itsMatch,
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.normal,
                                color: Colors.white))),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // overflow: Overflow.visible,
                        children: [
                          Column(
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                //overflow: Overflow.visible,
                                children: [
                                  Container(
                                    height: 110,
                                  ),
                                  Positioned(
                                    right: -10,
                                    child: CircleAvatar(
                                      radius: 54,
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.grey,
                                        backgroundImage: NetworkImage(
                                            "https://wallup.net/wp-content/uploads/2016/05/13/334355-people-model-fashion-forest-dress-portrait.jpg"),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: -20,
                                    child: CircleAvatar(
                                      radius: 54,
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.grey,
                                        backgroundImage: NetworkImage(
                                            "https://wallup.net/wp-content/uploads/2016/05/13/334355-people-model-fashion-forest-dress-portrait.jpg"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Your and Kate like each other",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 40),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          const Color(0xfffd267d),
                          const Color(0xFFff7456),
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12),
                  child: Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(Constants.chatNow,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                              color: Colors.white)),
                    ],
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
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
