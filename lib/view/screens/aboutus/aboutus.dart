import 'dart:io';

import 'package:daytte/consts/constants.dart';
import 'package:daytte/consts/image_constants.dart';
import 'package:daytte/controllers/aboutus_controller/about_us_controller.dart';
import 'package:daytte/themes/app_styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/button_widget.dart';
import '../../widgets/common_widgets.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffF7F8FA),
      appBar: appBarWidget(/*Constants.aboutYou*/ "", color: Color(0xffF7F8FA)),
      body: GetBuilder<AboutUsController>(
        init: AboutUsController(),
        builder: (controller) => ListView(
          children: [
            addPhotoHeadingWidget,
            Padding(
              padding: EdgeInsets.only(left: 24.0.w),
              child: Wrap(
                spacing: 10.w,
                children: [
                  InkWell(
                      onTap: () {
                        controller.openGallery();
                      },
                      child: DottedBorder(
                        dashPattern: [5, 6],
                        child: Container(
                          height: 95.h,
                          width: 95.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(ImageConstants.ic_photo,
                                  width: 45.w, height: 30.h),
                              Padding(
                                padding:  EdgeInsets.all(8.0.w),
                                child: Text(Constants.addPhoto,
                                    style: AppStyles.title2.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF9A9A9A))),
                              ),
                            ],
                          ),
                        ),
                      )),
                  // for (var item in controller.pickedImages)
                  //   listOfImagesSelected(item),
                  for (var item in controller.pickedImages)
                    buildPaddingImage(
                        item: item,
                        controller: controller,
                        image: Image.file(
                          File(item.path),
                          fit: BoxFit.cover,
                        )),
                  for (var im in controller.galleryImages)
                    buildPaddingImage(
                        controller: controller,
                        image: Image.network(
                          im.imgPath,
                          fit: BoxFit.fill,
                        ),
                        file: im.id),
                ],
              ),
            ),
            addVerticalSpace(10.h),
            addMediaButtonWidget(context, controller),
          ],
        ),
      ),
    );
  }

  Padding buildPaddingImage({
    File? item,
    required AboutUsController controller,
    required Widget image,
    String? file,
  }) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 15.0.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0.r),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(height: 100.h, width: 100.w, child: image),
            Positioned(
              right: -5,
              top: -5,
              child: InkWell(
                onTap: () {
                  item != null ? controller.removeImage(item) : null;
                  file != null ? controller.deleteImageSelection(file) : null;
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Icon(Icons.clear),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding addMediaButtonWidget(
    BuildContext context,
    AboutUsController controller,
  ) {
    return Padding(
      padding:  EdgeInsets.all(14.0.w),
      child: RaisedGradientButton(
          title: Constants.addMedia,
          onPressed: () async {
            if (controller.pickedImages.length >= 2 ||
                controller.galleryImages.length >= 2) {
              await controller.baseConvert();
              if (controller.editDetailsModel != null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("${controller.editDetailsModel?.message}")));
              }
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(Constants.select2Pics)));
            }
          }),
    );
  }

  Widget aboutYoursWidget(AboutUsController controller) {
    return Card(
      elevation: 2,
      child: Padding(
        padding:  EdgeInsets.all(8.0.w),
        child: TextFormField(
          controller: controller.shortDisc,
          decoration: InputDecoration(
            hintText: Constants.aboutYou,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.w),
            ),
          ),
          maxLines: 10,
        ),
      ),
    );
  }

  Widget get addPhotoHeadingWidget {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 8.0.w),
            child: Text(Constants.addPhoto,
                style: AppStyles.heading3.copyWith(
                  fontWeight: FontWeight.w500,
                ))),
        Padding(
          padding: EdgeInsets.only(top: 5.h, bottom: 25.h),
          child: Text(
            Constants.select2Pics,
            style: AppStyles.title3.copyWith(
                fontWeight: FontWeight.w400, color: Color(0xFF9A9A9A)),
          ),
        ),
      ],
    );
  }
}
