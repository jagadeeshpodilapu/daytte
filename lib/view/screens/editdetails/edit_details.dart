import 'package:daytte/consts/constants.dart';
import 'package:daytte/routes/app_routes.dart';
import 'package:daytte/view/widgets/button_widget.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:daytte/view/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../controllers/edit_details/edit_details_controller.dart';

enum SingingCharacter { male, female }

class EditDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f8fa),
      appBar: appBarWidget(Constants.editDetails, color: Color(0xffF7F8FA)),
      body: GetBuilder<EditDetailsController>(
        init: EditDetailsController(),
       didChangeDependencies: (state)=>state.controller?.getUserUpdateData(),
        builder: (controller) => ListView(
          children: [
            detailsWidget(controller),
            addVerticalSpace(10),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: RaisedGradientButton(
                  title: Constants.saveChanges,
                  onPressed: () async {
                    await controller.saveUserDetails();
                    if (controller.responseModel != null)
                      snackbarMessage(
                          controller.responseModel?.message ?? "", context);
                  }),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Container detailsWidget(EditDetailsController controller) {
    controller.aboutMeController.text =
        controller.userModel?.data.user?.shortDescription ?? "";

    controller.schoolController.text =
        controller.userModel?.data.user?.interestedIn ?? "";
    "";
    // print('userData passion ${controller.userModel?.data.user}');
    // controller.companyController.text =
    //     controller.userModel?.data.user?.interestedIn ?? "";
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 0.7),
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
                    GestureDetector(
                        onTap: () => controller.editToggle(),
                        child: Text("Edit"))
                  ],
                ),
                Obx(
                  () => TextFormField(
                    style: TextStyle(color: Colors.black),
                    maxLines: 2,
                    controller: controller.aboutMeController,
                    autofocus: controller.isEdit.value,
                    readOnly: !controller.isEdit.value,
                    decoration: _inputDecoration(),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: (){
                GetStorage().write("passion", "EditProfilePassion");
                Get.toNamed(AppRoutes.PASSION);
              },
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: headingWithTextStyle(0.9, Constants.passion, 17.5),
                  )),
            ),
           /* Wrap(
              spacing: 6,
              runSpacing: 6,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: List.generate(
                  controller.userModel?.data.user?.passion?.length ?? 0,
                  (index) {
                    // print("userDetails0 ${controller.userModel?.data.user?.passion}");
                    // print("userDetails1 ${controller.userModel?.data.user?.passion?.first.name}");
                    return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${controller.userModel?.data.user?.passion?[index].name}",
                          ),
                        ),
                      );
                  }),
            ),*/
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: headingWithTextStyle(0.9, Constants.school, 17.5),
                )),
             TextFieldWidget(
                label: '',
                hint: '',
                onTap: (){
                  GetStorage().write("university", "EditProfileUniversity");
                  Get.toNamed(AppRoutes.UNIVERSITY);
                },
                readOnly: true,
                controller: controller.schoolController,
            ),
            addVerticalSpace(10)
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      enabledBorder: _outlineBorder(Color(0xFF9A9A9A)),
      fillColor: Color(0xffE1E1E1).withOpacity(0.2),
      filled: true,
      focusedBorder: _outlineBorder(Color(0xFf7834F4)),
      errorBorder: _outlineBorder(Colors.red),
      focusedErrorBorder: _outlineBorder(Colors.red),
    );
  }

/*   Container detailsWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0),
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
                    editIconWidget(),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: headingWithTextStyle(
                        0.6,
                        "${controller.userController.findNearestModel?.data.users?.first.shortDescription}",
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
                        child:
                            headingWithTextStyle(0.9, Constants.passion, 17.5)),
                    editIconWidget(),
                  ],
                ),
                Wrap(
                  spacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    ...List.generate(
                        controller.userController.findNearestModel?.data.users
                                ?.first.passion?.length ??
                            0, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black54,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 6),
                            child: Text(
                                "${controller.userController.findNearestModel?.data.users?.first.passion?[index].name}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.black54)),
                          ),
                        ),
                      );
                    }),
                  ],
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
                        child:
                            headingWithTextStyle(0.9, Constants.company, 17.5)),
                    editIconWidget()
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
                        child:
                            headingWithTextStyle(0.9, Constants.school, 17.5)),
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
 */
  Widget headingWithTextStyle(double opacity, String text, double size) {
    return Opacity(
      opacity: opacity,
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: TextStyle(
            color: const Color(0xff273d52),
            fontWeight: FontWeight.w500,
            fontFamily: "Avenir",
            fontStyle: FontStyle.normal,
            fontSize: size),
      ),
    );
  }

  OutlineInputBorder _outlineBorder(Color color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color, width: 1.5));
  }
}
