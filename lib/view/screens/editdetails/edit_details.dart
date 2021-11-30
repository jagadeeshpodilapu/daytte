import 'dart:io';

import 'package:daytte/consts/constants.dart';
import 'package:daytte/routes/app_routes.dart';
import 'package:daytte/view/widgets/button_widget.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:daytte/view/widgets/textfield_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/edit_details/edit_details_controller.dart';

enum SingingCharacter { male, female }

class EditDetails extends StatelessWidget {
  //final controller = Get.put(EditDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f8fa),
      appBar: appBarWidget(Constants.editDetails, color: Color(0xffF7F8FA)),
      body: GetBuilder<EditDetailsController>(
        init: EditDetailsController(),
        
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
                              Image.asset('assets/icons/Photo.png',
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
            detailsWidget(controller),
            addVerticalSpace(10),
            Padding(
              padding: const EdgeInsets.all(14.0),
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
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Container detailsWidget(EditDetailsController controller) {
    controller.aboutMeController.text =
        controller.userModel?.data.user?.shortDescription ?? "";

    controller.schoolController.text =
        controller.userModel?.data.user?.interestedIn ?? "";
    "";
    controller.companyController.text =
        controller.userModel?.data.user?.interestedIn ?? "";
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
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
                    GestureDetector(
                        onTap: () => controller.editToggle(),
                        child: Text("Edit"))
                  ],
                ),
                Obx(
                  () => TextFormField(
                    style: TextStyle(color: Colors.black),
                    maxLines: 2,
                    controller: controller.aboutMeController,
                    autofocus: controller.isEdit.value,
                    readOnly: !controller.isEdit.value,
                    decoration: _inputDecoration(),
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
                  controller.userModel?.data.user?.passion?.length ?? 0,
                  (index) => Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${controller.userModel?.data.user?.passion?[index].name}",
                          ),
                        ),
                      )),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: headingWithTextStyle(0.9, Constants.company, 17.5),
                )),
            Obx(
              () => TextFieldWidget(
                  label: '',
                  hint: '',
                  readOnly: controller.isEdit.value,
                  controller: controller.companyController),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: headingWithTextStyle(0.9, Constants.school, 17.5),
                )),
            Obx(
              () => TextFieldWidget(
                label: '',
                hint: '',
                readOnly: controller.isEdit.value,
                controller: controller.schoolController,
              ),
            ),
            addVerticalSpace(10)
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      enabledBorder: _outlineBorder(Color(0xFF9A9A9A)),
      fillColor: Color(0xffE1E1E1).withOpacity(0.2),
      filled: true,
      focusedBorder: _outlineBorder(Color(0xFf7834F4)),
      errorBorder: _outlineBorder(Colors.red),
      focusedErrorBorder: _outlineBorder(Colors.red),
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

  Padding addMediaButtonWidget(
    BuildContext context,
    EditDetailsController controller,
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

  Padding buildPaddingImage({
    File? item,
    required EditDetailsController controller,
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
