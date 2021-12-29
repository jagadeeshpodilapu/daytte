import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:daytte/model/find_nearest_model.dart';
import 'package:daytte/services/base_service/base_client.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FindNearestController extends BaseController {
  int page = 0, limit = 20;
  final storage = GetStorage();
  RxInt users = 0.obs;
  FindNearestModel? findNearestModel;

  @override
  void onInit() {
    fetchNearestPeople();
    super.onInit();
  }

  Future fetchNearestPeople() async {
    final response = await BaseClient()
        .get('/users?skip=$page&limit=$limit', storage.read('token'))
        .catchError(BaseController().handleError);

    print("storage value ${storage.read("id")} ${storage.read("token")}");

    if (response != null) {
      print("find nearest response $response");
      findNearestModel = FindNearestModel.fromJson(response);
      findNearestModel?.data.users!
          .removeWhere((element) => element.id == storage.read('id'));
      users.value = findNearestModel?.data.users?.length ?? 0;
      update();
    }
  }
}
