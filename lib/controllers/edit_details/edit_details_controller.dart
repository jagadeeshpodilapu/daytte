import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';

import '../../view/screens/editdetails/edit_details.dart';

class EditDetailsController extends GetxController {
  SingingCharacter? character = SingingCharacter.male;
  List<Asset> image = <Asset>[];
  String _error = 'No Error Dectected';
  List<XFile> images = [];
  String groupValue = 'male';

  Future getImageFromCamera() async {
    var image = await getImageFromCamera();
    images.add(image);
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: image,
        cupertinoOptions: CupertinoOptions(
          takePhotoIcon: "chat",
          doneButtonTitle: "Fatto",
        ),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }
    image = resultList;
    _error = error;
  }

  void handleGenderChange(String? value) {
    groupValue = value!;
  }
}
