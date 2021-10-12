import 'package:daytte/controllers/passion/passion_controller.dart';
import 'package:daytte/routes/app_routes.dart';
import 'package:daytte/view/widgets/button_widget.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';

class PassionSCreen extends StatelessWidget {
  final controller = Get.put(PassionController());

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
                    buttons: controller.passionList,
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
                      Get.toNamed(AppRoutes.UNIVERSITY);
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
}
