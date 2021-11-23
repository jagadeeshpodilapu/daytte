import 'package:daytte/view/widgets/button_widget.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeetPeopleNearBy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        children: [
          addVerticalSpace(50),
          _expandLessButtonWidget(),
          _allowLocationButtonWidget(),
          addVerticalSpace(Get.height * 0.15),
          _meetPeopleWidget(theme),
          addVerticalSpace(20),
          _subTextWidget(theme),
        ],
      ),
    );
  }

  Widget _subTextWidget(TextTheme theme) {
    return Text(
      """
  Your location will be used to 
 show potential matches near you""",
      style: theme.subtitle1?.copyWith(color: Color(0xff9a9a9a)),
    );
  }

  Widget _meetPeopleWidget(TextTheme theme) {
    return Text("Meet Nearby People",
        style: theme.headline4
            ?.copyWith(fontSize: 28, fontWeight: FontWeight.w500));
  }

  Widget _allowLocationButtonWidget() {
    return Center(
      child: SizedBox(
        width: Get.width * 0.8,
        child: RaisedGradientButton(
          onPressed: () {},
          title: "Allow Location",
        ),
      ),
    );
  }

  Widget _expandLessButtonWidget() => Center(
      child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.expand_less, size: 30, color: Colors.grey)));
}
