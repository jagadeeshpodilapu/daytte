import 'package:daytte/utils/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AudioVideoCall extends StatefulWidget {
  final bool isVideoCall;

  const AudioVideoCall({Key? key, required this.isVideoCall}) : super(key: key);

  @override
  State<AudioVideoCall> createState() => _AudioVideoCallState();
}

class _AudioVideoCallState extends State<AudioVideoCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {},
        child: Container(
            child: Icon(Icons.call_end, color: Colors.white, size: 40)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: /* Container(
        clipBehavior:Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFF3c0fc7),
                Color(0xFFc86dd7),
              ],
            ),),
        child: CurvedNavigationBar(
          index: 1,
          backgroundColor: Colors.black,
          buttonBackgroundColor: Colors.white,
          items: [
          Icon(Icons.mic),
            Icon(Icons.video_call_outlined),
            Icon(Icons.speaker_phone_outlined)
          ],
        ),
      ), */
          BottomAppBar(
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 120,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFF3c0fc7),
                Color(0xFFc86dd7),
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 50,
                width: 50,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Image.asset('assets/images/mic.png'),
              ),
              widget.isVideoCall
                  ? Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: SvgPicture.asset('assets/images/video_call.svg'),
                    )
                  : SizedBox(),
              Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.only(top: 20),
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: SvgPicture.asset('assets/images/speaker.svg'),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/girl.jpg', fit: BoxFit.fill),
          Positioned(
            top: 40,
            left: 15,
            right: 0,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => onBackPressed(),
                  child: Image.asset(
                    'assets/images/video_back_button.png',
                    width: 40,
                    height: 40,
                  ),
                ),
                SizedBox(width: Get.width * 0.25),
                Text("George \n 11.23"),
              ],
            ),
          ),
/*Positioned(
            bottom: 10,
            left: 0,right: 0,
            child: Container(
           height: 50,width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
               color: Colors.red,
            ),
            child: Icon(Icons.call_end, color: Colors.white, size: 40)), )*/
        ],
      ),
    );
  }
}
