import 'package:daytte/consts/constants.dart';
import 'package:daytte/themes/app_styles.dart';
import 'package:daytte/view/screens/likedetails/liked.dart';
import 'package:daytte/view/screens/likedetails/you_liked.dart';
import 'package:flutter/material.dart';

import '../../widgets/common_widgets.dart';

class LikesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: appBarWidget(Constants.likedDetails, color: Color(0xffF7F8FA)),
        backgroundColor: Color(0xffF7F8FA),

        body: getBody(context),
        //  bottomSheet: getFooter(),
      ),
    );
  }

  Widget getBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment(0, 0),
            end: Alignment(1, 1),
            colors: [const Color(0xffffffff), const Color(0xffe4e6eb)]),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:18.0),
            child: TabBar(
                indicatorColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.0,
                              spreadRadius: 0.0,
                              offset: Offset(1.0, 1.0),
                            )
                          ],
                          border: Border.all(color: Colors.white, width: 1)),
                      child: Align(
                        alignment: Alignment.center,
                        child:
                            Text("0 ${Constants.likes}"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 1.0,
                            spreadRadius: 0.0,
                            offset: Offset(1.0, 1.0),
                          )
                        ],
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(Constants.youLiked),
                      ),
                    ),
                  ),
                ]),
          ),
          Expanded(
            child: TabBarView(
              children: [Liked(), YouLikedView()],
            ),
          )
        ],
      ),
    );
  }

  TextStyle tabTextStyle() {
    return AppStyles.heading3
        .copyWith(fontSize: 18, fontWeight: FontWeight.w400);
  }
}
