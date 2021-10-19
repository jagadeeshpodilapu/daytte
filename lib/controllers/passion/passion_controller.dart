import 'package:get/get.dart';

class PassionController extends GetxController {
  List? companies;
  List<String>? _filters;
  bool changeColor = false;
  int? intVar;

  List<String> get passionList {
    return [
      'Working out',
      'Vegetarian',
      'Musician',
      'Cricket1',
      'Language Exchange1',
      'Netflix1',
      'Working out1',
      'Vegetarian1',
      'Musician1',
      'Cricket2',
      'Language Exchange2',
      'Netflix2',
      'Working out2',
      'Vegetarian2',
      'Musician2',
      'Cricket3',
      'Language Exchange3',
      'Netflix3',
      'Working out3',
      'Vegetarian3',
    ];
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _filters = <String>[];
    List<String> companies = <String>[
      'Working out',
      'Vegetarian',
      'Musician',
      'Cricket1',
      'Language Exchange1',
      'Netflix1',
      'Working out1',
      'Vegetarian1',
      'Musician1',
      'Cricket2',
      'Language Exchange2',
      'Netflix2',
      'Working out2',
      'Vegetarian2',
      'Musician2',
      'Cricket3',
      'Language Exchange3',
      'Netflix3',
      'Working out3',
      'Vegetarian3',
    ];
  }
}
