import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../consts/image_constants.dart';
import '../../../utils/common_functions.dart';
import '../video_Audio/video_audio.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => onBackPressed(),
        ),
        title: Text("Grace", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => Get.to(() => AudioVideoCall(isVideoCall: false)),
            child: Padding(
              padding:  EdgeInsets.all(8.0.w),
              child: SvgPicture.asset(
                ImageConstants.ic_call,
                height: 36.h,
                width: 36.w,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Get.to(
              () => AudioVideoCall(
                isVideoCall: true,
              ),
            ),
            child: Padding(
                padding:  EdgeInsets.all(8.0.w),
                child: SvgPicture.asset(ImageConstants.ic_video,
                    width: 37.w, height: 37.h)),
          ),
          addHorizontalSpace(10.w)
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding:  EdgeInsets.all(8.0.w),
            child: Column(
              children: [
                Center(
                    child: Text(
                      "Today at 12:13 AM",
                      style: TextStyle(color: Colors.black26),
                    )),
                Padding(
                  padding:  EdgeInsets.all(8.0.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /* CircleAvatar(
                        radius: 16,
                        child: Text("AH",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12)),
                      ), */
                      Padding(
                        padding:  EdgeInsets.only(left: 8.0.w),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10.r),
                                  bottomLeft: Radius.circular(10.r),
                                  topRight: Radius.circular(10.r)),
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 2)
                              ]),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(
                                vertical: 14.0.h, horizontal: 12.w),
                            child: Text(
                              "Hello, I want to request",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 18.sp),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(8.0.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(right: 8.0.w),
                        child: Container(
                          decoration: _boxDecoration(),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(
                                vertical: 14.0.h, horizontal: 12.w),
                            child: Text(
                              "Hello, I want to request",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      /*  CircleAvatar(
                        radius: 16,
                        child: Text("AH",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12)),
                      ), */
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(8.0.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*  CircleAvatar(
                        radius: 16,
                        child: Text("AH",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12)),
                      ), */
                      Padding(
                        padding:  EdgeInsets.only(left: 8.0.w),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10.r),
                                  bottomLeft: Radius.circular(10.r),
                                  topRight: Radius.circular(10.r)),
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 2)
                              ]),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(
                                vertical: 14.0.h, horizontal: 12.w),
                            child: Text(
                              "Hello, I want to request",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 18.sp),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(8.0.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(right: 8.0.w),
                        child: Container(
                          decoration: _boxDecoration(),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(
                                vertical: 14.0.h, horizontal: 12.w),
                            child: Text(
                              "Hello, I want to request",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      /*  CircleAvatar(
                        radius: 16,
                        child: Text("AH",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12)),
                      ), */
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(8.0.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /* CircleAvatar(
                        radius: 16,
                        child: Text("AH",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12)),
                      ), */
                      Padding(
                        padding:  EdgeInsets.only(left: 8.0.w),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10.r),
                                  bottomLeft: Radius.circular(10.r),
                                  topRight: Radius.circular(10.r)),
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 2)
                              ]),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(
                                vertical: 14.0.h, horizontal: 12.w),
                            child: Text(
                              "Hello, I want to request",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 18.sp),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(8.0.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(right: 8.0.w),
                        child: Container(
                          decoration: _boxDecoration(),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(
                                vertical: 14.0.h, horizontal: 12.w),
                            child: Text(
                              "Hello, I want to request",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      /*  CircleAvatar(
                        radius: 16,
                        child: Text("AH",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12)),
                      ), */
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 90.h),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: MediaQuery.of(context).size.height,
                                color: Color(0xff737373),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20.r),
                                        topLeft: Radius.circular(20.r)),
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.all(8.0.w),
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Center(
                                          child: Container(
                                            height: 4.h,
                                            width: 50.w,
                                            color: Colors.grey.shade200,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Padding(
                                            padding:  EdgeInsets.all(8.0.w),
                                            child: Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.yellow,
                                                    borderRadius:
                                                    BorderRadius.all(
                                                      Radius.circular(20.r),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                     EdgeInsets.all(
                                                        4.0.w),
                                                    child: Icon(
                                                      Icons.image,
                                                      size: 40.w,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 30.w),
                                              ],
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Padding(
                                            padding:  EdgeInsets.all(8.0.w),
                                            child: Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.yellow,
                                                    borderRadius:
                                                    BorderRadius.all(
                                                      Radius.circular(20.r),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                     EdgeInsets.all(
                                                        4.0.w),
                                                    child: Icon(
                                                      Icons.insert_drive_file,
                                                      size: 40.w,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 30.w,
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                      child: Padding(
                        padding:  EdgeInsets.only(left: 3.0.w),
                        child: Image.asset(
                          ImageConstants.ic_chat_add,
                          width: 35.w,
                          height: 35.h,
                        ),
                      ),
                    ),

                    // Edit text
                    Flexible(
                      child: Padding(
                        padding:  EdgeInsets.all(8.0.w),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: Colors.black26)),
                          child: Padding(
                            padding:  EdgeInsets.all(8.0.w),
                            child: Row(
                              children: [
                                // Image.asset(ImageConstants.ic_chat_add,height: 30,width: 30,),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxHeight: 90.h,
                                    maxWidth:
                                    (MediaQuery.of(context).size.width / 2).w,
                                  ),
                                  child: TextField(
                                    // controller: textEditingController,
                                    minLines: 1,
                                    maxLines: 5,
                                    onChanged: (value) {
                                      // setState(() {
                                      //   // message = value;
                                      // });
                                    },
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15.0.sp),
                                    decoration: InputDecoration.collapsed(
                                      hintText: 'Type your message...',
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Button send message
                    Material(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Image.asset(ImageConstants.ic_send,
                            width: 35, height: 45),
                      ),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.grey, width: 0.5)),
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        color: Color(0xff7004E3),
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            topLeft: Radius.circular(10)),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2)]);
  }
}
