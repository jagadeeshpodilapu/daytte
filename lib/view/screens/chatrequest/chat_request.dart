import 'package:daytte/consts/constants.dart';
import 'package:daytte/consts/image_constants.dart';
import 'package:flutter/material.dart';

import '../../widgets/common_widgets.dart';

class ChatRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(Constants.charRequest),
      body: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            minVerticalPadding: 5,
            leading: CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage(ImageConstants.girl),
              backgroundColor: Colors.transparent,
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Seema khan",
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: "Avenir",
                    fontSize: 16.0),
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                    )),
                SizedBox(width: 15),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        itemCount: 10,
      ),
    );
  }
}
