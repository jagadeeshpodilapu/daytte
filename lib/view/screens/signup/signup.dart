import '../../../consts/constants.dart';
import '../../../consts/image_constants.dart';
import '../../../controllers/signupcontroller/signup_controller.dart';
import '../../widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/checkbox/gf_checkbox.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';

class SignUp extends StatelessWidget {
  final controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(Constants.sign_up),
      body: SingleChildScrollView(
        child: Form(
            key: controller.key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  elevation: 4,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Image.asset(
                              ImageConstants.daytte_logo,
                              height: 120,
                              width: 120,
                            ),
                          ),
                          SizedBox(height: 30),
                          textFieldName("First Name"),
                          TextFormField(
                            controller: controller.firstName,
                            decoration: InputDecoration(
                                hintText: "XXXX", isDense: true),
                          ),
                          textFieldName("Last Name"),
                          TextFormField(
                            controller: controller.lastName,
                            decoration: InputDecoration(
                                hintText: "XXXX", isDense: true),
                          ),
                          SizedBox(height: 5),
                          /*  Row(
                            children: <Widget>[
                              Radio<String>(
                                value: "Male",
                                activeColor: Color(0xFF7f0ef4),
                                groupValue: _groupValue,
                                onChanged: _handleGenderChange,
                              ),
                              Text("Male"),
                              Radio<String>(
                                value: "Female",
                                activeColor: Color(0xFF7f0ef4),
                                groupValue: _groupValue,
                                onChanged: _handleGenderChange,
                              ),
                              Text("Female"),
                            ],
                          ), */
                          textFieldName("Date of Birth"),
                          GetBuilder<SignupController>(
                            builder: (controller) => TextFormField(
                              textAlignVertical: TextAlignVertical.center,
                              readOnly: true,
                              controller: controller.dob,
                              onTap: () => controller.selectDate(context),
                              decoration: InputDecoration(
                                hintText: "XXXX",
                                // isCollapsed: true,
                                prefixIcon: Icon(Icons.calendar_today_outlined),
                              ),
                            ),
                          ),
                          textFieldName("Email ID "),
                          TextFormField(
                            controller: controller.email,
                            decoration: InputDecoration(
                                hintText: "XXXX", isDense: true),
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Obx(()=>
                               Row(
                                children: [
                                  Text("Share My Location"),
                                  Spacer(),
                                  Switch(
                                    value: controller.shareLocation.value,
                                    activeTrackColor: Colors.green,
                                    onChanged: (value) =>
                                        controller.handleSharelocation(value),
                                    activeColor: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Obx(()=>
                                 GFCheckbox(
                                  size: 20,
                                  type: GFCheckboxType.custom,
                                  value: controller.check.value,
                                  onChanged: (value) =>
                                      controller.handlecheckbox(value),
                                  customBgColor: GFColors.INFO,
                                  activeIcon: Icon(
                                    Icons.crop_square,
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              /* Checkbox(
                                  value: check,
                                  onChanged: (value) => _handlecheckbox(value!)), */
                              Text("I have read the Terms & Condition")
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        if (controller.key.currentState!.validate()) {
                          if (controller.check.value) {
                            controller.postUserInfo();
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF9e49f6), fixedSize: Size(340, 40)),
                      child: Text(
                        Constants.sign_up.toUpperCase(),
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      
    );
  }

  Widget textFieldName(String name) {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(name, style: TextStyle(color: Color(0xFF8d9aaf))));
  }
}
