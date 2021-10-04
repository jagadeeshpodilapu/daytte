import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UniversityList extends StatelessWidget {
  List<String> items = [
    'Banglore University',
    'Mysore University',
    'UP University',
    'MP University',
    'Delhi University',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('University'),
      body: Container(
        // margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(8),
        height: Get.height*0.8,
        child: Card(
          elevation: 4,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search University",
                    prefixIcon: Icon(Icons.search),
                  ),
                  textAlignVertical: TextAlignVertical.center,
                ),
              ),
              ListView.builder(
                itemCount: items.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal:16.0,vertical: 8),
                  child: Text(items[index],style: TextStyle(fontSize: 20),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
