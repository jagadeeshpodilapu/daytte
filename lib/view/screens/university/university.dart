import 'package:daytte/consts/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/university/university_controller.dart';
import '../../widgets/common_widgets.dart';

class UniversityView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(Constants.university),
      body: GetBuilder<UniversityController>(
        init: UniversityController(),
        builder: (controller) => Container(
          // margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(8),
          height: Get.height * 0.9,
          child: Card(
            elevation: 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: Constants.searchUniversity,
                      prefixIcon: Icon(Icons.search),
                    ),
                        textAlignVertical: TextAlignVertical.center,
                      ),
                    ),
                    controller.universityListModel?.universityList.passion.length !=
                        0
                        ? Expanded(
                      child: ListView.builder(
                          itemCount: controller.universityListModel
                                  ?.universityList.passion.length ??
                              0,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () async {
                              await controller.postUniversityList(
                                  "${controller.universityListModel!.universityList.passion[index].name}");
                              if (controller.responseModel != null) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                              "${controller.responseModel?.message}")));
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8),
                                child: Text(
                                  "${controller.universityListModel!.universityList.passion[index].name}",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                      ),
                    )
                    : Center(child: CircularProgressIndicator.adaptive())
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
