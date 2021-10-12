import 'package:get/get.dart';

class InterestController extends GetxController {
  String groupValue = '';

  handleGenderChange(String? value) {
    groupValue = value!;
  }
}
