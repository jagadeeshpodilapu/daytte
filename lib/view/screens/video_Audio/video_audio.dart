import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            top: 40.h,
            left: 15.w,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon:Icon( Icons.arrow_back_ios,
                  color: Colors.white,),
                  onPressed: ()=>Get.back(),
                ),
                addHorizontalSpace(20.w),
                Text(
                  "George \n 11:23",
                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
                addHorizontalSpace(20.w),
                SvgPicture.asset('assets/icon/flip_camera.svg',width: 30.w,height: 30.h),
                
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
        SizedBox(width: 15.w),
        Container(
          margin: EdgeInsets.only(top: 20.h),
          height: 50.h,
          width: 50.w,
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: SvgPicture.asset('assets/icon/mic.svg'),
        ),
        isVideoCall
            ? Container(
                height: 50.h,
                width: 50.w,
                margin: EdgeInsets.only(top: 20.h),
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: SvgPicture.asset('assets/icon/audio_mute.svg'),
              )
            : Container(
                height: 50.h,
                width: 50.w,
                margin: EdgeInsets.only(top: 20.h),
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: SvgPicture.asset('assets/icon/speaker.svg'),
              ),
        isVideoCall
            ? Container(
                height: 50.h,
                width: 50.w,
                margin: EdgeInsets.only(top: 20.h),
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: SvgPicture.asset('assets/icon/video_call_white.svg'),
              )
            : SizedBox(),
        Container(
          height: 50.h,
          width: 50.w,
          margin: EdgeInsets.only(top: 20.h),
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: SvgPicture.asset('assets/icon/end_call.svg'),
        ),
      ],
    );
  }
}
