import 'dart:io';
import 'package:daytte/consts/constants.dart';
import 'package:daytte/consts/image_constants.dart';
import 'package:daytte/routes/app_routes.dart';
import 'package:daytte/themes/app_styles.dart';
import 'package:daytte/themes/color_styles.dart';
import 'package:daytte/view/widgets/button_widget.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../controllers/edit_details/edit_details_controller.dart';

enum SingingCharacter { male, female }

class EditDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBarWidget(Constants.editDetails,
          color: backgroundColor, isBack: false),
      body: GetBuilder<EditDetailsController>(
        init: EditDetailsController(),
        didChangeDependencies: (state) => state.controller?.getUserUpdateData(),
        builder: (controller) => ListView(
          children: [
            addPhotoHeadingWidget,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Wrap(
                spacing: 10.w,
                children: [
                  InkWell(
                      onTap: () {
                        controller.openGallery();
                      },
                      child: DottedBorder(
                        dashPattern: [5, 6],
                        radius: Radius.circular(8.r),
                        borderType: BorderType.RRect,
                        color: secondaryTextColor,
                        child: Container(
                          height: 95.h,
                          width: 95.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14.r)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(ImageConstants.camera,
                                  width: 45.w, height: 30.r),
                              addVerticalSpace(12.h),
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
                        errorBuilder: (context, _, __) {
                          return Image.asset(
                            "assets/images/placeholder.jpg",
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  for (var im in controller.galleryImages)
                    buildPaddingImage(
                        controller: controller,
                        image: Image.network(
                          im.imgPath,
                          fit: BoxFit.fill,
                          errorBuilder: (context, _, __) {
                            return Image.asset(
                              "assets/images/placeholder.jpg",
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                        file: im.id),
                ],
              ),
            ),
            addVerticalSpace(10.h),
            addMediaButtonWidget(context, controller),
            addVerticalSpace(10.h),
            detailsWidget(controller),
            addVerticalSpace(10.h),
            Padding(
              padding:  EdgeInsets.all(14.0.w),
              child: RaisedGradientButton(
                  title: Constants.saveChanges,
                  onPressed: () async {
                    await controller.saveUserDetails();
                    if (controller.responseModel != null)
                      snackbarMessage(
                          controller.responseModel?.message ?? "", context);
                  }),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }

  Container detailsWidget(EditDetailsController controller) {
    controller.aboutMeController.text =
        controller.userModel?.data.user?.shortDescription ?? "";
    // controller.schoolController.text =
    //     controller.userModel?.data.user?.institute?.name ?? "Bangalore university";
    // controller.companyController.text =
    //     controller.userModel?.data.user?.interestedIn ?? "";
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0.w),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 0.7),
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            /*  BoxShadow(
                color: const Color(0xffd4dcdd),
                offset: Offset(3, 9),
                blurRadius: 4,
                spreadRadius: -9) */
          ],
          color: const Color(0xffffffff)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 10.h),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0.h),
                      child: headingWithTextStyle(0.9, "About Me", 17.5),
                    ),
                    GestureDetector(
                        onTap: () => controller.editToggle(),
                        child: Text(
                          "Edit",
                          style: AppStyles.title3.copyWith(
                              color: Color(0xFF9A9A9A),
                              fontWeight: FontWeight.w400),
                        ))
                  ],
                ),
                Obx(
                  () => TextFormField(
                    style:
                        AppStyles.title.copyWith(fontWeight: FontWeight.w400),
                    maxLines: 2,
                    controller: controller.aboutMeController,
                    autofocus: controller.isEdit.value,
                    readOnly: !controller.isEdit.value,
                    decoration: _inputDecoration(),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:  EdgeInsets.all(8.0.w),
                      child: headingWithTextStyle(0.9, Constants.passion, 17.5),
                    )),
                GestureDetector(
                    onTap: () {
                      GetStorage().write("passion", "EditProfilePassion");
                      Get.toNamed(AppRoutes.PASSION);
                    },
                    child: Text("Edit",
                        style: AppStyles.title3.copyWith(
                            color: Color(0xFF9A9A9A),
                            fontWeight: FontWeight.w400))),
              ],
            ),
            Wrap(
              spacing: 6.w,
              runSpacing: 6.w,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: List.generate(
                  controller.userModel?.data.user?.passion?.length ?? 0,
                  (index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: Colors.grey)),
                  child: Padding(
                    padding:  EdgeInsets.all(8.0.w),
                    child: Text(
                      "${controller.userModel?.data.user?.passion?[index].name}",
                    ),
                  ),
                );
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:  EdgeInsets.all(8.0.w),
                      child: headingWithTextStyle(0.9, Constants.school, 17.5),
                    )),
                GestureDetector(
                    onTap: () {
                      GetStorage().write("university", "EditProfileUniversity");
                      Get.toNamed(AppRoutes.UNIVERSITY);
                    },
                    child: Text("Edit",
                        style: AppStyles.title3.copyWith(
                            color: Color(0xFF9A9A9A),
                            fontWeight: FontWeight.w400))),
              ],
            ),
            TextFormField(
              readOnly: true,
              controller: controller.schoolController,
              style: AppStyles.title.copyWith(fontWeight: FontWeight.w400),
              autofocus: controller.isEdit.value,
              decoration: _inputDecoration(),
            ),
            addVerticalSpace(15),
            _genderSelectWidget(controller),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      enabledBorder: _outlineBorder(Color(0xFFe1e1e1)),
      fillColor: Color(0xfffcfcfc),
      filled: true,
      focusedBorder: _outlineBorder(Color(0xFf7834F4)),
      errorBorder: _outlineBorder(Colors.red),
      focusedErrorBorder: _outlineBorder(Colors.red),
    );
  }

  Widget _genderSelectWidget(EditDetailsController controller) {
    return Card(
      elevation: 1.0,
      child: ListTile(
        //onTap: () => Get.to(() => InterestedScreen()),
        title: _subHeadGreyText(Constants.gender),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _titleBoldText(controller.userModel?.data.user?.gender ?? ""),
            addHorizontalSpace(8.w),
            // _backArrow()
          ],
        ),
      ),
    );
  }

  Text _subHeadGreyText(String title, {double? size}) {
    return Text(
      title,
      style: AppStyles.title
          .copyWith(fontSize: size?.sp ?? 16.sp, color: Color(0xff9A9A9A)),
    );
  }

  Widget _titleBoldText(String header) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(header,
          style: AppStyles.title
              .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w400)),
    );
  }

/*   Container detailsWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffe5eced), width: 0.7),
          boxShadow: [
            BoxShadow(
                color: const Color(0xffd4dcdd),
                offset: Offset(3, 9),
                blurRadius: 4,
                spreadRadius: -9)
          ],
          color: const Color(0xffffffff)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: headingWithTextStyle(0.9, "About Me", 17.5),
                    ),
                    editIconWidget(),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: headingWithTextStyle(
                        0.6,
                        "${controller.userController.findNearestModel?.data.users?.first.shortDescription}",
                        13.5)),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child:
                            headingWithTextStyle(0.9, Constants.passion, 17.5)),
                    editIconWidget(),
                  ],
                ),
                Wrap(
                  spacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    ...List.generate(
                        controller.userController.findNearestModel?.data.users
                                ?.first.passion?.length ??
                            0, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black54,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 6),
                            child: Text(
                                "${controller.userController.findNearestModel?.data.users?.first.passion?[index].name}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.black54)),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child:
                            headingWithTextStyle(0.9, Constants.company, 17.5)),
                    editIconWidget()
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "AddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompany",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.black26),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child:
                            headingWithTextStyle(0.9, Constants.school, 17.5)),
                    Image.asset(
                      "assets/icons/Edit.png",
                      color: Colors.black54,
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "AddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompany",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.black26),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
 */

  Widget addMediaButtonWidget(
    BuildContext context,
    EditDetailsController controller,
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

  Padding buildPaddingImage(
      {File? item,
      required EditDetailsController controller,
      required Widget image,
      String? file}) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 15.0.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0.r),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(height: 100.h, width: 100.w, child: image),
            /* controller.galleryImages.length>2 ? */ Positioned(
              right: -5.w,
              top: -5.h,
              child: InkWell(
                onTap: () {
                  if (controller.pickedImages.length >= 3 ||
                      controller.galleryImages.length >= 2) {
                    item != null ? controller.removeImage(item) : null;
                    file != null ? controller.deleteImageSelection(file) : null;
                  }
                  ;
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Icon(Icons.clear),
                ),
              ),
            ) /* :SizedBox() */
          ],
        ),
      ),
    );
  }

  Widget get addPhotoHeadingWidget {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 8.0.h),
            child: Text(Constants.addPhoto,
                style:
                    AppStyles.heading3.copyWith(fontWeight: FontWeight.w500))),
        Padding(
          padding: EdgeInsets.only(top: 5.h, bottom: 25.h),
          child: Text(
            Constants.select2Pics,
            style: AppStyles.title3.copyWith(color: secondaryTextColor),
          ),
        ),
      ],
    );
  }

  Widget headingWithTextStyle(double opacity, String text, double size) {
    return Opacity(
      opacity: opacity,
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: AppStyles.title.copyWith(fontWeight: FontWeight.w400),
      ),
    );
  }

  OutlineInputBorder _outlineBorder(Color color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: color, width: 1.w));
  }
}
