import 'dart:convert';
import 'dart:io';

import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:daytte/model/edit_detail_model.dart';
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

  baseConvert() {
    String base64EncodeImage = "";
    List<String> encodeImage = [];
    if (image != null) {
      for (var i in pickedImages) {
        List<int> imageBytes = i.readAsBytesSync();
        //print("imageBytes,,$imageBytes");
        base64EncodeImage = base64Encode(imageBytes);
        // print("pickedImages,,$pickedImages");
        encodeImage.add(base64EncodeImage);
        print("encodeImage,,$encodeImage");
        base64Images.addAll(encodeImage);
      }
      //base64Images.addAll(encodeImage);
      print("base64Images,,$base64Images");
    }
    uploadImages("userId", base64Images);
  }

  uploadImages(String userId, List base64) async {
    Map<String, dynamic> payload = {
      "userId": "5fb21b4cf46d5c3170285e68",
      "galleries": base64Images
    };

    DialogHelper.showLoading('Images Uploaded Successfully');
    final response = await BaseClient()
        .post('/galleries/upload', payload)
        .catchError(BaseController().handleError);

    editDetailsModel = EditDetailsModel.fromJson(response);

    printData(className: this.runtimeType, data: response);

    DialogHelper.hideLoading();
    if (response != null) {
      if (editDetailsModel != null) {
        print("responce......$response");
        editDetailsModel!.message;
      }
    }
  }

  gettingImages(String token) async {
    DialogHelper.showLoading('Images Uploaded Successfully');
    final response = await BaseClient()
        .get(
            '/galleries?skip=0&limit=10&userId=5fb21b4cf46d5c3170285e68', token)
        .catchError(BaseController().handleError);

    getEditDetailsModel = GetEditDetailsModel.fromJson(response);

    printData(className: this.runtimeType, data: response);

    DialogHelper.hideLoading();
    if (response != null) {
      if (getEditDetailsModel != null) {
        print("responce......$response");
        getEditDetailsModel!.message;
        for (var i in getEditDetailsModel!.data.galleries) {
          getImages.add("${i.imgPath}");
          update();
        }
        print("getimages ,,,,#$getImages");
        update();
      }
    }
  }
}
