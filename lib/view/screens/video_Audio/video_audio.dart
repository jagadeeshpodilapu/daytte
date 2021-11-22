import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AudioVideoCall extends StatelessWidget {
  final bool isVideoCall;

  const AudioVideoCall({required this.isVideoCall});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: _callButtons(),
      bottomNavigationBar: BottomAppBar(
          /*   clipBehavior: Clip.antiAlias,
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
          ), */
          child: SizedBox()),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/icon/video_girl.png', fit: BoxFit.fill),
          Positioned(
            top: 40,
            left: 15,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon:Icon( Icons.arrow_back_ios,
                  color: Colors.white,),
                  onPressed: ()=>Get.back(),
                ),
                addHorizontalSpace(20),
                Text(
                  "George \n 11:23",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                addHorizontalSpace(20),
                SvgPicture.asset('assets/icon/flip_camera.svg',width: 30,height: 30),
                
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _callButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(width: 15),
        Container(
          margin: EdgeInsets.only(top: 20),
          height: 50,
          width: 50,
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: SvgPicture.asset('assets/icon/mic.svg'),
        ),
        isVideoCall
            ? Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.only(top: 20),
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: SvgPicture.asset('assets/icon/audio_mute.svg'),
              )
            : Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.only(top: 20),
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: SvgPicture.asset('assets/icon/speaker.svg'),
              ),
        isVideoCall
            ? Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.only(top: 20),
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: SvgPicture.asset('assets/icon/video_call_white.svg'),
              )
            : SizedBox(),
        Container(
          height: 50,
          width: 50,
          margin: EdgeInsets.only(top: 20),
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: SvgPicture.asset('assets/icon/end_call.svg'),
        ),
      ],
    );
  }
}
