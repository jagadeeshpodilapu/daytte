import 'dart:ui';

import 'package:daytte/consts/constants.dart';
import 'package:daytte/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../consts/image_constants.dart';
import '../../../model/find_nearest_model.dart';
import '../../widgets/common_widgets.dart';

class ExpandPartnerDetails extends StatelessWidget {
  final User user = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "img",
      child: Scaffold(
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white12,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network('${user.profileImg?.imgPath}',
                    fit: BoxFit.cover),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                addVerticalSpace(10),
                _userNameWidget(),
                addVerticalSpace(10),
                _infoWidget(Icons.business_center,
                    "${user.institute ?? "Wildlife Photographer"}"),
                addVerticalSpace(5),
                _infoWidget(Icons.location_city_rounded, "Lives in New York"),
                addVerticalSpace(5),
                _infoWidget(Icons.person, "${user.gender}"),
                addVerticalSpace(5),
                _infoWidget(Icons.location_on, "2Km away"),
                _aboutmeText("About Me"),
                _aboutmeInfoWidget(),
                addVerticalSpace(20),
                _divider,
                addVerticalSpace(20),
                _aboutmeText("Passions"),
                _passionListWidget(),
                addVerticalSpace(20),
                _divider,
                addVerticalSpace(20),
                _shareProfileWidget(),
                _shareWidgetSub(),
                addVerticalSpace(20),
                _divider,
                addVerticalSpace(20),
                _reportProfileWidget(),
                addVerticalSpace(20),
                _divider,
                addVerticalSpace(40),
                _setIconsWidget(),
                addVerticalSpace(30),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _reportProfileWidget() {
    return Text(
      "REPORT  ${user.firstname} ${user.lastname}",
      textAlign: TextAlign.center,
      style: AppStyles.title
          .copyWith(color: Color(0xff9a9a9a), fontWeight: FontWeight.w400),
    );
  }

  Widget _shareWidgetSub() {
    return Center(
        child: Text(
      Constants.friendThinks,
      style: AppStyles.title
          .copyWith(color: Color(0xff7004E3), fontWeight: FontWeight.w400),
    ));
  }

  Widget _shareProfileWidget() {
    return Center(
        child: Text(
      "Share  ${user.firstname} ${user.lastname}",
      style: AppStyles.heading3
          .copyWith(color: Color(0xff7004E3), fontWeight: FontWeight.w500),
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

  Widget _passionListWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Wrap(
        runSpacing: 5,
        children: List.generate(
            user.passion?.length ?? 0,
            (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xff7004E3), width: 2)),
                    child: Text("${user.passion?[index].name}",
                        style: AppStyles.title2.copyWith(
                            color: Color(0xff7004E3),
                            fontWeight: FontWeight.w400)),
                  ),
                )),
      ),
    );
  }

  Padding _aboutmeInfoWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
      child: Text(
        "${user.shortDescription}",
        style: AppStyles.title.copyWith(
          fontWeight: FontWeight.w400,
          color: Color(0xff9a9a9a),
        ),
      ),
    );
  }

  Container get _divider => Container(
        height: 2,
        color: Colors.grey,
        margin: EdgeInsets.symmetric(horizontal: 24),
      );

  Align _aboutmeText(String text) {
    return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
          child: Text(text,
              style: AppStyles.heading3.copyWith(fontWeight: FontWeight.w500)),
        ));
  }

  Widget _infoWidget(IconData src, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(src, color: Colors.grey),
        ),
        addHorizontalSpace(10),
        Text(
          text,
          style: AppStyles.title
              .copyWith(color: Color(0xFF9A9A9A), fontWeight: FontWeight.w400),
        )
      ],
    );
  }

  Widget _userNameWidget() {
    var age = user.age.toString().split(" ");
    return Align(
        alignment: Alignment.topCenter,
        child: Text(
          "${user.firstname} ${user.lastname} ${age.first}",
          style: AppStyles.title
              .copyWith(color: Color(0xFF9A9A9A), fontWeight: FontWeight.w400),
        ));
  }
}
