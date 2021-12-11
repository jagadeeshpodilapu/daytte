import 'dart:math' as math;

import 'package:daytte/themes/color_styles.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonTitle;
  void Function() action;

  ButtonWidget({required this.buttonTitle, required this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 5),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(20.0),
        ),
        child: ElevatedButton(
          child: Text(
            buttonTitle,
            style: const TextStyle(
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w600,
                fontFamily: "Avenir",
                fontStyle: FontStyle.normal,
                fontSize: 20.0),
          ),
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Color(0xFFfc5185),
            shape: StadiumBorder(),
            elevation: 5,
          ),
          onPressed: action,
        ),
      ),
    );
  }
}

class RaisedGradientButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final double? borderRadius;
  final double? width;

  const RaisedGradientButton(
      {required this.title,
      required this.onPressed,
      this.borderRadius,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 14.0),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF9222EC),
              offset: Offset(0, 5),
              blurRadius: 2,
            ),
          ],
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF7004E3),
           //   Color(0xFF7004E3),
              Color(0xFF8511E6),
            ],
            transform: GradientRotation(math.pi / 20),
          )),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                  color: whiteColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }
}
