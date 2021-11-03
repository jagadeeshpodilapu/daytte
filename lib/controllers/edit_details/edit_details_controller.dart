import 'dart:convert';
import 'dart:io';

import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:daytte/model/delete_gallery.dart';
import 'package:daytte/model/edit_detail_model.dart';
import 'package:daytte/routes/app_routes.dart';
import 'package:daytte/services/base_service/base_client.dart';
import 'package:daytte/utils/common_functions.dart';
import 'package:daytte/view/dialogs/dialogHelper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../view/screens/editdetails/edit_details.dart';

class EditDetailsController extends GetxController {
  SingingCharacter? character = SingingCharacter.male;
  List<String> base64Images = [];
  final ImagePicker _picker = ImagePicker();
  String groupValue = 'male';
  List<XFile>? imageFileList;
  XFile? image;
  List<String> getImages = [];
  EditDetailsModel? editDetailsModel;
  DeleteGalleryModel? deleteGalleryModel;
  GetEditDetailsModel? getEditDetailsModel;
  List<Gallery> galleryImages = [];

  @override
  void onReady() {
    super.onReady();
    gettingImages();
    update();
  }

  void handleGenderChange(String? value) {
    groupValue = value!;
    update();
  }

  List<File> pickedImages = [];
  File? imageStore;
  final storage = GetStorage();
  RxString userId = ''.obs;

  @override
  void onInit() {
    userId.value = storage.read('id');

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

  Future<void> baseConvert() async {
    String base64EncodeImage = "";

    DialogHelper.showLoading('Loading...');
    if (image != null) {
      for (var i in pickedImages) {
        List<int> imageBytes = i.readAsBytesSync();
        base64EncodeImage = base64Encode(imageBytes);
        base64Images.add("data:image/jpeg;base64,$base64EncodeImage");
        update();
      }
      print("base64Images,,$base64Images");
    }
    uploadImages(base64Images);
  }

  Future uploadImages(List base64) async {
    print("base64 images list $base64");
    Map<String, dynamic> payload = {
      "userId": userId.value,
      "galleries": base64
    };

    final response = await BaseClient()
        .post('/galleries/upload', payload)
        .catchError(BaseController().handleError);
    print('image upload response $response');

    DialogHelper.hideLoading();
    if (response != null) {
      editDetailsModel = EditDetailsModel.fromJson(response);
      if (editDetailsModel != null) {
        storage.write("isLogged", true);
        storage.write("page", "7");
        editDetailsModel = EditDetailsModel.fromJson(response);
        update();
        Future.delayed(Duration(seconds: 2), () async {
          await gettingImages();
          Get.offAndToNamed(AppRoutes.HOMEVIEW);
        });
      }
    }
  }

  Future gettingImages() async {
    final response = await BaseClient()
        .get('/galleries?skip=0&limit=60&userId=${userId.value}',
            storage.read('token'))
        .catchError(BaseController().handleError);

    if (response != null) {
      getEditDetailsModel = GetEditDetailsModel.fromJson(response);
      print('getting images response $response');
      print(
          'getting images response ${getEditDetailsModel?.data.galleries.length}');

      if (getEditDetailsModel != null) {
        galleryImages = getEditDetailsModel!.data.galleries;
        update();
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
    print('Images delete payload $payload');

    DialogHelper.showLoading('Deleting Image...');
    final response = await BaseClient()
        .delete('/galleries/$id', payload)
        .catchError(BaseController().handleError);
    print('delted images response $response');

    printData(className: this.runtimeType, data: response);

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
