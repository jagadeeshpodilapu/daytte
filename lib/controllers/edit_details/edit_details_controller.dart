import 'dart:convert';
import 'dart:io';

import 'package:daytte/controllers/base_controller/baseController.dart';
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
  GetEditDetailsModel? getEditDetailsModel;

  @override
  void onReady() {
    super.onReady();
    gettingImages(
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVmYTdiMmYyZjE5MzNkMTE0NTMyM2E2ZSIsImlhdCI6MTYwNDgyNTg0MiwiZXhwIjoxNjA0ODI2NzQyfQ.a5x5ktqPb2NAxUc-bKMgY8660zrFB_vK-q59S0SudDg");
    update();
  }

  void handleGenderChange(String? value) {
    groupValue = value!;
    update();
  }

  List<File> pickedImages = [];
  File? imageStore;
  final storage = GetStorage();

  @override
  void onInit() {
    storage.write("page", "7");

    super.onInit();
  }

//Pick an image
  openGallery() async {
    image = await _picker.pickImage(
        maxHeight: 100,
        maxWidth: 100,
        imageQuality: 100,
        source: ImageSource.gallery);
    if (image != null) {
      imageStore = File(image!.path);
      pickedImages.add(imageStore!);
    }
    update();
  }

  // Capture a photo
  openCamera() async {
    image = await _picker.pickImage(
        maxHeight: 100,
        maxWidth: 100,
        imageQuality: 100,
        source: ImageSource.camera);
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
    List<String> encodeImage = [];
    if (image != null) {
      DialogHelper.showLoading('Loading...');
      for (var i in pickedImages) {
        List<int> imageBytes = i.readAsBytesSync();

        base64EncodeImage = base64Encode(imageBytes);

        encodeImage.add(base64EncodeImage);

        base64Images.addAll(encodeImage);
      }
    }
    uploadImages("userId", base64Images);
  }

 Future uploadImages(String userId, List base64) async {
    Map<String, dynamic> payload = {
      "userId": "5fb21b4cf46d5c3170285e68",
      "galleries": base64Images
    };

    final response = await BaseClient()
        .post('/galleries/upload', payload)
        .catchError(BaseController().handleError);

    DialogHelper.hideLoading();
    if (response != null) {
      editDetailsModel = EditDetailsModel.fromJson(response);
      if (editDetailsModel != null) {
        storage.write("isLogged", true);
        editDetailsModel = EditDetailsModel.fromJson(response);
        Get.toNamed(AppRoutes.HOMEVIEW);
      }
    }
  }

  gettingImages(String token) async {
    DialogHelper.showLoading('Loading...');
    final response = await BaseClient()
        .get(
            '/galleries?skip=0&limit=10&userId=5fb21b4cf46d5c3170285e68', token)
        .catchError(BaseController().handleError);

    printData(className: "kljhgjkl;kjhg", data: response);

    DialogHelper.hideLoading();
    if (response != null) {
      getEditDetailsModel = GetEditDetailsModel.fromJson(response);

      if (getEditDetailsModel != null) {
        for (var i in getEditDetailsModel!.data.galleries) {
          getImages.add("${i.imgPath}");
          update();
        }

        update();
      }
    }
  }
}
