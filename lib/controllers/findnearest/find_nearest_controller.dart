import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:daytte/services/base_service/base_client.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FindNearestController extends GetxController {
  int page = 0, limit = 10;
  final storage = GetStorage();
  @override
  void onInit() {
    fetchNearestPeople();
    super.onInit();
  }

  Future fetchNearestPeople() async {
    final response = await BaseClient()
        .get('/users?skip=$page&limit=$limit', storage.read('token'))
        .catchError(BaseController().handleError);

    if (response != null) {
      print("find nearest response $response");
    }
    update();
  }
}
