import 'package:daytte/consts/constants.dart';
import 'package:daytte/controllers/findnearest/find_nearest_controller.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class LikesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: appBarWidget("Likes Details"),
        backgroundColor: Colors.white,

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
          Card(
            elevation: 2.5,
            child: TabBar(
                indicatorColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                labelStyle: tabTextStyle(),
                unselectedLabelStyle: tabTextStyle(),
                tabs: [
                  Tab(
                    child: Text(
                      " 0 Likes",
                    ),
                  ),
                  Tab(
                    child: Text(
                      "You Liked",
                    ),
                  )
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
    return TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  }
}

class YouLikedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      child: GetBuilder<FindNearestController>(
        init: FindNearestController(),
        builder: (controller) => controller.users.value != 0
            ? Column(
                children: [
                  Expanded(
                    child: LazyLoadScrollView(
                        onEndOfPage: () => loadMore(),
                        child: GridView.builder(
                          itemCount: controller.users.value,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 4.0,
                                  childAspectRatio: 2.3 / 4,
                                  mainAxisSpacing: 4.0),
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              elevation: 4,
                              color: Colors.white,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: const Color(0x0d000000),
                                            offset: Offset(0, 0),
                                            blurRadius: 10,
                                            spreadRadius: 0)
                                      ],
                                      color: const Color(0xffffffff)),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                          "${controller.findNearestModel?.data.users?[index].profileImg?.imgPath ?? Constants.emtptyImageUrl}",
                                          fit: BoxFit.fitWidth,
                                          width: Get.width,
                                          height: 230,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 4.0, top: 6),
                                        child: Text(
                                            "${controller.findNearestModel?.data.users?[index].firstname} ${controller.findNearestModel?.data.users?[index].lastname}",
                                            style: const TextStyle(
                                                color: const Color(0xff363636),
                                                fontWeight: FontWeight.w800,
                                                fontFamily: "Muli",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.0)),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 4.0),
                                        child: Text("Active Now",
                                            style: const TextStyle(
                                                color: const Color(0xff757e90),
                                                fontWeight: FontWeight.w300,
                                                fontFamily: "Muli",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 10.0)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )),
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator.adaptive(),
              ),
      ),
    );
  }

  loadMore() {}
}

class Liked extends StatelessWidget {
  const Liked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      child: GetBuilder<FindNearestController>(
        init: FindNearestController(),
        builder: (controller) => controller.users.value != 0
            ? Column(
                children: [
                  Expanded(
                    child: LazyLoadScrollView(
                        onEndOfPage: () => loadMore(),
                        child: GridView.builder(
                          itemCount: controller.users.value,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 4.0,
                                  childAspectRatio: 2.3 / 4,
                                  mainAxisSpacing: 4.0),
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              elevation: 4,
                              color: Colors.white,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: const Color(0x0d000000),
                                            offset: Offset(0, 0),
                                            blurRadius: 10,
                                            spreadRadius: 0)
                                      ],
                                      color: const Color(0xffffffff)),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                          "${controller.findNearestModel?.data.users?[index].profileImg?.imgPath ?? Constants.emtptyImageUrl}",
                                          fit: BoxFit.fitWidth,
                                          width: Get.width,
                                          height: 230,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 4.0, top: 6),
                                        child: Text(
                                            "${controller.findNearestModel?.data.users?[index].firstname} ${controller.findNearestModel?.data.users?[index].lastname}",
                                            style: const TextStyle(
                                                color: const Color(0xff363636),
                                                fontWeight: FontWeight.w800,
                                                fontFamily: "Muli",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.0)),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 4.0),
                                        child: Text("Active Now",
                                            style: const TextStyle(
                                                color: const Color(0xff757e90),
                                                fontWeight: FontWeight.w300,
                                                fontFamily: "Muli",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 10.0)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )),
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator.adaptive(),
              ),
      ),
    );
  }

  loadMore() {}
}
