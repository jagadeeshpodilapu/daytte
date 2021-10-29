import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../view/screens/editdetails/edit_details.dart';

class EditDetailsController extends GetxController {
  SingingCharacter? character = SingingCharacter.male;

  final storage = GetStorage();

  List<XFile> images = [];

  //final controller = Get.put(SelectImagesController());
  String groupValue = 'male';

  @override
  void onInit() {
    storage.write("page", "7");
    super.onInit();
  }

  Future getImageFromCamera() async {
    var image = await getImageFromCamera();
    images.add(image);
  }

  void handleGenderChange(String? value) {
    groupValue = value!;
  }
}
