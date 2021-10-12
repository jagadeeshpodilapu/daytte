import 'package:daytte/consts/image_constants.dart';
import 'package:daytte/utils/common_functions.dart';
import 'package:daytte/view/screens/aboutus/aboutus.dart';
import 'package:daytte/view/screens/interested/interested.dart';
import 'package:daytte/view/screens/university/university.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf8f8f8),
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: () => onBackPressed(),
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
      body: ListView(
        children: [
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Discovery Settings".toUpperCase()),
          ),
          ListTile(
            onTap: () => Get.to(() => UniversityView()),
            title: Text(
              "Location",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Banglore \n      India", style: TextStyle(fontSize: 16)),
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
              "Maximum Distance",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              "50mi",
              style: TextStyle(fontSize: 16),
            ),
            subtitle: Slider(
              value: 60,
              onChanged: (value) {},
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
              "Gender",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
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
              "Age Range",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              "18-30",
              style: TextStyle(fontSize: 16),
            ),
            subtitle: RangeSlider(
              values: RangeValues(18, 50),
              min: 0.0,
              max: 100.0,
              onChanged: (values) {
                /* setState(() {
      
                        _starValue = values.start.roundToDouble();
      
                        _endValue = values.end.roundToDouble();
      
                      }); */
              },
              inactiveColor: Colors.grey[400],
              activeColor: Color(0xFFfd5068),
            ),
          ),
          SizedBox(height: 10),
          Card(
            color: Colors.white,
            child: ListTile(
              title: Text(
                "Show me on Daytee",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              trailing: CupertinoSwitch(
                value: true,
                activeColor: Color(0xFFfc4f67),
                onChanged: (value) {},
                thumbColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: Text(
              "Turning this on will show your profile to single users near you.",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 15),
            child: Text(
              "CONTACT US",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
          _singleNameCard("Help & Support"),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () => Get.to(() => AboutUs()),
            child: _singleNameCard("Rate Us"),
          ),
          SizedBox(
            height: 15,
          ),
          _singleNameCard("Share Daytee"),
          Padding(
            padding: EdgeInsets.only(top: 18, left: 18),
            child: Text(
              "LEGAL",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
          Card(
            color: Colors.white,
            child: Column(
              children: [
                _singleCardWithTrailingIcon("Privacy Policy"),
                _singleCardWithTrailingIcon("Terms of Service"),
                _singleCardWithTrailingIcon("Licenses"),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          _singleNameCard("Logout"),
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
                  "Version 6.8.9",
                  style: tileTextStyle(),
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          _singleNameCard("Delete Account"),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }

  Widget _singleCardWithTrailingIcon(String text) {
    return ListTile(
      title: Text(
        text,
        style: tileTextStyle(),
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
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
