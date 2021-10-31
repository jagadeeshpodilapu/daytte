import '../../../controllers/edit_details/edit_details_controller.dart';
import '../../../routes/app_routes.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../consts/image_constants.dart';

import '../../../controllers/edit_details/edit_details_controller.dart';
import '../../../routes/app_routes.dart';

enum SingingCharacter { male, female }

class EditDetails extends StatelessWidget {
  //final controller = Get.put(EditDetailsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditDetailsController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          elevation: 1,
          leading: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
          title: Text(
            "Edit Details",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Stack(children: [
          ListView(
            children: [
              Center(
                  child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text("Add Photo",
                          style: GoogleFonts.sourceSerifPro(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 24)))),
                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 25),
                    child: Text(
                      "Add at least 2 photos to continue",
                      style: GoogleFonts.sourceSerifPro(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.black26)),
                    ),
                  ),
                ],
              )),
              // controller.imageStore == null
              //     ?
              buildPaddingAdd(controller, context),
              //:SizedBox(),
              // controller.imageStore != null
              //     ?
              // Wrap(
              //         children: [
              //           buildPaddingAdd(controller, context),
              //           for (var index=0;index< controller.pickedImages.length;index++)
              //             Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Image.file(File(controller.pickedImages[index].path)))
              //         ],
              //       ): SizedBox(),

              // children: List.generate(controller.pickedImages.length, (index) {
              //   Asset asset = controller.pickedImages[index];
              //   return Container(
              //     height: 60,
              //     width: 40,
              //     child: AssetThumb(
              //       asset: asset,
              //       width: 60,
              //       height: 60,
              //       quality: 50,
              //     ),
              //   );
              // }),
              /*ListView.builder(
                      itemCount: controller.pickedImages.length,
                      itemBuilder: (context, index) => Image.asset(
                            "${controller.pickedImages[index]}",
                            height: 80,
                            width: 80,
                          ))*/
              GestureDetector(
                onTap: () {
                  if (controller.pickedImages.length >= 2) {}
                },
                child: Padding(
                  padding: EdgeInsets.all(22.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFfc5185),
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Center(
                        child: Text("Add Media",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.black26)]),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  "About Me",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                              Image.asset(
                                "assets/icons/Edit.png",
                                color: Colors.black54,
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              "AddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompany",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Colors.black26),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  "Passion",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                              Image.asset(
                                "assets/icons/Edit.png",
                                color: Colors.black54,
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Wrap(
                                  spacing: 10,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.black54,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 6),
                                        child: Text("Movies",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                color: Colors.black26)),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.black54,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 6),
                                        child: Text("Spots",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                color: Colors.black26)),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.black54,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 6),
                                        child: Text("Reading",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                color: Colors.black26)),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // child: Text("AddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompany",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color:Colors.black26 ),),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  "Company",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                              Image.asset(
                                "assets/icons/Edit.png",
                                color: Colors.black54,
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              "AddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompany",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Colors.black26),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  "School",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                              Image.asset(
                                "assets/icons/Edit.png",
                                color: Colors.black54,
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              "AddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompany",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Colors.black26),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio<String>(
                            value: "Male",
                            activeColor: Color(0xFF7f0ef4),
                            groupValue: controller.groupValue,
                            onChanged: controller.handleGenderChange,
                          ),
                          Text("Male"),
                          Radio<String>(
                            value: "Female",
                            activeColor: Color(0xFF7f0ef4),
                            groupValue: controller.groupValue,
                            onChanged: controller.handleGenderChange,
                          ),
                          Text("Female"),
                        ],
                      ),
                      SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              if (controller.pickedImages.length >= 2) {
                Get.toNamed(AppRoutes.HOMEVIEW);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFfc5185),
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Center(
                        child: Text("Save Changes",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Padding buildPaddingAdd(
      EditDetailsController controller, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.0),
      child: Wrap(
        spacing: 10,
        children: [
          InkWell(
              onTap: () {
                controller.openGallery();
              },
              child: DottedBorder(
                dashPattern: [5, 6],
                child: Container(
                  height: 80,
                  // width: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Image.asset('assets/icons/Photo.png',
                            width: 45, height: 30),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Add Photo",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.black54)),
                      ),
                    ],
                  ),
                ),
              )),
          for (var item in controller.pickedImages)
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                        height: 80,
                        width: 80,
                        child: Image.file(
                          File(item.path),
                          fit: BoxFit.cover,
                        )),
                    Positioned(
                      right: -7,
                      top: -7,
                      child: InkWell(
                        onTap: () {
                          controller.removeImage(item);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Icon(Icons.clear),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
