import 'package:daytte/consts/constants.dart';
import 'package:daytte/controllers/settingsController/settings_controller.dart';
import 'package:daytte/view/screens/university/university.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

import '../../../consts/image_constants.dart';
import '../interested/interested.dart';

class Settings extends StatelessWidget {
  final controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFf8f8f8),
        appBar: AppBar(
          title: Text(
            Constants.settings,
            style: TextStyle(color: Colors.black),
          ),
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
        ),
        body: GetBuilder<SettingsController>(
            init: SettingsController(),
          didChangeDependencies: (state)=>state.controller?.getUserSettingsPreferences(),
            builder: (controller) {
              return ListView(
                children: [
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(Constants.discoverySettings.toUpperCase()),
                  ),
                  ListTile(
                    // onTap: () => Get.to(() => UniversityView()),
                    title: Text(
                      "Location",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Banglore \n      India",
                            style: TextStyle(fontSize: 16)),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      Constants.maximumDistance,
                      style: _textStyle,
                    ),
                    trailing: Text(
                      "${controller.maxDistance.value.toInt()} Km",
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: Slider(
                      value: controller.maxDistance.value,
                      onChanged: (value) => controller.changeMaxDistance(value),
                      min: 0.0,
                      max: 100,
                      thumbColor: Colors.white,
                      inactiveColor: Colors.grey[400],
                      activeColor: Color(0xFFfd5068),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () => Get.to(() => InterestedScreen()),
                    title: Text(
                      Constants.gender,
                      style: _textStyle,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Women",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      Constants.ageRange,
                      style: _textStyle,
                    ),
                    trailing: Text(
                      "${controller.rangeValues.value.start.toInt()}-${controller.rangeValues.value.end.toInt()}",
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: RangeSlider(
                      values: controller.rangeValues.value,
                      min: 18.0,
                      max: 50.0,
                      onChanged: (values) => controller.updateAgeRange(values),
                      inactiveColor: Colors.grey[400],
                      activeColor: Color(0xFFfd5068),
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    color: Colors.white,
                    child: ListTile(
                      title: Text(
                        Constants.showMeDaytte,
                        style: _textStyle,
                      ),
                      trailing: CupertinoSwitch(
                        value: controller.showme.value,
                        activeColor: Color(0xFFfc4f67),
                        onChanged: (value) => controller.showMeOnDaytee(),
                        thumbColor: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 8),
                    child: Text(
                      "Turning this on will show your profile to single users near you.",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15, left: 15),
                    child: Text(
                      Constants.contactUs,
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                  _singleNameCard(Constants.helpSupport),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: _singleNameCard(Constants.rateUs),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                      onTap: () {
                        Share.share(
                            "Checkout my Profile in Daytee  http://www.google.com",
                            subject: "Hey Im Using Daytee App");
                      },
                      child: _singleNameCard(Constants.shareDaytte)),
                  Padding(
                    padding: EdgeInsets.only(top: 18, left: 18),
                    child: Text(
                      Constants.legal,
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        _singleCardWithTrailingIcon(Constants.privacyPolicy),
                        _singleCardWithTrailingIcon(Constants.termsOfService),
                        _singleCardWithTrailingIcon(Constants.license),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  _singleNameCard(Constants.logout),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Image.asset(
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
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                      onTap: () => showDialog(
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
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.red,
                                        ),
                                        child: Text(Constants.no,
                                                style: _textStyle.copyWith(
                                                    color: Colors.white))),
                                    SizedBox(width: 50),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.grey,
                                      ),
                                      onPressed: () {
                                        controller.updateUserPreferences(1);
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
                              )),
                      child: _singleNameCard(Constants.deletedAccount)),
                  SizedBox(height: 25),
                ],
              );
            }));
  }

  Widget _singleCardWithTrailingIcon(String text) {
    return ListTile(
      title: Text(
        text,
        style: _textStyle,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
      ),
    );
  }

  Widget _singleNameCard(String title) {
    return Card(
      color: Colors.white,
      child: ListTile(
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: _textStyle,
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
