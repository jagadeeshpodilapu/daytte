import 'package:daytte/consts/image_constants.dart';
import 'package:daytte/controllers/imagepickercontroller/select_image_controller.dart';
import 'package:daytte/routes/app_routes.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(
                  height: 2,
                  color: Colors.grey,
                ),
              ),
              InkWell(
                  onTap: () => controller.pickImage(ImageSource.gallery),
                  child:
                      buildSourceWidget(ImageConstants.ic_gallery, "GALLERY")),
              ElevatedButton(
                  onPressed: () => Get.toNamed(AppRoutes.HOMEVIEW),
                  child: Text("Next"))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSourceWidget(String icon, String sourceText) {
    return Container(
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
