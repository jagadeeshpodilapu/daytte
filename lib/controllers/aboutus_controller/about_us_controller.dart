import 'dart:convert';
import 'dart:io';
import 'package:daytte/model/delete_gallery.dart';
import 'package:daytte/model/edit_detail_model.dart';
import 'package:daytte/model/single_user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../../routes/app_routes.dart';
import '../../services/base_service/base_client.dart';
import '../../view/dialogs/dialogHelper.dart';
import '../base_controller/baseController.dart';

class AboutUsController extends BaseController {
  TextEditingController shortDisc = TextEditingController();
  List<String> base64Images = [];
  final storage = GetStorage();
  final ImagePicker _picker = ImagePicker();
  List<XFile>? imageFileList;
  XFile? image;
  List<String> getImages = [];
  List<Gallery> galleryImages = [];
  List<File> pickedImages = [];
  File? imageStore;
  RxString userId = ''.obs;
  GetEditDetailsModel? getEditDetailsModel;
  SingleUserModel? userModel;
  EditDetailsModel? editDetailsModel;
  DeleteGalleryModel? deleteGalleryModel;

  @override
  void onInit() {
    userId.value = storage.read('id') ?? "";
    storage.write("page", "7");
    super.onInit();
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

  Future gettingImages() async {
    final response = await BaseClient()
        .get('/galleries?skip=0&limit=60&userId=${userId.value}',
            storage.read('token'))
        .catchError(BaseController().handleError);

    if (response != null) {
      getEditDetailsModel = GetEditDetailsModel.fromJson(response);

      if (getEditDetailsModel != null) {
        galleryImages = getEditDetailsModel!.data.galleries;
        getUserUpdateData();
        update();
      }
    }
  }

  Future getUserUpdateData() async {
    DialogHelper.showLoading('Loading...');
    final response = await BaseClient()
        .get('/users/${storage.read("id")}', storage.read('token'))
        .catchError(handleError);
    if (response == null) return;

    DialogHelper.hideLoading();
    if (response != null) {
      userModel = SingleUserModel.fromJson(response);
    }
    update();
  }

  Future<void> baseConvert() async {
    String base64EncodeImage = "";

    DialogHelper.showLoading('Loading...');
    if (image != null) {
      for (var i in pickedImages) {
        List<int> imageBytes = i.readAsBytesSync();
        base64EncodeImage = base64Encode(imageBytes);
        base64Images.add("data:image/jpeg;base64,$base64EncodeImage");
        //  update();
      }
    }
    uploadImages(base64Images);
  }

  Future uploadImages(List base64) async {
    Map<String, dynamic> payload = {
      "userId": userId.value,
      "galleries": base64
    };

    final response = await BaseClient()
        .post('/galleries/upload', payload)
        .catchError(handleError);

    DialogHelper.hideLoading();
    if (response != null) {
      editDetailsModel = EditDetailsModel.fromJson(response);
      if (editDetailsModel != null) {
        storage.write("isLogged", true);
        // storage.write("page", "7");
        editDetailsModel = EditDetailsModel.fromJson(response);
        update();
        // Future.delayed(Duration(seconds: 2), () async {
        await gettingImages();
        Get.offAndToNamed(AppRoutes.HOMEVIEW);
        // });
      }
    }
  }

  deleteImageSelection(String deleteId) {
    deleteImage(deleteId);
  }

  deleteImage(String id) async {
    Map<String, dynamic> payload = {
      "id": id,
    };

    DialogHelper.showLoading('Deleting Image...');
    final response = await BaseClient()
        .delete('/galleries/$id', payload)
        .catchError(BaseController().handleError);

    if (response != null) {
      DialogHelper.hideLoading();
      deleteGalleryModel = DeleteGalleryModel.fromJson(response);
      update();
      if (deleteGalleryModel != null) {
        gettingImages();
      }
    }
  }
}
