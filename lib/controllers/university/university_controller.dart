import 'package:daytte/model/response_model.dart';
import 'package:daytte/view/dialogs/dialogHelper.dart';
import 'package:daytte/view/screens/interested/interested.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../model/university_model.dart';
import '../../services/base_service/base_client.dart';
import '../base_controller/baseController.dart';

class UniversityController extends GetxController {
  UniversityListModel? universityListModel;
  ResponseModel? responseModel;
  int page = 0;
  int limit = 15;

  final storage = GetStorage();

  @override
  void onInit() {
    fetchUniversityList();

    super.onInit();
  }

  fetchUniversityList() async {
    final response = await BaseClient()
        .get('/institution?skip=$page&limit=$limit', storage.read('token'))
        .catchError(BaseController().handleError);

    if (response != null) {
      universityListModel = UniversityListModel.fromJson(response);
    }
    update();
  }

  Future postUniversityList(String university) async {
    Map<String, dynamic> payload = {"name": university};
    DialogHelper.showLoading('Loading...');
    final response = await BaseClient()
        .post('/institution', payload)
        .catchError(BaseController().handleError);
    print("university payload $response");
    DialogHelper.hideLoading();
    if (response != null) {
      responseModel = ResponseModel.fromJson(response);
      Get.to(() => InterestedScreen());
    }
    update();
  }
}