import 'package:get/get.dart';

class InterestController extends GetxController {
  String groupValue = '';

  handleGenderChange(value) {
    groupValue = value;
    update();
  }
}
