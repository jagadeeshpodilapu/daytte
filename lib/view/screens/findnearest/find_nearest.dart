import 'package:daytte/consts/constants.dart';
import 'package:daytte/controllers/findnearest/find_nearest_controller.dart';
import 'package:daytte/routes/app_routes.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../dialogs/premium_dialogs/platinum_package.dart';

class FindTheNearest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: appBarWidget(Constants.findNearest, color: Color(0xffF7F8FA)),
        backgroundColor: Color(0xffF7F8FA),
        body: GetBuilder<FindNearestController>(
          init: FindNearestController(),
          builder: (controller) => controller.users.value != 0
              ? Column(
                  children: [
                    Expanded(
                      child: LazyLoadScrollView(
                          onEndOfPage: () => loadMore(),
                          child: GridView.builder(
                            itemCount: controller.users.value,
                            gridDelegate: sliverCountAxis,
                            itemBuilder: (BuildContext context, int index) {
                              var age = controller
                                  .findNearestModel?.data.users?[index].age.toString()
                                  .split(" ");
                              print("Age $age");
                              return GestureDetector(
                                  onTap: () {
                                    var userId = controller
                                        .findNearestModel?.data.users?[index];
                                    Get.toNamed(AppRoutes.DISCOVER,
                                        arguments: userId);
                                  },
                                  child: Card(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 6),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(16.0),
                                    ),
                                    elevation: 4,
                                    color: Colors.white,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(15.0),
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
                                              borderRadius:
                                                  new BorderRadius.only(
                                                topLeft:
                                                    const Radius.circular(
                                                        15.0),
                                                topRight:
                                                    const Radius.circular(
                                                        15.0),
                                              ),
                                              child: Container(
                                                width: Get.width,
                                                height: 80,
                                                color: Colors.white,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(
                                                          8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
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
                                                                    left:
                                                                        8.0),
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
                                                                    right:
                                                                        8.0),
                                                            child: CircleAvatar(
                                                                radius: 5,
                                                                backgroundColor:
                                                                    Colors
                                                                        .green),
                                                          )
                                                        ],
                                                      ),
                                                      addVerticalSpace(5),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0),
                                                        child: Text(
                                                            "NewYork,USA",
                                                            style: theme
                                                                .bodyText2
                                                                ?.copyWith(
                                                                    fontSize:
                                                                        12,
                                                                    color: Color(
                                                                        0xff9a9a9a))),
                                                      ),
                                                      addVerticalSpace(5),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0),
                                                        child: Text(
                                                            "Active now",
                                                            style: theme
                                                                .bodyText2
                                                                ?.copyWith(
                                                                    fontSize:
                                                                        12,
                                                                    color: Color(
                                                                        0xff9a9a9a))),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                              bottom: 82,
                                              right: 8,
                                              child: _distanceWidget())
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
        ));
  }

  Widget _distanceWidget() {
    return Container(
      height: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Color(0xff363636)),
      child: TextButton.icon(
          onPressed: () {},
          icon: SizedBox(),
          label: Text(
            "2.3Km",
            style: const TextStyle(
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
                fontSize: 12.0),
          )),
    );
  }

  Visibility expiryBanner(BuildContext context) {
    return Visibility(
      visible: false,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    const Color(0xFF6d25ba),
                    const Color(0xffba25b8),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
              color: Colors.green,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("25",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Constants.daysLeft,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      Text(Constants.expireMember,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20)),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 40),
                              child: PremiumPackages());
                        },
                      );
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
                      child: Text(
                        Constants.updatePlan,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  loadMore() {}
}
