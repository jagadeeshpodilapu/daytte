import 'dart:io';

import 'package:daytte/consts/constants.dart';
import 'package:daytte/controllers/aboutus_controller/about_us_controller.dart';
import 'package:daytte/routes/app_routes.dart';
import 'package:daytte/view/widgets/button_widget.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:daytte/view/widgets/textfield_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AboutMeEdit extends StatelessWidget {
  const AboutMeEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: appBarWidget("About Me", color: Color(0xffF7F8FA)),
      backgroundColor: Color(0xffF7F8FA),
      body: GetBuilder<AboutUsController>(
        init: AboutUsController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text(Constants.addPhoto,
                        textAlign: TextAlign.center,
                        style: theme.headline6?.copyWith(fontSize: 22))),
                addVerticalSpace(4),
                Center(
                  child: Text(
                    Constants.select2Pics,
                    style: theme.bodyText2?.copyWith(color: Color(0xff9A9A9A)),
                  ),
                ),
                _addGalleryWidget(controller),
                addVerticalSpace(10),
                Center(child: addMediaButtonWidget(context)),
                detailsWidget(),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: RaisedGradientButton(
                        width: Get.width * 0.8,
                        title: Constants.saveChanges,
                        onPressed: () => Get.offAndToNamed(AppRoutes.HOMEVIEW)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _addGalleryWidget(AboutUsController controller) {
    return Padding(
      padding: EdgeInsets.only(left: 24.0, top: 12),
      child: Wrap(
        spacing: 10,
        children: [
          InkWell(
              onTap: () {
                controller.openGallery();
              },
              child: DottedBorder(
                dashPattern: [5, 6],
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icon/camera.svg',
                          width: 45, height: 30),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(Constants.addPhoto,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.black54)),
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
        ],
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
      padding: const EdgeInsets.only(bottom: 15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(height: 105, width: 105, child: image),
            Positioned(
              right: -5,
              top: -5,
              child: InkWell(
                onTap: () {
                  item != null ? controller.removeImage(item) : null;
                  // file != null ? controller.deleteImageSelection(file) : null;
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

  Widget addMediaButtonWidget(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.8,
      child: RaisedGradientButton(
          title: Constants.addMedia,
          onPressed: () async {
            /*  if (controller.pickedImages.length >= 2 ||
                controller.galleryImages.length >= 2) {
              await controller.baseConvert();
              if (controller.editDetailsModel != null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("${controller.editDetailsModel?.message}")));
              }
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(Constants.select2Pics)));
            } */
          }),
    );
  }

  Container detailsWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 0.7),
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
                    Text("Edit")
                  ],
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  maxLines: 3,
                  decoration: InputDecoration(
                    enabledBorder: _outlineBorder(Color(0xFF9A9A9A)),
                    focusedBorder: _outlineBorder(Color(0xFf7834F4)),
                    errorBorder: _outlineBorder(Colors.red),
                    focusedErrorBorder: _outlineBorder(Colors.red),
                  ),
                ),
              ],
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: headingWithTextStyle(0.9, Constants.passion, 17.5),
                )),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: List.generate(
                  4,
                  (index) => Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Movies"),
                        ),
                      )),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: headingWithTextStyle(0.9, Constants.company, 17.5),
                )),
            TextFieldWidget(
                label: '', hint: '', controller: TextEditingController()),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: headingWithTextStyle(0.9, Constants.school, 17.5),
                )),
            TextFieldWidget(
              label: '',
              hint: '',
              controller: TextEditingController(),
            ),
            addVerticalSpace(10)
          ],
        ),
      ),
    );
  }

  Widget headingWithTextStyle(double opacity, String text, double size) {
    return Opacity(
      opacity: opacity,
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: TextStyle(
            color: const Color(0xff273d52),
            fontWeight: FontWeight.w500,
            fontFamily: "Avenir",
            fontStyle: FontStyle.normal,
            fontSize: size),
      ),
    );
  }

  OutlineInputBorder _outlineBorder(Color color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color, width: 1.5));
  }
}
