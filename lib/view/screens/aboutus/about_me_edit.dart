import 'dart:io';

import 'package:daytte/consts/constants.dart';
import 'package:daytte/controllers/aboutus_controller/about_us_controller.dart';
import 'package:daytte/view/widgets/button_widget.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
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
          return Column(
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
              Center(
                child: SizedBox(
                  width: Get.width * 0.8,
                  child: RaisedGradientButton(
                    onPressed: () {},
                    title: "Add Media",
                  ),
                ),
              )
            ],
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
}
