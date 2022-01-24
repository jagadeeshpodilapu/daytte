import 'package:daytte/consts/constants.dart';
import 'package:daytte/controllers/like/like_details_controller.dart';
import 'package:daytte/themes/app_styles.dart';
import 'package:daytte/themes/color_styles.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class Liked extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LikedController>(
      init: LikedController(),
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
                                          "${controller.likedModel?.data.likes?[index].likedBy?.profileImg ?? Constants.emtptyImageUrl}",
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, _, __) {
                                            return Image.asset(
                                              "assets/images/placeholder.jpg",
                                              fit: BoxFit.cover,
                                            );
                                          },
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
                                            height: 100,
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
                                                            "${controller.likedModel?.data.likes?[index].likedBy?.firstname ?? ""} ${controller.likedModel?.data.likes?[index].likedBy?.lastname ?? ""}",
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: AppStyles
                                                                .title
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500)),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 5.0),
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
                                                    child: Text(
                                                        "${controller.likedModel?.data.likes?[index].likedBy?.location ?? ""}",
                                                        style: AppStyles.title2
                                                            .copyWith(
                                                                color:
                                                                    secondaryTextColor)),
                                                  ),
                                                  addVerticalSpace(5),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Text("Active now",
                                                        style: AppStyles.title2
                                                            .copyWith(
                                                                color:
                                                                    secondaryTextColor)),
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
              child: Text(
                "No records found",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
    );
  }

  loadMore() {}
}
