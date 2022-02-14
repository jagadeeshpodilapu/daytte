import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding:  EdgeInsets.all(18.0.w),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.wifi_off_outlined),
              SizedBox(
                height: (Get.height * 0.02).w,
              ),
              Text(
                'NO INTERNET CONNECTION',
                style: TextStyle(
                    color: Colors.orange, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: (Get.height * 0.01).h,
              ),
              Text(
                'You don\'t have internet connection, continue offline mode?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
