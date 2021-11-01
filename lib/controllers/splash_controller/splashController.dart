
import 'package:daytte/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final storage = GetStorage();
  @override
  void onInit() {
    storage.writeIfNull("page", "0");
    
    print("storage access key ${storage.read('page')}");

    super.onInit();
  }

  void gotoPage() {
    final String pageNumber = storage.read('page');
    switch (pageNumber) {
      case '0':
        Get.offAndToNamed(AppRoutes.LOGINVIEW);
        break;
      case '1':
        Get.toNamed(AppRoutes.SIGNUPVIEW);
        break;
      case '2':
        Get.toNamed(AppRoutes.CHOOSEGENDER);
        break;
      case '3':
        Get.toNamed(AppRoutes.PASSION);
        break;
      case '4':
        Get.toNamed(AppRoutes.UNIVERSITY);
        break;
      case '5':
        Get.toNamed(AppRoutes.INTERESTED);
        break;
      case '6':
        Get.toNamed(AppRoutes.ABOUTVIEW);
        break;
      case '7':
        Get.toNamed(AppRoutes.EDITDETAILS);
        break;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
