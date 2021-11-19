import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../consts/image_constants.dart';
import '../../routes/app_routes.dart';
import '../../services/base_service/base_client.dart';
import '../../view/dialogs/dialogHelper.dart';
import '../base_controller/baseController.dart';

class ChooseGenderController extends GetxController {
  final storage = GetStorage();
  List<Map<String, dynamic>> genderData = [
    {'gender': 'Male', 'icon': ImageConstants.ic_male},
    {'gender': 'Female', 'icon': ImageConstants.ic_female},
  ];

  RxInt selectedIndex = 0.obs;

  updateGenderStatus() async {
    Map<String, dynamic> payload = {
      'gender': genderData[selectedIndex.value]['gender']
    };

    DialogHelper.showLoading('Loading...');
    final response = await BaseClient()
        .patch('/users/${storage.read('id')}', payload, storage.read('token'))
        .catchError(BaseController().handleError);
    print("response Otp $response");
    DialogHelper.hideLoading();
    if (response != null) {
      storage.write("page", "2");
      Get.offAndToNamed(AppRoutes.PASSION);
    }
  }
}
