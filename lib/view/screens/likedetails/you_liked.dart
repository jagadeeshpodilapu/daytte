import 'package:daytte/consts/constants.dart';
import 'package:daytte/controllers/like/like_details_controller.dart';
import 'package:daytte/themes/app_styles.dart';
import 'package:daytte/themes/color_styles.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class YouLikedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<YouLikedController>(
      init: YouLikedController(),
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
                          // var age = controller
                          //     .findNearestModel?.data.users?[index].age
                          //     .toString()
                          //     .split(" ");

                          return GestureDetector(
                              onTap: () {
                                // Get.toNamed(AppRoutes.PROFILEVIEW,
                                //     arguments: controller.likedDetailsModel?.data.likes?[index]);
                              },
                              child: Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 6.w, vertical: 6.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0.r),
                                ),
                                elevation: 4,
                                color: Colors.white,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0.r),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      FractionallySizedBox(
                                        alignment: Alignment.topCenter,
                                        child: Image.network(
                                          "${controller.likedToModel?.data.likes?[index].likedTo?.profileImg ?? Constants.emtptyImageUrl}",
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
                                                 Radius.circular(15.0.r),
                                            topRight:
                                                 Radius.circular(15.0.r),
                                          ),
                                          child: Container(
                                            width: Get.width,
                                            height: 100.h,
                                            color: Colors.white,
                                            child: Padding(
                                              padding:
                                                   EdgeInsets.all(5.0.w),
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
                                                             EdgeInsets
                                                                    .only(
                                                                left: 8.0.w),
                                                        child: Text(
                                                            "${controller.likedToModel?.data.likes?[index].likedTo?.firstname ?? ""} ${controller.likedToModel?.data.likes?[index].likedTo?.lastname ?? ""}",
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
                                                             EdgeInsets
                                                                    .only(
                                                                right: 5.0.w),
                                                        child: CircleAvatar(
                                                            radius: 5.r,
                                                            backgroundColor:
                                                                Colors.green),
                                                      )
                                                    ],
                                                  ),
                                                  addVerticalSpace(5.h),
                                                  Padding(
                                                    padding:
                                                         EdgeInsets.only(
                                                            left: 8.0.w),
                                                    child: Text(
                                                        "${controller.likedToModel?.data.likes?[index].likedTo?.location ?? ""}",
                                                        style: AppStyles.title2
                                                            .copyWith(
                                                                color:
                                                                    secondaryTextColor)),
                                                  ),
                                                  addVerticalSpace(6.h),
                                                  Padding(
                                                    padding:
                                                         EdgeInsets.only(
                                                            left: 8.0.w),
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
              child: Text("No records found",style: TextStyle(fontSize: 16.sp,color: Colors.black),),
            ),
    );
  }

  loadMore() {}
}
