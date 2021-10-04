import 'package:daytte/routes/app_routes.dart';
import 'package:daytte/consts/constants.dart';
import 'package:daytte/themes/app_styles.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          linearGradientBackground(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 45),
                appBarLinearGradient(Constants.create_one),
                SizedBox(height: 30),
                mobileNumberWidget(),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.OTPVERIFICATION),
                  child: requestOtpButtonWidget(),
                ),
                SizedBox(height: 30),
                Text(Constants.signIn_tc,
                    style: AppStyles.title2.copyWith(
                        color: Colors.white.withOpacity(.8),
                        fontSize: 13,
                        fontFamily: 'SFPro',
                        fontWeight: FontWeight.w400)),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: Constants.already_member,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                            fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(
                              text: Constants.sign_in,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                              recognizer: TapGestureRecognizer()
                                ..onTap = ()=>Get.toNamed(AppRoutes.SIGNUPVIEW))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(Constants.social_connect,
                    style: AppStyles.title
                        .copyWith(color: Colors.white, fontFamily: 'Roboto')),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    socialIconButton(Color(0xFF3b5998), EvaIcons.facebook,
                        Constants.facebook),
                    SizedBox(
                      width: 5,
                    ),
                    socialIconButton(
                        Color(0xFFf14336), EvaIcons.google, Constants.google),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



  Widget socialIconButton(Color color, IconData icon, String text) {
    return Container(
      height: 50.0,
      width: 160.0,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              text,
              style:AppStyles.title.copyWith(color: color,fontFamily: 'Roboto',fontWeight: FontWeight.w700)
            ),
          ],
        ),
      ),
    );
  }

  Widget requestOtpButtonWidget() {
    return Container(
      height: 50,
      width: 400,
      decoration: BoxDecoration(
          color: Color(0xFFfc5185), borderRadius: BorderRadius.circular(24)),
      child: Center(
          child: Text(
        'Request OTP'.toUpperCase(),
        style: AppStyles.subHeading,
        textAlign: TextAlign.center,
      )),
    );
  }

  Widget mobileNumberWidget() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Mobile Number",
        hintStyle: TextStyle(color: Color(0x66ffffff)),
        fillColor: Color(0xFF433088),
       enabledBorder:OutlineInputBorder(
            borderSide:  BorderSide.none,
            borderRadius: BorderRadius.circular(8.0),
          ),
        errorBorder: InputBorder.none,
       
        focusedBorder: InputBorder.none,
        counterText: '',
        filled: true,
      ),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      maxLength: 10,
      style: TextStyle(color: Colors.white),
    );
  }
}
