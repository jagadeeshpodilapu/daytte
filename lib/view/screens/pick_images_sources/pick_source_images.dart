import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../consts/image_constants.dart';
import '../../../controllers/imagepickercontroller/select_image_controller.dart';
import '../../widgets/common_widgets.dart';

class SelectImagesSource extends StatelessWidget {
  final controller = Get.put(SelectImagesController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget("Select Source"),
        body: Card(
          elevation: 2,
          child: Column(
            children: [
              InkWell(
                  onTap: () => controller.pickImage(ImageSource.camera),
                  child: buildSourceWidget(ImageConstants.ic_camera, "CAMERA")),
              InkWell(
                  onTap: () => controller.pickImage(ImageSource.gallery),
                  child:
                      buildSourceWidget(ImageConstants.ic_gallery, "GALLERY")),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSourceWidget(String icon, String sourceText) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey, width: 2.w)),
      child: Padding(
        padding:  EdgeInsets.all(18.0.w),
        child: Row(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 14.0.w),
              child: Image.asset(
                icon,
              ),
            ),
            SizedBox(width: 50.w),
            Text(
              sourceText,
              style: TextStyle(
                  fontSize: 18.sp,
                  color: Color(0xff9A9A9A),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
