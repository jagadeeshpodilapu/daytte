import '../../../controllers/passion/passion_controller.dart';
import '../../../routes/app_routes.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';

class PassionSCreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Passion"),
      body: GetBuilder<PassionController>(
        init: PassionController(),
        builder: (controller) => SingleChildScrollView(
          child: Card(
            color: Colors.grey[200],
            elevation: 1,
            child: Column(
              children: [
                SizedBox(height: 20),
                ...List.generate(1, (index) {
                  return Theme(
                    data: ThemeData(
                      primarySwatch: Colors.pink,
                      backgroundColor: Colors.grey,
                    ),
                    child: GroupButton(
                      spacing: 5,
                      isRadio: false,
                      selectedShadow: const [],
                      unselectedShadow: const [],
                      selectedBorderColor: Colors.pink,
                      unselectedBorderColor: Colors.grey,
                      unselectedTextStyle: const TextStyle(color: Colors.grey),
                      borderRadius: BorderRadius.circular(30),
                      onSelected: (index, isSelected) =>
                          controller.selected.add(controller.listId[index]),
                      buttons: controller.listName,
                      selectedButtons: [],
                    ),
                  );
                }),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  child: ButtonWidget(
                    buttonTitle: "Continue",
                    action: () async {
                      await controller.postPassition();
                      if (controller.responseModel != null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text("${controller.responseModel?.message}")));
                      }
                    },
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
