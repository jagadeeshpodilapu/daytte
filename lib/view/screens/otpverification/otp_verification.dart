import 'dart:async';
import '../../../controllers/otpController/otp_controller.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerification extends StatefulWidget {
  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  Timer? _timer;

  TextEditingController otpInput = TextEditingController();
  final otpController = Get.find<OtpController>();
  int _start = 30;
  late String mobileNumber;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  bool isChange = false;

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    mobileNumber = Get.arguments;
    print("Mobile Number $mobileNumber");
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            linearGradientBackground(),
            Positioned(
                top: 40,
                right: 10,
                left: 10,
                child: appBarLinearGradient('OTP Verification Code')),
            Positioned(
              top: 90,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                          child: Text(
                              "we have sent you an SMS with a code to the number",
                              textAlign: TextAlign.center,
                              style: buildTextStyle(Colors.white, 16))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("+91$mobileNumber",
                          style: buildTextStyle(Colors.white, 24)),
                    ),
                    Center(
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        width: MediaQuery.of(context).size.width,
                        child: PinCodeTextField(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          length: 4,
                          controller: otpInput,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          boxShadows: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              color: Color(0xFF433088),
                            )
                          ],
                          obscureText: false,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.circle,
                            errorBorderColor: Colors.transparent,
                            fieldHeight: 60,
                            fieldWidth: 60,
                            activeColor: Color(0xFF433088),
                            activeFillColor: Color(0xFF433088),
                          ),
                          animationDuration: Duration(milliseconds: 300),
                          // errorAnimationController: errorController,
                          // Pass it here
                          onChanged: (value) {
                            setState(() {
                              isChange = true;
                            });
                          },

                          textStyle: TextStyle(color: Colors.white),
                          appContext: context,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      child: ButtonWidget(
                        buttonTitle: "GET OTP",
                        action: () {
                          otpController.verifyOtp(otpInput.text, mobileNumber);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("if you didn't receivea code !  ",
                            style: buildTextStyle(Colors.white54, 16)),
                        GestureDetector(
                          onTap: () {
                            otpController.reSendOtp("+91$mobileNumber");
                          },
                          child: Text(
                            "Resend OTP",
                            style: buildTextStyle(Colors.white, 18),
                          ),
                        )
                      ],
                    ),
                    Text("Available in $_start seconds",
                        style: buildTextStyle(Colors.white54, 16)),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  TextStyle buildTextStyle(Color color, double fontSize) {
    return TextStyle(color: color, fontSize: fontSize);
  }
}
