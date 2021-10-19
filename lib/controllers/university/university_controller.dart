import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../model/university_model.dart';
import '../../services/base_service/base_client.dart';
import '../base_controller/baseController.dart';

class UniversityController extends GetxController {
  UniversityListModel? universityListModel;
  int page = 0;
  int limit = 10;


  final storage = GetStorage();

  @override
  void onInit() {
    fetchUniversityList();

    super.onInit();
  }

  fetchUniversityList() async {
    // DialogHelper.showLoading('Loading...');
    final response = await BaseClient()
        .get('/institution?skip=$page&limit=$limit', storage.read('token'))
        .catchError(BaseController().handleError);

    // DialogHelper.hideLoading();
    if (response != null) {
      universityListModel = UniversityListModel.fromJson(response);
    }
    update();
  }
}
