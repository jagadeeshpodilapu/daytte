import 'package:daytte/view/screens/editdetails/edit_details.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditDetailsController extends GetxController {
  SingingCharacter? character = SingingCharacter.male;

  List<XFile> images = [];

  //final controller = Get.put(SelectImagesController());
  String groupValue = 'male';

  Future getImageFromCamera() async {
    var image = await getImageFromCamera();
    images.add(image);
  }

  void handleGenderChange(String? value) {
    groupValue = value!;
  }
}
