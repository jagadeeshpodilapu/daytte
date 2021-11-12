import 'package:daytte/controllers/discover_partner/discover_partner_controller.dart';
import 'package:get/get.dart';

class DiscoverPartnerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DiscoverPartnerController());
  }
}
