import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:daytte/model/find_nearest_model.dart';
import 'package:daytte/services/base_service/base_client.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FindNearestController extends BaseController {

  int page = 0, limit = 10;
  final storage = GetStorage();
  RxInt users = 0.obs;
  FindNearestModel? findNearestModel;
  List<User> userIds=[];

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
      findNearestModel = FindNearestModel.fromJson(response);
      users.value = findNearestModel?.data.users?.length ?? 0;
      userIds= findNearestModel?.data.users??[];
    }
    update();
  }
}
