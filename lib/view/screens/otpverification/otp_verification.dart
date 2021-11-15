import 'package:daytte/consts/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../controllers/otpController/otp_controller.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/common_widgets.dart';

class OtpVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: GetBuilder<OtpController>(
          init: OtpController(),
          builder: (controller) => Stack(
            children: [
              linearGradientBackground(),
              optTextWidget(),
              Positioned(
                top: 90,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      sentOtpText(),
                      mobileNumberWidget(controller),
                      otpTextFieldsWidget(context, controller),
                      getOtpButton(controller, context),
                      SizedBox(height: 30),
                      resendAndRelaventTextWidget(controller),
                      otpTimerWidget(controller),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget otpTimerWidget(OtpController controller) {
    return Text("Available in ${controller.start} seconds",
        style: buildTextStyle(Colors.white54, 16));
  }

  Widget resendAndRelaventTextWidget(OtpController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("if you didn't receivea code !  ",
            style: buildTextStyle(Colors.white54, 16)),
        GestureDetector(
          onTap: () {
            controller.reSendOtp("+91${controller.mobileNumber}");
          },
          child: Text(
            Constants.resendOtp,
            style: buildTextStyle(Colors.white, 18),
          ),
        )
      ],
    );
  }

  ButtonWidget getOtpButton(OtpController controller, BuildContext context) {
    return ButtonWidget(
      buttonTitle: Constants.getOtp,
      action: () async {
        await controller.verifyOtp(
            controller.otpInput.text, controller.mobileNumber);
        if (controller.userInfoModel != null) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("${controller.userInfoModel?.message}")));
        }
      },
    );
  }

  Widget otpTextFieldsWidget(BuildContext context, OtpController controller) {
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
            BoxShadow(
              offset: Offset(0, 1),
              color: Color(0xFF433088),
            )
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

          textStyle: TextStyle(color: Colors.black),
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
      activeColor: Colors.white,
      activeFillColor: Colors.white,
      inactiveColor: Color(0xFF433088),
      inactiveFillColor: Color(0xFF433088),
      selectedColor: Color(0xFF433088),
      selectedFillColor: Color(0xFF433088),
    );
  }

  Widget mobileNumberWidget(OtpController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("+91${controller.mobileNumber}",
          style: buildTextStyle(Colors.white, 24)),
    );
  }

  Widget sentOtpText() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Center(
          child: Text(Constants.smsHint,
              textAlign: TextAlign.center,
              style: buildTextStyle(Colors.white, 16))),
    );
  }

  Widget optTextWidget() {
    return Positioned(
        top: 40,
        right: 10,
        left: 10,
        child: appBarLinearGradient(Constants.verifiedOtp));
  }

  TextStyle buildTextStyle(Color color, double fontSize) {
    return TextStyle(color: color, fontSize: fontSize);
  }
}
