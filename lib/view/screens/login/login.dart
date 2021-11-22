import 'package:daytte/view/widgets/button_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../consts/constants.dart';
import '../../../controllers/loginController/login_controller.dart';
import '../../../routes/app_routes.dart';
import '../../../themes/app_styles.dart';
import '../../widgets/common_widgets.dart';

class Login extends StatelessWidget {
  final controller = LoginController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                addVerticalSpace(40),
                _createAccountImageWidget(),
                addVerticalSpace(30),
                _createAccountTextWidget(),
                addVerticalSpace(20),
                _textfield(),
                addVerticalSpace(20),
                _requestOtpWidget(),
                addVerticalSpace(20),
                _termsAndConditionsWidget(),
                addVerticalSpace(15),
                _signUpMethod(),
                addVerticalSpace(30),
                _socialMediaText(),
                addVerticalSpace(30),
                _socialButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _createAccountTextWidget() {
    return Text(
      "Create Account",
      style: TextStyle(
          fontSize: 22,
          color: Color(0xFF363636),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold),
    );
  }

  RaisedGradientButton _requestOtpWidget() {
    return RaisedGradientButton(
        title: Constants.request_otp,
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            var payload = {
              "mobile_number": "+91${controller.mobileController.text}"
            };
            controller.sendOtp(payload);
          }
        });
  }

  Text _termsAndConditionsWidget() {
    return Text(Constants.signIn_tc,
        style: AppStyles.title2.copyWith(
            color: Color(0xFF363636),
            fontSize: 13,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto'));
  }

  Text _socialMediaText() {
    return Text(Constants.social_connect,
        style: AppStyles.title.copyWith(
            color: Color(0xFF363636),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontSize: 18));
  }

  Container _signUpMethod() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Center(
        child: RichText(
          text: TextSpan(
            text: Constants.already_member,
            style: TextStyle(
                color: Color(0xFF363636),
                fontSize: 20,
                fontWeight: FontWeight.w400),
            children: <TextSpan>[
              TextSpan(
                  text: Constants.sign_in,
                  style: AppStyles.subHeading.copyWith(
                      color: Color(0xFF7004E3), fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.toNamed(AppRoutes.SIGNUPVIEW))
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialButtons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        socialIcon('assets/icon/google.svg'),
        addHorizontalSpace(15),
        socialIcon('assets/icon/facebook.svg'),
        addHorizontalSpace(15),
        socialIcon('assets/icon/twitter.svg'),
      ],
    );
  }

  Widget socialIcon(String src) {
    return SvgPicture.asset(src, width: 50, height: 50);
  }

  Widget _createAccountImageWidget() {
    return Container(
      width: Get.width,
      height: Get.height * 0.3,
      child: Image.asset("assets/icon/create_account.png"),
    );
  }

  _textfield() => TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter Valid Number';
          }
        },
        keyboardType: TextInputType.number,
        controller: controller.mobileController,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8.0),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE0E0E0), width: 0.1)),
            fillColor: Colors.white,
            prefix: DropdownButtonHideUnderline(
              child: ButtonTheme(
                child: DropdownButton(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  value: '+91',
                  items: ['+91', '+23', '+1'].map((String value) {
                    return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 16.0, color: Colors.black),
                        ));
                  }).toList(),
                  onChanged: (value) {},
                ),
              ),
            ),
            hintText: 'Mobile Number',
            hintStyle: TextStyle(color: Colors.black),
            labelText: 'Mobile Number',
            labelStyle: TextStyle(color: Colors.black)),
      );
}
