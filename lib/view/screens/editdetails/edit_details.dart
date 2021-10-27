import 'package:daytte/view/screens/matchscreen/match_screen.dart';
import 'package:daytte/view/widgets/button_widget.dart';

import '../../../controllers/edit_details/edit_details_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../consts/image_constants.dart';

enum SingingCharacter { male, female }

class EditDetails extends StatelessWidget {
  final controller = Get.put(EditDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f8fa),
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
      body: ListView(
        children: [
          addPhotoHeadingWidget,
          Padding(
            padding: EdgeInsets.only(left: 24.0),
            child: Wrap(
              spacing: 10,
              children: [
                InkWell(
                    onTap: () {
                      //  getImageFromCamera();
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
                for (var item in controller.images) listOfImagesSelected(item),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          addMediaButtonWidget(),
          detailsWidget(),
          SizedBox(
            height: 10,
          ),
          ButtonWidget(
              buttonTitle: "Save Changes",
              action: () => Get.to(() => MatchScreen())),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Container detailsWidget() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffe5eced), width: 0.7),
          boxShadow: [
            BoxShadow(
                color: const Color(0xffd4dcdd),
                offset: Offset(3, 9),
                blurRadius: 4,
                spreadRadius: -9)
          ],
          color: const Color(0xffffffff)),
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
                      child: headingWithTextStyle(0.9, "About Me", 17.5),
                    ),
                    Image.asset(
                      "assets/icons/Edit.png",
                      color: Colors.black54,
                    )
                  ],
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: headingWithTextStyle(
                        0.2,
                        "AddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompanyAddCompany",
                        13.5)),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: headingWithTextStyle(0.9, "Passion", 17.5)),
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
                                borderRadius: BorderRadius.circular(10)),
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
                                borderRadius: BorderRadius.circular(10)),
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
                                borderRadius: BorderRadius.circular(10)),
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
                        child: headingWithTextStyle(0.9, "Company", 17.5)),
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
                        child: headingWithTextStyle(0.9, "School", 17.5)),
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
          ],
        ),
      ),
    );
  }

  Padding addMediaButtonWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ButtonWidget(
          buttonTitle: "Add Media", action: () => Get.to(() => MatchScreen())),
    );
  }

  Stack listOfImagesSelected(item) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 80,
          width: 80,
          child: Image.asset(ImageConstants.daytte_logo),
        ),
        Positioned(
          right: -7,
          top: -7,
          child: InkWell(
            onTap: () {
              controller.images.remove(item);
            },
            child: Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: Icon(Icons.clear),
            ),
          ),
        )
      ],
    );
  }

  Widget get addPhotoHeadingWidget {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text("Add Photo",
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: "SFPro",
                    fontStyle: FontStyle.normal,
                    fontSize: 22.0))),
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 25),
          child: Text(
            "Add at least 2 photos to continue",
            style: const TextStyle(
                color: const Color(0xffcacaca),
                fontWeight: FontWeight.w400,
                fontFamily: "SFProDisplay",
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
          ),
        ),
      ],
    );
  }

  Widget headingWithTextStyle(double opacity, String text, double size) {
    return Opacity(
      opacity: opacity,
      child: Text(text,
          style: TextStyle(
              color: const Color(0xff273d52),
              fontWeight: FontWeight.w500,
              fontFamily: "Avenir",
              fontStyle: FontStyle.normal,
              fontSize: size)),
    );
  }
}
