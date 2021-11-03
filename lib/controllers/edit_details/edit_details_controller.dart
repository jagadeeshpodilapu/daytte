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
      "userId": storage.read('id'),
      "galleries": base64Images
    };

    DialogHelper.showLoading('Uploading ...');
    final response = await BaseClient()
        .post('/galleries/upload', payload)
        .catchError(BaseController().handleError);

    DialogHelper.hideLoading();
    if (response != null) {
      editDetailsModel = EditDetailsModel.fromJson(response);
      if (editDetailsModel != null) {
        storage.write("isLogged", true);
        editDetailsModel = EditDetailsModel.fromJson(response);
        storage.write("page", "7");
        Get.toNamed(AppRoutes.HOMEVIEW);
      }
    }
  }

  gettingImages() async {
    DialogHelper.showLoading('Loading...');
    final response = await BaseClient()
        .get('/galleries?skip=0&limit=10&userId=${userId.value}',
            storage.read('token'))
        .catchError(BaseController().handleError);
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
