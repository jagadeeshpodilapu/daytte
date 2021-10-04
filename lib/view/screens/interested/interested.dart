import 'package:daytte/view/widgets/button_widget.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterestedScreen extends StatefulWidget {
  @override
  State<InterestedScreen> createState() => _InterestedScreenState();
}

class _InterestedScreenState extends State<InterestedScreen> {
  String _groupValue = '';

  void _handleGenderChange(String? value) {
    setState(() {
      _groupValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Intrested"),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            height: Get.height * 0.7,
            child: Card(
              elevation: 4,
              child: Column(
                children: [
                  ListTile(
                    leading: buildText('Im Interested in Men'),
                    trailing: Radio(
                        activeColor: Color(0xFFfc5185),
                        value: 'men',
                        groupValue: _groupValue,
                        onChanged: _handleGenderChange),
                  ),
                  ListTile(
                    leading: buildText('Im Interested in Women'),
                    trailing: Radio(
                        activeColor: Color(0xFFfc5185),
                        value: 'women',
                        groupValue: _groupValue,
                        onChanged: _handleGenderChange),
                  ),
                  ListTile(
                    leading: buildText('Im Interested in Everyone'),
                    trailing: Radio(
                        value: 'other',
                        activeColor: Color(0xFFfc5185),
                        groupValue: _groupValue,
                        onChanged: _handleGenderChange),
                  ),
                ],
              ),
            ),
          ),
          ButtonWidget(
            buttonTitle: "Next",
            action: () {},
          )
        ],
      ),
    );
  }

  Text buildText(String text) => Text(text, style: TextStyle(fontSize: 16));
}
