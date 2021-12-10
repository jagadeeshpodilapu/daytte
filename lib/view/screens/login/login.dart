import 'package:daytte/consts/image_constants.dart';
import 'package:daytte/themes/color_styles.dart';
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
      Constants.createAccount,
      style: AppStyles.heading3.copyWith(fontWeight: FontWeight.w500),
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
        style: AppStyles.title3.copyWith(fontWeight: FontWeight.w400));
  }

  Text _socialMediaText() {
    return Text(Constants.social_connect,
        style: AppStyles.title.copyWith(
          fontWeight: FontWeight.w400,
        ));
  }

  Container _signUpMethod() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Center(
        child: RichText(
          text: TextSpan(
            text: Constants.already_member,
            style: AppStyles.title.copyWith(fontWeight: FontWeight.w400),
            children: <TextSpan>[
              TextSpan(
                  text: Constants.sign_in,
                  style: AppStyles.title.copyWith(
                      color: primaryColor, fontWeight: FontWeight.w500),
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
        socialIcon(ImageConstants.ic_google),
        addHorizontalSpace(15),
        socialIcon(ImageConstants.ic_facebook),
        addHorizontalSpace(15),
        socialIcon(ImageConstants.ic_twitter),
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
      child: Image.asset(ImageConstants.create_account),
    );
  }

  _textfield() => TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return Constants.validateValidNumber;
          }
        },
        style: AppStyles.title.copyWith(
          fontWeight: FontWeight.w400,
        ),
        keyboardType: TextInputType.number,
        controller: controller.mobileController,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xFF7834F4)),
            ),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: textColor, width: 1)),
            isCollapsed: true,
            fillColor: whiteColor,
            contentPadding: new EdgeInsets.fromLTRB(2, 2, 2, 2),
            prefix: DropdownButtonHideUnderline(
              child: ButtonTheme(
                child: DropdownButton(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: textColor,
                  ),
                  value: '  +91',
                  items: ['  +91', '+23', '+1'].map((String value) {
                    return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: AppStyles.title.copyWith(color: textColor),
                        ));
                  }).toList(),
                  onChanged: (value) {},
                ),
              ),
            ),
            hintText: 'Mobile Number',
            hintStyle: TextStyle(color: textColor),
            labelText: 'Mobile Number',
            labelStyle: TextStyle(color: Color(0xff9A9A9A))),
      );
}
