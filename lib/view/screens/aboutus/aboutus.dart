import 'dart:io';
import 'package:daytte/consts/constants.dart';
import 'package:daytte/consts/image_constants.dart';
import 'package:daytte/controllers/aboutus_controller/about_us_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
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
              padding: EdgeInsets.only(left: 24.0),
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
                          height: 95,
                          width: 95,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(ImageConstants.ic_photo,
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
            addVerticalSpace(10),
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
      padding: const EdgeInsets.only(bottom: 15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(height: 100, width: 100, child: image),
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
      padding: const EdgeInsets.all(14.0),
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
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller.shortDisc,
          decoration: InputDecoration(
            hintText: Constants.aboutYou,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
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
            padding: EdgeInsets.only(top: 8.0),
            child: Text(Constants.addPhoto,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: "SFPro",
                    fontStyle: FontStyle.normal,
                    fontSize: 22.0))),
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 25),
          child: Text(
            Constants.select2Pics,
            style: const TextStyle(
                color: const Color(0xffcacaca),
                fontWeight: FontWeight.w400,
                fontFamily: "SFProDisplay",
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
          ),
        ),
      ],
    );
  }
}
