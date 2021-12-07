import 'dart:io';
import 'package:daytte/model/response_model.dart';
import 'package:daytte/model/single_user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../../model/edit_detail_model.dart';
import '../../services/base_service/base_client.dart';
import '../../view/dialogs/dialogHelper.dart';
import '../../view/screens/editdetails/edit_details.dart';
import '../base_controller/baseController.dart';

class EditDetailsController extends BaseController {
  SingingCharacter? character = SingingCharacter.male;
  String groupValue = 'male';
  List<XFile>? imageFileList;
  XFile? image;
  List<String> getImages = [];
  GetEditDetailsModel? getEditDetailsModel;
  SingleUserModel? userModel;
  TextEditingController aboutMeController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  RxBool isEdit = false.obs;
  ResponseModel? responseModel;
  File? imageStore;
  final storage = GetStorage();
  RxString userId = ''.obs;

  void handleGenderChange(String? value) {
    groupValue = value!;
    update();
  }

  @override
  void onInit() {
    userId.value = storage.read('id') ?? "";
    // getUserUpdateData();
    super.onInit();
  }

  editToggle() {
    isEdit.toggle();
    update();
  }

  Future getUserUpdateData() async {

    DialogHelper.showLoading('Loading...');
    final response = await BaseClient()
        .get('/users/${storage.read("id")}', storage.read('token'))
        .catchError(handleError);
    if (response == null) return;

    DialogHelper.hideLoading();
    if (response != null) {
      print("save user Data $response");
      userModel = SingleUserModel.fromJson(response);
    }
    update();
  }

  Future saveUserDetails() async {
    final payload = {
      "shortDescription": aboutMeController.text,
      // "passion": userModel?.data.user?.passion
    };
    print("payload object is $payload ${storage.read("id")}");
    DialogHelper.showLoading('Loading...');
    final response = await BaseClient()
        .patch('/users/${storage.read("id")}', payload, storage.read('token'))
        .catchError(handleError);
    if (response == null) return;

    DialogHelper.hideLoading();
    if (response != null) {
      responseModel = ResponseModel.fromJson(response);
      editToggle();
      getUserUpdateData();
    }
    update();
  }
}
