import 'package:daytte/consts/constants.dart';
import 'package:daytte/controllers/findnearest/find_nearest_controller.dart';
import 'package:daytte/view/screens/discoverpartner/discover_partner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../../utils/common_functions.dart';
import '../../dialogs/premium_dialogs/platinum_package.dart';

class FindTheNearest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () => onBackPressed(),
          color: Colors.black,
        ),
        title: Text(
          "Find the nearest",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 8),
        child: GetBuilder<FindNearestController>(
          init: FindNearestController(),
          builder: (controller) => controller.users.value != 0
              ? Column(
                  children: [
                    expiryBanner(context),
                    Expanded(
                      child: LazyLoadScrollView(
                          onEndOfPage: () => loadMore(),
                          child: GridView.builder(
                            itemCount: controller.users.value,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 6.0,
                                    childAspectRatio: 2.6 / 4,
                                    mainAxisSpacing: 6.0),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () => Get.to(() => DiscoverPartner()),
                                child: Card(
                                  elevation: 4,
                                  color: Colors.white,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.network(
                                            "${controller.findNearestModel?.data.users?[index].profileImg?.imgPath ?? Constants.emtptyImageUrl}",
                                            fit: BoxFit.fitWidth,
                                            width: Get.width,
                                            height: 200,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom: 4.0, top: 6),
                                          child: Text(
                                              "${controller.findNearestModel?.data.users?[index].firstname} ${controller.findNearestModel?.data.users?[index].lastname}",
                                              style: TextStyle(fontSize: 16)),
                                        ),
                                        Text("Active Now",
                                            style: TextStyle(fontSize: 12)),
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
      ),
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
                      Text("Days Left",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      Text("to expire membership",
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
                        "Update plan",
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
