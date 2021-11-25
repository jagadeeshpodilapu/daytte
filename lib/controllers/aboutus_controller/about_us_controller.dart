import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../routes/app_routes.dart';
import '../../services/base_service/base_client.dart';
import '../../view/dialogs/dialogHelper.dart';
import '../base_controller/baseController.dart';
import '../otpController/otp_controller.dart';

class AboutUsController extends BaseController {
  TextEditingController shortDisc = TextEditingController();

  final storage = GetStorage();
  final ImagePicker _picker = ImagePicker();
  List<XFile>? imageFileList;
  XFile? image;
  List<String> getImages = [];
  List<File> pickedImages = [];
  File? imageStore;

  updateShortDescription() async {
    final payload = {"shortDescription": shortDisc.text};
    DialogHelper.showLoading('Loading...');
    final response = await BaseClient()
        .patch('/users/${storage.read("id")}', payload, storage.read('token'))
        .catchError(handleError);
    if (response == null) return;
    print("response Gender $response");
    DialogHelper.hideLoading();
    if (response != null) {
      print("result of gender $response");
      storage.write("page", "6");
      Get.offAndToNamed(AppRoutes.EDITDETAILS);
    }
  }

  //Pick an image
  openGallery() async {
    image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageStore = File(image!.path);
      pickedImages.add(imageStore!);
    }
    update();
  }

  // Capture a photo
  openCamera() async {
    image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imageStore = File(image!.path);
      pickedImages.add(imageStore!);
    }

    update();
  }

  removeImage(File item) {
    pickedImages.remove(item);
    update();
  }
}
