import 'package:daytte/controllers/permissionController/permission_controller.dart';
import 'package:get/get.dart';

class PermissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PermissionController>(() => PermissionController());
  }
}
