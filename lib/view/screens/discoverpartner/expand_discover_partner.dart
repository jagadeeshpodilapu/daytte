import 'dart:ui';

import 'package:daytte/consts/image_constants.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExpandPartnerDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          _userProfilePicWidget(),
          _downArrowWidget(),
          _userBioDetailsWidget(theme),
        ],
      ),
    );
  }

  Widget _userBioDetailsWidget(TextTheme theme) {
    return FractionallySizedBox(
      heightFactor: 0.5,
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        child: Column(
          children: [
            addVerticalSpace(20),
            _userNameWidget(theme),
            addVerticalSpace(10),
            _infoWidget(Icons.business_center, "Wildlife Photographer", theme),
            addVerticalSpace(5),
            _infoWidget(
                Icons.location_city_rounded, "Lives in New York", theme),
            addVerticalSpace(5),
            _infoWidget(Icons.person, "Wildlife Photographer", theme),
            addVerticalSpace(5),
            _infoWidget(Icons.location_on, "Wildlife Photographer", theme),
            _aboutmeText(theme, "About Me"),
            _aboutmeInfoWidget(theme),
            addVerticalSpace(20),
            _divider,
            addVerticalSpace(20),
            _aboutmeText(theme, "Passion"),
            _passionListWidget(theme),
            addVerticalSpace(20),
            _divider,
            addVerticalSpace(20),
            Center(
                child: Text(
              "Share Denise Burton Profile",
              style: theme.headline6?.copyWith(color: Color(0xff7004E3)),
            )),
            Center(
                child: Text(
              "See what a friend thinks",
              style: theme.subtitle1
                  ?.copyWith(color: Color(0xff7004E3), fontSize: 18),
            )),
            addVerticalSpace(20),
            _divider,
            addVerticalSpace(20),
            Text(
              "REPORT DENISE BURTON",
              style: theme.headline6?.copyWith(color: Color(0xff9a9a9a)),
            ),
            addVerticalSpace(20),
            _divider,
            addVerticalSpace(40),
            _setIconsWidget(),
            addVerticalSpace(30),
          ],
        ),
      ),
    );
  }

  Widget _setIconsWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _tinderIcons(ImageConstants.ic_rewind),
        addHorizontalSpace(50),
        _tinderIcons(ImageConstants.ic_love),
        addHorizontalSpace(50),
        _tinderIcons(ImageConstants.ic_close),
      ],
    );
  }

  Widget _tinderIcons(String icon) {
    return Container(
      height: 50,
      width: 50,
      child: MaterialButton(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(color: Colors.white),
        ),
        padding: EdgeInsets.all(8),
        onPressed: () {
          if (icon == ImageConstants.ic_rewind) {
            // controller.matchEngine?.currentItem?.nope();
          } else if (icon == ImageConstants.ic_love) {
            //  controller.matchEngine?.currentItem?.like();
          } else if (icon == ImageConstants.ic_close) {
            // controller.matchEngine?.currentItem?.superLike();
          }
        },
        child: Image.asset(
          icon,
          height: 30,
          width: 30,
        ),
      ),
    );
  }

  Widget _passionListWidget(TextTheme theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Wrap(
        runSpacing: 5,
        children: List.generate(
            4,
            (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xff7004E3), width: 2)),
                    child: Text("index $index dskfnjksdlf",
                        style: theme.subtitle1
                            ?.copyWith(color: Color(0xff7004E3))),
                  ),
                )),
      ),
    );
  }

  Padding _aboutmeInfoWidget(TextTheme theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
      child: Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever",
          style: theme.subtitle1?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: Color(0xff9a9a9a))),
    );
  }

  Container get _divider => Container(
        height: 2,
        color: Colors.grey,
        margin: EdgeInsets.symmetric(horizontal: 24),
      );

  Align _aboutmeText(TextTheme theme, String text) {
    return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
          child: Text(text,
              style: theme.headline5?.copyWith(fontWeight: FontWeight.w500)),
        ));
  }

  Widget _infoWidget(IconData src, String text, TextTheme theme) {
    return Row(
      children: [
        addHorizontalSpace(10),
        Icon(src, color: Colors.grey),
        addHorizontalSpace(10),
        Text(text,
            style: theme.headline6
                ?.copyWith(fontSize: 18, color: Color(0xff9a9a9a)))
      ],
    );
  }

  Widget _userNameWidget(TextTheme theme) {
    return Align(
        alignment: Alignment.topCenter,
        child: Text(
          "Denise Burton 26",
          style: theme.headline6,
        ));
  }

  FractionallySizedBox _userProfilePicWidget() {
    return FractionallySizedBox(
      heightFactor: 0.5,
      alignment: Alignment.topCenter,
      child: Container(
        child: Image.asset('assets/icon/video_girl.png', fit: BoxFit.cover),
      ),
    );
  }

  Align _downArrowWidget() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: 40,
        width: 40,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
          gradient: gradientColors,
        ),
        child: Icon(Icons.arrow_downward, color: Colors.white, size: 30),
      ),
    );
  }

  LinearGradient get gradientColors => LinearGradient(
        colors: <Color>[
          Color(0xFF7004E3),
          Color(0xFF8511E6),
          Color(0xFF9A1EE9),
        ],
      );
}
