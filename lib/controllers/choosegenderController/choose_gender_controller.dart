import 'package:daytte/consts/image_constants.dart';
import 'package:get/get.dart';

class ChooseGenderController extends GetxController {
  List<Map<String, dynamic>> genderData = [
    {'gender': 'Male', 'icon': ImageConstants.ic_male},
    {'gender': 'Feale', 'icon': ImageConstants.ic_female},
  ];

  RxInt selectedIndex = 0.obs;
}
