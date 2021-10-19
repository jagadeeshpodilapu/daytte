import 'package:get/get.dart';

import 'discover_partner_controller.dart';

class DiscoverPartnerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DiscoverPartnerController());
  }
}
