import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../consts/image_constants.dart';
import '../../routes/app_routes.dart';
import '../../services/base_service/base_client.dart';
import '../../view/dialogs/dialogHelper.dart';
import '../base_controller/baseController.dart';
import '../otpController/otp_controller.dart';

class ChooseGenderController extends GetxController {
  final controller = Get.find<OtpController>();

  final storage = GetStorage();
  List<Map<String, dynamic>> genderData = [
    {'gender': 'Male', 'icon': ImageConstants.ic_male},
    {'gender': 'Feale', 'icon': ImageConstants.ic_female},
  ];

  RxInt selectedIndex = 0.obs;

  updateGenderStatus() async {
    Map<String, dynamic> payload = {
      'gender': genderData[selectedIndex.value]['gender']
    };

    DialogHelper.showLoading('Loading...');
    final response = await BaseClient()
        .patch('/users/${controller.userInfoModel!.userProperties.user!.id}',
        payload, storage.read('token'))
        .catchError(BaseController().handleError);
    print("response Otp $response");
    DialogHelper.hideLoading();
    if (response != null) {
      Get.toNamed(AppRoutes.PASSION);
    }
  }
}
