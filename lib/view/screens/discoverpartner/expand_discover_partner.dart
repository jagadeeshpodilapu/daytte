import 'dart:ui';

import 'package:daytte/consts/image_constants.dart';
import 'package:daytte/model/find_nearest_model.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpandPartnerDetails extends StatelessWidget {
  final User user = Get.arguments;

  @override
  Widget build(BuildContext context) {
      print("user info $user");
    final theme = Theme.of(context).textTheme;
    return Hero(
      tag: "img",
      child: Scaffold(
        body: Container(
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              _userProfilePicWidget(),
              _downArrowWidget(),
              _userBioDetailsWidget(theme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userBioDetailsWidget(TextTheme theme) {
    return FractionallySizedBox(
      heightFactor: 0.5,
      alignment: Alignment.bottomCenter,
      child: ListView(
        children: [
          addVerticalSpace(10),
          _userNameWidget(theme),
          addVerticalSpace(10),
          _infoWidget(Icons.business_center,
              "${user.institute ?? "Wildlife Photographer"}", theme),
          addVerticalSpace(5),
          _infoWidget(Icons.location_city_rounded, "Lives in New York", theme),
          addVerticalSpace(5),
          _infoWidget(Icons.person, "${user.gender}", theme),
          addVerticalSpace(5),
          _infoWidget(Icons.location_on, "2Km away", theme),
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
          _shareProfileWidget(theme),
          _shareWidgetSub(theme),
          addVerticalSpace(20),
          _divider,
          addVerticalSpace(20),
          _reportProfileWidget(theme),
          addVerticalSpace(20),
          _divider,
          addVerticalSpace(40),
          _setIconsWidget(),
          addVerticalSpace(30),
        ],
      ),
    );
  }

  Widget _reportProfileWidget(TextTheme theme) {
    return Text(
      "REPORT  ${user.firstname} ${user.lastname}",
      textAlign: TextAlign.center,
      style: theme.headline6?.copyWith(color: Color(0xff9a9a9a)),
    );
  }

  Widget _shareWidgetSub(TextTheme theme) {
    return Center(
        child: Text(
      "See what a friend thinks",
      style: theme.subtitle1?.copyWith(color: Color(0xff7004E3), fontSize: 18),
    ));
  }

  Widget _shareProfileWidget(TextTheme theme) {
    return Center(
        child: Text(
      "Share  ${user.firstname} ${user.lastname}",
      style: theme.headline6?.copyWith(color: Color(0xff7004E3),fontSize: 22),
    ));
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
          height: icon == ImageConstants.ic_close ? 24 : 30,
          width: icon == ImageConstants.ic_close ? 24 : 30,
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
            user.passion?.length??0,
            (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xff7004E3), width: 2)),
                    child: Text("${user.passion?[index].name}",
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
      child: Text("${user.shortDescription}",
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
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(src, color: Colors.grey),
        ),
        addHorizontalSpace(10),
        Text(text,
            style: theme.headline6
                ?.copyWith(fontSize: 18, color: Color(0xff9a9a9a)))
      ],
    );
  }

  Widget _userNameWidget(TextTheme theme) {
    var age = user.age.toString().split(" ");
    return Align(
        alignment: Alignment.topCenter,
        child: Text(
          "${user.firstname} ${user.lastname} ${age.first}",
          style: theme.headline6,
        ));
  }

  FractionallySizedBox _userProfilePicWidget() {
    return FractionallySizedBox(
      heightFactor: 0.5,
      alignment: Alignment.topCenter,
      child: Container(
        child: Image.network('${user.profileImg?.imgPath}', fit: BoxFit.cover),
      ),
    );
  }

  Widget _downArrowWidget() {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Align(
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
          child: Icon(Icons.arrow_upward, color: Colors.white, size: 30),
        ),
      ),
    );
  }
}
