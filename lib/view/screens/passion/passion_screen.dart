import 'package:daytte/routes/app_routes.dart';
import 'package:daytte/view/widgets/button_widget.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';

class PassionSCreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PassionSCreenState();
}

class _PassionSCreenState extends State<PassionSCreen> {
  List? _companies;
  List<String>? _filters;
  bool changeColor = false;
  int? intVar;
  @override
  void initState() {
    super.initState();
    _filters = <String>[];
    List<String> _companies = <String>[
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Passion"),
      body: SingleChildScrollView(
        child: Card(
          color: Colors.grey[200],
          elevation: 1,
          child: Column(
            children: [
              SizedBox(height: 20),
              Theme(
                data: ThemeData(
                  primarySwatch: Colors.pink,
                  backgroundColor: Colors.grey,
                ),
                child: GroupButton(
                  spacing: 10,
                  isRadio: false,
                  selectedShadow: const [],
                  unselectedShadow: const [],
                  selectedBorderColor: Colors.pink,
                  unselectedBorderColor: Colors.grey,
                  unselectedTextStyle: const TextStyle(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30),
                  onSelected: (index, isSelected) {},
                  buttons: passionList,
                  selectedButtons: const [2, 3, 6, 5],
                ),
              ),

              /* FilterChip(
                            backgroundColor: Colors.grey[400],
                            showCheckmark: false,
                            labelStyle: TextStyle(color: Colors.white),
                            label: Text(
                              _companies![index],
                            ),
                            selected: _filters!.contains(_companies![index]),
                            selectedColor: Colors.pinkAccent,
                            onSelected: (bool selected) {
                              setState(() {
                                if (selected) {
                                  _filters!.add(_companies![index]);
                                } else {
                                  _filters!.removeWhere((String name) {
                                    return name == _companies![index];
                                  });
                                }
                              });
                            },
                          ), */

              SizedBox(height: 20),
              Container(
                height: 50,
                child: ButtonWidget(
                  buttonTitle: "Continue",
                  action: () {
                    Get.toNamed(AppRoutes.CHOOSEGENDER);
                  },
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

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
}
