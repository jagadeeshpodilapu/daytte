import 'package:daytte/controllers/otpController/otp_controller.dart';
import 'package:daytte/themes/app_styles.dart';
import 'package:daytte/view/widgets/button_widget.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<OtpController>(
        init: OtpController(),
        builder: (controller) => Column(
          children: [
            appBarWidget(context),
            _otpImageWidget,
            _sentOtpMobileNumberWidget(controller),
            _otpTextFieldsWidget(context, controller),
            _reSendOtpWidget(controller),
            addVerticalSpace(30),
            _verifyOtpButtonWidget(controller, context),
          ],
        ),
      ),
    );
  }

  Widget _verifyOtpButtonWidget(
      OtpController controller, BuildContext context) {
    return SizedBox(
      width: Get.width * 0.9,
      child: RaisedGradientButton(
          title: 'Verify and Create Account',
          onPressed: () async {
            await controller.verifyOtp(
                controller.otpInput.text, controller.mobileNumber);
            if (controller.userInfoModel != null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("${controller.userInfoModel?.message}")));
            }
          }),
    );
  }

  AppBar appBarWidget(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: Icon(
        Icons.arrow_back_ios,
        color: Color(0xff363636),
      ),
      title: Text(
        "OTP Verification",
        style: Theme.of(context).textTheme.headline6,
      ),
      centerTitle: true,
    );
  }

  Widget get _otpImageWidget {
    return Container(
      width: Get.width,
      height: Get.height * 0.3,
      child: SvgPicture.asset("assets/icon/verify_otp.svg"),
    );
  }

  Widget _sentOtpMobileNumberWidget(OtpController controller) => Text.rich(
        TextSpan(
          children: [
            TextSpan(
                text: 'Enter the OTP sent to  ',
                style: Theme.of(Get.context!)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w400)),
            TextSpan(
                text: '+91${controller.mobileNumber}',
                style: Theme.of(Get.context!)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
      );

  Widget _otpTextFieldsWidget(BuildContext context, OtpController controller) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        width: MediaQuery.of(context).size.width,
        child: PinCodeTextField(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          length: 4,
          controller: controller.otpInput,
          enablePinAutofill: true,
          enableActiveFill: true,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          boxShadows: [
            BoxShadow(offset: Offset(0, 1), color: Color(0xffE1E1E1))
          ],
          autovalidateMode: AutovalidateMode.disabled,
          obscureText: false,
          animationType: AnimationType.fade,
          pinTheme: pinThemeTextFields(),
          animationDuration: Duration(milliseconds: 300),
          // Pass it here
          onChanged: (value) {
            controller.funcIsChange(true);
          },

          textStyle: TextStyle(color: Colors.white),
          appContext: context,
        ),
      ),
    );
  }

  PinTheme pinThemeTextFields() {
    return PinTheme(
      shape: PinCodeFieldShape.circle,
      errorBorderColor: Colors.white,
      fieldHeight: 60,
      fieldWidth: 60,
      activeColor: const Color(0xff7004E3),
      activeFillColor: const Color(0xff7004E3),
      inactiveColor: const Color(0xFFE1E1E1),
      inactiveFillColor: const Color(0xFFE1E1E1),
      selectedColor: const Color(0xFFE1E1E1),
      selectedFillColor: const Color(0xFFE1E1E1),
    );
  }

  Widget _reSendOtpWidget(OtpController controller) => Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: RichText(
            text: TextSpan(
              text: "Didn’t receive code? ",
              style: TextStyle(
                  color: Color(0xFF363636),
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
              children: <TextSpan>[
                TextSpan(
                    text: 'Resend',
                    style: AppStyles.title.copyWith(
                        color: Color(0xFF7004E3), fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () =>
                          controller.reSendOtp('+91${controller.mobileNumber}'))
              ],
            ),
          ),
        ),
      );
}
