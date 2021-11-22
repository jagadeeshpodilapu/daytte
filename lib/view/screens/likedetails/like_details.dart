import 'package:daytte/consts/constants.dart';
import 'package:daytte/controllers/findnearest/find_nearest_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../widgets/common_widgets.dart';

class LikesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        
        appBar: appBarWidget(Constants.likedDetails,color: Color(0xffF7F8FA) ),
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
          TabBar(
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              
              
              tabs: [
                /* Tab(
                  child: Text(
                    " 0 ${Constants.likes}",
                  ),
                ),
                Tab(
                  child: Text(
                    Constants.youLiked,
                  ),
                ) */
                Tab(
                  child: Container(
                    clipBehavior:Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white, width: 1)),
                    child: Card(
                      elevation: 2,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("0 ${Constants.likes}"),
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white ,width: 1)),
                    child: Card(
                      elevation: 2,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(Constants.youLiked),
                      ),
                    ),
                  ),
                ),
              ]),
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
    return TextStyle(fontSize: 18,color: Colors.black, fontWeight: FontWeight.bold);
  }
}

class YouLikedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GetBuilder<FindNearestController>(
      init: FindNearestController(),
      builder: (controller) => controller.users.value != 0
          ? Padding(
            padding: const EdgeInsets.symmetric(horizontal:12.0,vertical: 8),
            child: Column(
                children: [
                  Expanded(
                    child: LazyLoadScrollView(
                        onEndOfPage: () {},
                        child: GridView.builder(
                          itemCount: controller.users.value,
                          gridDelegate: sliverCountAxis,
                          itemBuilder: (BuildContext context, int index) {
                            var age = controller
                                .findNearestModel?.data.users?[index].age
                                .toString()
                                .split(" ");
                            print("Age $age");
                            return GestureDetector(
                                onTap: () {},
                                child: Card(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 6),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  elevation: 4,
                                  color: Colors.white,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        FractionallySizedBox(
                                          alignment: Alignment.topCenter,
                                          child: Image.network(
                                            "${controller.findNearestModel?.data.users?[index].profileImg?.imgPath ?? Constants.emtptyImageUrl}",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: ClipRRect(
                                            borderRadius: new BorderRadius.only(
                                              topLeft:
                                                  const Radius.circular(15.0),
                                              topRight:
                                                  const Radius.circular(15.0),
                                            ),
                                            child: Container(
                                              width: Get.width,
                                              height: 80,
                                              color: Colors.white,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Text(
                                                              "${controller.findNearestModel?.data.users?[index].firstname}, ${age?.first}",
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: theme
                                                                  .headline6
                                                                  ?.copyWith(
                                                                      fontSize:
                                                                          16)),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 8.0),
                                                          child: CircleAvatar(
                                                              radius: 5,
                                                              backgroundColor:
                                                                  Colors.green),
                                                        )
                                                      ],
                                                    ),
                                                    addVerticalSpace(5),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Text("NewYork,USA",
                                                          style: theme.bodyText2
                                                              ?.copyWith(
                                                                  fontSize: 12,
                                                                  color: Color(
                                                                      0xff9a9a9a))),
                                                    ),
                                                    addVerticalSpace(5),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Text("Active now",
                                                          style: theme.bodyText2
                                                              ?.copyWith(
                                                                  fontSize: 12,
                                                                  color: Color(
                                                                      0xff9a9a9a))),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                          },
                        )),
                  ),
                ],
              ),
          )
          : Center(
              child: CircularProgressIndicator.adaptive(),
            ),
    );
  }

 
  loadMore() {}
}

class Liked extends StatelessWidget {
  const Liked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context).textTheme;
    return GetBuilder<FindNearestController>(
      init: FindNearestController(),
      builder: (controller) => controller.users.value != 0
          ? Column(
              children: [
                Expanded(
                  child: LazyLoadScrollView(
                      onEndOfPage: () {},
                      child: GridView.builder(
                        itemCount: controller.users.value,
                        gridDelegate: sliverCountAxis,
                        itemBuilder: (BuildContext context, int index) {
                          var age = controller
                              .findNearestModel?.data.users?[index].age
                              .toString()
                              .split(" ");
                          print("Age $age");
                          return GestureDetector(
                              onTap: () {},
                              child: Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                elevation: 4,
                                color: Colors.white,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      FractionallySizedBox(
                                        alignment: Alignment.topCenter,
                                        child: Image.network(
                                          "${controller.findNearestModel?.data.users?[index].profileImg?.imgPath ?? Constants.emtptyImageUrl}",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        child: ClipRRect(
                                          borderRadius: new BorderRadius.only(
                                            topLeft:
                                                const Radius.circular(15.0),
                                            topRight:
                                                const Radius.circular(15.0),
                                          ),
                                          child: Container(
                                            width: Get.width,
                                            height: 80,
                                            color: Colors.white,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0),
                                                        child: Text(
                                                            "${controller.findNearestModel?.data.users?[index].firstname}, ${age?.first}",
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: theme
                                                                .headline6
                                                                ?.copyWith(
                                                                    fontSize:
                                                                        16)),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 8.0),
                                                        child: CircleAvatar(
                                                            radius: 5,
                                                            backgroundColor:
                                                                Colors.green),
                                                      )
                                                    ],
                                                  ),
                                                  addVerticalSpace(5),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Text("NewYork,USA",
                                                        style: theme.bodyText2
                                                            ?.copyWith(
                                                                fontSize: 12,
                                                                color: Color(
                                                                    0xff9a9a9a))),
                                                  ),
                                                  addVerticalSpace(5),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Text("Active now",
                                                        style: theme.bodyText2
                                                            ?.copyWith(
                                                                fontSize: 12,
                                                                color: Color(
                                                                    0xff9a9a9a))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                        },
                      )),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator.adaptive(),
            ),
    );
  }

  loadMore() {}
}
