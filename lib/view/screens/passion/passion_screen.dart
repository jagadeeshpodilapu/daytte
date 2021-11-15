import 'package:daytte/consts/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';

import '../../../controllers/passion/passion_controller.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/common_widgets.dart';

class PassionSCreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PassionController>(
        init: PassionController(),
        builder: (controller) => Scaffold(
              appBar: appBarWidget(Constants.passion),
              backgroundColor: Colors.grey[200],
              body: ListView(
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
                        unselectedTextStyle:
                            const TextStyle(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30),
                        onSelected: (index, isSelected) =>
                            controller.selected.add(controller.listId[index]),
                        buttons: controller.listName,
                        selectedButtons: [],
                      ),
                    );
                  }),
                  SizedBox(height: 40),
                ],
              ),
              floatingActionButton: ButtonWidget(
                buttonTitle: "Continue",
                action: () async {
                  if (controller.selected.isNotEmpty) {
                    await controller.postPassition();
                    if (controller.responseModel != null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("${controller.responseModel?.message}")));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(Constants.select2Pics),
                    ));
                  }
                },
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            ));
  }
}
