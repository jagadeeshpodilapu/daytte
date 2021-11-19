import 'package:daytte/view/widgets/button_widget.dart';
import 'package:daytte/view/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/checkbox/gf_checkbox.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';

import '../../../consts/constants.dart';
import '../../../consts/image_constants.dart';
import '../../../controllers/signupcontroller/signup_controller.dart';
import '../../widgets/common_widgets.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(Constants.sign_up, color: Color(0xffF7F8FA)),
      backgroundColor: Color(0xffF7F8FA),
      body: GetBuilder<SignupController>(
        init: SignupController(),
        builder: (controller) => SingleChildScrollView(
          child: Form(
            key: controller.key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                addVerticalSpace(20),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    elevation: 4,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          addVerticalSpace(10),
                          logoWidget(),
                          addVerticalSpace(30),
                          _firstName(controller),
                          addVerticalSpace(10),
                          _lastName(controller),
                          addVerticalSpace(10),
                          _dobWidget(context),
                          addVerticalSpace(10),
                          _email(controller),
                          addVerticalSpace(10),
                          _shareLocation(controller),
                          addVerticalSpace(10),
                          checkBoxWidget(controller),
                          addVerticalSpace(15),
                        ],
                      ),
                    ),
                  ),
                ),
                addVerticalSpace(15),
                _signupButton(controller, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row checkBoxWidget(SignupController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        addHorizontalSpace(8),
        Obx(
          () => GFCheckbox(
            size: 20,
            type: GFCheckboxType.custom,
            value: controller.check.value,
            onChanged: (value) => controller.handlecheckbox(value),
            customBgColor: GFColors.INFO,
            activeIcon: Icon(
              Icons.crop_square,
              size: 20,
            ),
          ),
        ),
        SizedBox(width: 10),
        /* Checkbox(
                                    value: check,
                                    onChanged: (value) => _handlecheckbox(value!)), */
        Text(Constants.tcApply),
      ],
    );
  }

  Align _shareLocation(SignupController controller) {
    return Align(
      alignment: Alignment.topLeft,
      child: Obx(
        () => Row(
          children: [
            addHorizontalSpace(5),
            Text(Constants.shareLocation),
            Spacer(),
            Switch(
              value: controller.shareLocation.value,
              activeTrackColor: Colors.green,
              onChanged: (value) => controller.handleSharelocation(value),
              activeColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  TextFieldWidget _email(SignupController controller) {
    return TextFieldWidget(
      label: Constants.emailId,
      hint: '',
      controller: controller.email,
      validator: (value) {
        if (value.isEmail) {
          return null;
        } else {
          return 'enter valid email';
        }
      },
    );
  }

  GetBuilder<SignupController> _dobWidget(BuildContext context) {
    return GetBuilder<SignupController>(
      builder: (controller) => TextFormField(
        textAlignVertical: TextAlignVertical.center,
        readOnly: true,
        controller: controller.dob,
        validator: (value) => validateText(value!, 'date of birth'),
        onTap: () => controller.selectDate(context),
        decoration: InputDecoration(
          label: Text("Date of Birth"),
          hintText: "XXXX",
          // isCollapsed: true,
          // isDense: true,
          contentPadding: EdgeInsets.all(16),
          prefix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
            child: Icon(
              Icons.calendar_today_outlined,
              size: 16,
            ),
          ),
          enabledBorder: _outlineBorder(Color(0xFF9A9A9A)),
          focusedBorder: _outlineBorder(Color(0xFf7834F4)),
          errorBorder: _outlineBorder(Colors.red),
          focusedErrorBorder: _outlineBorder(Colors.red),
        ),
      ),
    );
  }

  TextFieldWidget _lastName(SignupController controller) {
    return TextFieldWidget(
      label: Constants.lastName,
      hint: '',
      controller: controller.lastName,
      validator: (value) => validateText(value, 'last Name'),
    );
  }

  TextFieldWidget _firstName(SignupController controller) {
    return TextFieldWidget(
      label: Constants.firstName,
      hint: '',
      controller: controller.firstName,
      validator: (value) => validateText(value, 'first Name'),
    );
  }

  Center logoWidget() {
    return Center(
      child: SvgPicture.asset(
        ImageConstants.daytte_logo,
        height: 120,
        width: 120,
      ),
    );
  }

  Center _signupButton(SignupController controller, BuildContext context) {
    return Center(
      child: SizedBox(
        width: Get.width * 0.85,
        child: RaisedGradientButton(
            title: 'Sign Up',
            onPressed: () {
              if (controller.key.currentState!.validate()) {
                if (controller.check.value) {
                  controller.postUserInfo();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(Constants.acceptTc)));
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("All Fields Required")));
              }
            }),
      ),
    );
  }

  EdgeInsets get paddingWidget =>
      EdgeInsets.symmetric(horizontal: 2, vertical: 5);

  Widget textFieldName(String name) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        name,
        style: TextStyle(
          color: Color(0xFF8d9aaf),
        ),
      ),
    );
  }

  validateText(String input, String hint) {
    if (input.isEmpty) {
      return "$hint is Required";
    }
    return null;
  }

  OutlineInputBorder _outlineBorder(Color color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color, width: 1.5));
  }
}
