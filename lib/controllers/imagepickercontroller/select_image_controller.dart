

import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class SelectImagesController extends BaseController {
  late XFile? imageURI;

  final ImagePicker _picker = ImagePicker();
    // Pick an image
   
    // Capture a photo
  

  Future getImageFromCamera() async {
     final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    imageURI = photo;
  }

  Future pickImage(ImageSource source) async {
    try {
       final XFile? pic = await _picker.pickImage(source: ImageSource.gallery);

      if (pic == null) return;
     
      this.imageURI = pic;
    } on PlatformException catch (e) {
      print("failed to pic image: $e");
    }
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    imageURI = image ;
  }
}
