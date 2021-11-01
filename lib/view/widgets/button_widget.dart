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
