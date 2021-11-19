import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey, width: 2)),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Image.asset(
                icon,
              ),
            ),
            SizedBox(width: 50),
            Text(
              sourceText,
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff9A9A9A),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
