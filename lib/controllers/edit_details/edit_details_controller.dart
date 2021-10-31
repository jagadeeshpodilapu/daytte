import '../../view/screens/editdetails/edit_details.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../view/screens/editdetails/edit_details.dart';

class EditDetailsController extends GetxController {
  SingingCharacter? character = SingingCharacter.male;

  final ImagePicker _picker = ImagePicker();
  String groupValue = 'male';
  List<XFile>? imageFileList;

  void handleGenderChange(String? value) {
    groupValue = value!;
    update();
  }

  List<File> pickedImages = [];
  File? imageStore;
  final storage = GetStorage();

  @override
  void onInit() {
    storage.write("page", "7");
    super.onInit();
  }

//Pick an image
  openGallery() async {
    XFile? image = await _picker.pickImage(
        maxHeight: 100,
        maxWidth: 100,
        imageQuality: 100,
        source: ImageSource.gallery);
    if (image != null) {
      imageStore = File(image.path);
      pickedImages.add(imageStore!);
    }
    update();
  }

  // Capture a photo
  openCamera() async {
    XFile? image = await _picker.pickImage(
        maxHeight: 100,
        maxWidth: 100,
        imageQuality: 100,
        source: ImageSource.camera);
    if (image != null) {
      imageStore = File(image.path);
      pickedImages.add(imageStore!);
    }

    update();
  }

  removeImage(File item) {
    pickedImages.remove(item);
    update();
  }
}
