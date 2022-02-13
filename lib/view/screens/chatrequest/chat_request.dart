import 'package:daytte/consts/constants.dart';
import 'package:daytte/consts/image_constants.dart';
import 'package:daytte/themes/app_styles.dart';
import 'package:daytte/themes/color_styles.dart';
import 'package:daytte/utils/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatRequest extends StatelessWidget {
 final int totalCount = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(Constants.charRequest, color: Color(0xffF7F8FA)),
      backgroundColor: Color(0xffF7F8FA),
      body: Card(
        child: ListView.separated(
          itemBuilder: (context, index) => Padding(
            padding:  EdgeInsets.all(16.0.w),
            child: ListTile(
              // minVerticalPadding: 5,
              contentPadding: EdgeInsets.zero,

              leading: CircleAvatar(
                radius: 30.0.r,
                backgroundImage: AssetImage(ImageConstants.girl),
                backgroundColor: Colors.transparent,
              ),
              title: Padding(
                padding:  EdgeInsets.only(left: 15.0.w),
                child: Text(
                  "Seema khan",
                  style: AppStyles.title.copyWith(fontWeight: FontWeight.w400)
              )),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircleAvatar(
                      radius: 18.r,
                      backgroundColor: Color(0xff08E300),
                      child: Icon(
                        Icons.done,
                        color: Colors.white,
                      )),
                  SizedBox(width: 15),
                  CircleAvatar(
                    radius: 18.r,
                    backgroundColor: Color(0xffFF5A5A),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          itemCount: totalCount,
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              color: secondaryTextColor.withOpacity(0.5),
              height: 2,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
            );
          },
        ),
      ),
    );
  }

  AppBar _appBarWidget(String title, {Color? color}) {
    return AppBar(
        backgroundColor: color ?? Colors.white,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () => onBackPressed(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff363636),
              size: 25.w,
            )),
        title: Text(
          title,
          style: AppStyles.title
              .copyWith(fontWeight: FontWeight.w400, fontSize: 18.sp),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.more_vert,
              color: Colors.black,
              size: 28.w,
            ),
          )
        ]);
  }
}
