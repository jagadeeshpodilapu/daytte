import 'package:daytte/consts/constants.dart';
import 'package:daytte/controllers/settingsController/settings_controller.dart';
import 'package:daytte/view/widgets/button_widget.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

import '../../../consts/image_constants.dart';
import '../interested/interested.dart';

class Settings extends StatelessWidget {
  final controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
        backgroundColor: Color(0xFFF7F8FA),
        appBar: _appBarWidget(),
        body: GetBuilder<SettingsController>(
            init: SettingsController(),
            // didChangeDependencies: (state)=>state.controller?.getUserSettingsPreferences(),
            builder: (controller) {
              return ListView(
                children: [
                  addVerticalSpace(25),
                  _titleBoldText(
                      theme, Constants.discoverySettings.toUpperCase()),
                  _locationWidget(theme, controller),
                  _maxmimumDistanceWidget(controller),
                  _genderSelectWidget(theme, controller),
                  _ageRangeWidget(controller, theme),
                  _showMeOnWooly(controller, theme),
                  _showWoolySubtitle(theme),
                  _contactUsTextWidget(theme),
                  _singleNameCard(Constants.helpSupport),
                  _rateUsWidget(),
                  _shareWoolyAppWidget(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: _titleBoldText(theme, Constants.legal),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        children: [
                          _singleCardWithTrailingIcon(Constants.privacyPolicy),
                          _singleCardWithTrailingIcon(Constants.termsOfService),
                          _singleCardWithTrailingIcon(Constants.license),
                        ],
                      ),
                    ),
                  ),
                  addVerticalSpace(8),
                  _logoutWidget(),
                  // _singleNameCard(Constants.logout, align: TextAlign.center),
                  _logoWidget(),
                  SizedBox(height: 15),
                  _deletedAccount(context, controller),
                  SizedBox(height: 25),
                ],
              );
            }));
  }

  Padding _logoutWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedGradientButton(
          title: Constants.logout,
          onPressed: () {
            controller.clearStorage();
          },
          borderRadius: 10,
          width: Get.width * 0.7),
    );
  }

  GestureDetector _shareWoolyAppWidget() {
    return GestureDetector(
      onTap: () {
        Share.share("Checkout my Profile in Daytee  http://www.google.com",
            subject: "Hey Im Using Daytee App");
      },
      child: _singleNameCard(Constants.shareDaytte),
    );
  }

  Center _logoWidget() {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SvgPicture.asset(
            ImageConstants.daytte_logo,
            height: 100,
            width: 100,
          ),
          Text(
            Constants.version,
            style: tileTextStyle(),
          )
        ],
      ),
    );
  }

  GestureDetector _deletedAccount(
      BuildContext context, SettingsController controller) {
    return GestureDetector(
      onTap: () => _deleteAccountAlert(context, controller),
      child: _singleNameCard(Constants.deletedAccount, align: TextAlign.center),
    );
  }

  Future<dynamic> _deleteAccountAlert(
      BuildContext context, SettingsController controller) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Are you sure delete the Account ?",
                    style: _textStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: Text(Constants.no,
                              style: _textStyle.copyWith(color: Colors.white))),
                      SizedBox(width: 50),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                        onPressed: () async {
                          await controller.updateUserPreferences(1);
                          controller.clearStorage();
                        },
                        child: Text(Constants.yes,
                            style: _textStyle.copyWith(
                              color: Colors.white,
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ));
  }

  GestureDetector _rateUsWidget() {
    return GestureDetector(
      onTap: () {},
      child: _singleNameCard(Constants.rateUs),
    );
  }

  Padding _contactUsTextWidget(TextTheme theme) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: _titleBoldText(theme, Constants.contactUs),
    );
  }

  Padding _showWoolySubtitle(TextTheme theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2),
      child: _subHeadGreyText(
          "Turning this on will show your profile to single users near you.",
          theme,
          size: 12),
    );
  }

  Widget _showMeOnWooly(SettingsController controller, TextTheme theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        color: Colors.white,
        elevation: 4.0,
        child: ListTile(
          title: _subHeadGreyText(Constants.showMeDaytte, theme),
          trailing: Switch(
            value: controller.showme.value,
            activeColor: Color(0xFF7004E3),
            activeTrackColor: Color(0xFF7004E3),
            onChanged: (value) => controller.showMeOnDaytee(),
            thumbColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _ageRangeWidget(SettingsController controller, TextTheme theme) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4.0,
        child: ListTile(
          title: Text(
            Constants.ageRange,
            style: _textStyle,
          ),
          trailing: Text(
            "${controller.rangeValues.value.start.toInt()}-${controller.rangeValues.value.end.toInt()}",
            style: _textStyle,
          ),
          subtitle: SliderTheme(
            data: _sliderCircle(),
            child: RangeSlider(
              values: controller.rangeValues.value,
              min: 18.0,
              max: 50.0,
              onChanged: (values) => controller.updateAgeRange(values),
              inactiveColor: Colors.grey[400],
              activeColor: Color(0xFF7004E3),
            ),
          ),
        ),
      ),
    );
  }

  SliderThemeData _sliderCircle() {
    return SliderThemeData(
        trackHeight: 2,
        rangeThumbShape: RoundRangeSliderThumbShape(enabledThumbRadius: 8));
  }

  Widget _genderSelectWidget(TextTheme theme, SettingsController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4.0,
        child: ListTile(
          onTap: () => Get.to(() => InterestedScreen()),
          title: _subHeadGreyText(Constants.gender, theme),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _titleBoldText(
                  theme,
                  controller.userInfoModel?.data.user?.interestedIn ??
                      "Female"),
              addHorizontalSpace(8),
              _backArrow()
            ],
          ),
        ),
      ),
    );
  }

  Widget _maxmimumDistanceWidget(SettingsController controller) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 4.0,
        child: ListTile(
          title: Text(
            Constants.maximumDistance,
            style: _textStyle,
          ),
          trailing: Text(
            "${controller.maxDistance.value.toInt()} Km",
            style: TextStyle(fontSize: 16),
          ),
          subtitle: SliderTheme(
            data: _sliderCircle(),
            child: Slider(
              value: controller.maxDistance.value,
              onChanged: (value) => controller.changeMaxDistance(value),
              min: 0.0,
              max: 100,
              thumbColor: Color(0xFF7004E3),
              inactiveColor: Colors.grey[400],
              activeColor: Color(0xFF7004E3),
            ),
          ),
        ),
      ),
    );
  }

  Widget _locationWidget(TextTheme theme, SettingsController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 2.0,
        child: ListTile(
          title: _subHeadGreyText("Location", theme),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _titleBoldText(theme,
                  "${controller.userInfoModel?.data.user?.location ?? "Bangalore"}"),
              addHorizontalSpace(8),
              _backArrow()
            ],
          ),
        ),
      ),
    );
  }

  Widget _backArrow() {
    return Icon(
      Icons.arrow_forward_ios,
      size: 18,
      color: Color(0xff363636),
    );
  }

  Text _subHeadGreyText(String title, TextTheme theme, {double? size}) {
    return Text(
      title,
      style: theme.subtitle1
          ?.copyWith(fontSize: size ?? 16, color: Color(0xff9A9A9A)),
    );
  }

  Widget _titleBoldText(TextTheme theme, String header) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(header, style: theme.headline6?.copyWith(fontSize: 18)),
    );
  }

  AppBar _appBarWidget() {
    return AppBar(
      leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 22,
          )),
      automaticallyImplyLeading: true,
      title: Text(
        Constants.settings,
        style: TextStyle(color: Colors.black),
      ),
      elevation: 2.0,
      centerTitle: true,
      backgroundColor: Colors.white,
      actions: [
        GestureDetector(
          onTap: () async {
            await controller.updateUserPreferences(0);
            if (controller.responseModel?.message != null) {
              Get.back();
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Done",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(
                      0xFFfe5068,
                    ),
                    fontSize: 18),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _singleCardWithTrailingIcon(String text) {
    return ListTile(
      title: Text(
        text,
        style: _textStyle,
      ),
      trailing: _backArrow(),
    );
  }

  Widget _singleNameCard(String title, {TextAlign? align}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        color: Colors.white,
        child: ListTile(
          title: Text(
            title,
            textAlign: align ?? TextAlign.start,
            style: _textStyle,
          ),
        ),
      ),
    );
  }

  TextStyle get _textStyle {
    return const TextStyle(
        color: const Color(0xff000000),
        fontWeight: FontWeight.w500,
        fontFamily: "ProximaNovaSoft",
        fontStyle: FontStyle.normal,
        fontSize: 18.0);
  }
}
