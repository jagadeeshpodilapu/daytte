import 'package:daytte/consts/constants.dart';
import 'package:daytte/consts/image_constants.dart';
import 'package:daytte/controllers/profileDetails/profile_details_controller.dart';
import 'package:daytte/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../themes/app_styles.dart';

class ProfileView extends StatelessWidget {
  final user = Get.arguments;

  @override
  Widget build(BuildContext context) {
  //  print("user in profileview ${user.id}");
    return Scaffold(
      backgroundColor: Color(0xffF7F8FA),
      body: GetBuilder<ProfileDetailsController>(
          init: ProfileDetailsController(),
          didChangeDependencies: (state) async {
            await state.controller?.fetchUser(user.id);
            await state.controller?.fetchUserGallery(user.id);
            state.controller?.update();
          },
          builder: (controller) {
            return controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment(0, 2.w),
                              end: Alignment(1.w, 1.w),
                              colors: [
                            const Color(0xffffffff),
                            const Color(0xffe4e6eb)
                          ])),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.red,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                controller.userGalleryModel!.data.galleries!
                                        .isNotEmpty
                                    ? Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "${controller.userGalleryModel?.data.galleries?.first.imgPath ?? ""}"),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          color: Colors.grey,
                                        ),
                                        height: 400.h,
                                      )
                                    : Image.asset(ImageConstants.placeHolder),
                                Positioned(
                                  bottom: -200.h,
                                  left: 0,
                                  right: 0,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width:
                                            (MediaQuery.of(context).size.width /
                                                    1.1)
                                                .w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black26,
                                                  blurRadius: 6)
                                            ]),
                                        child: Padding(
                                          padding: EdgeInsets.all(24.0.w),
                                          child: Column(
                                            children: [
                                              Text(
                                                  "${controller.user?.firstname}${controller.user?.lastname}",
                                                  style: AppStyles.heading4
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w500)),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              Text(
                                                Constants.location,
                                                style: AppStyles.title2
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xff9A9A9A)),
                                              ),
                                              addVerticalSpace(8.h),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 4.0.h),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  8.0.w),
                                                      child: _icons(
                                                          ImageConstants
                                                              .person),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  4.0.w),
                                                      child: Text(
                                                        "${controller.user?.firstname} ${controller.user?.lastname}",
                                                        style: AppStyles.title
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 4.0.h),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  8.0.w),
                                                      child: _icons(
                                                          ImageConstants.age),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  4.0.w),
                                                      child: Text(
                                                        "${controller.user?.age ?? 21} years",
                                                        style: AppStyles.title
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 4.0.h),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  8.0.w),
                                                      child: _icons(
                                                          ImageConstants
                                                              .hobbies),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  4.0.w),
                                                      child: Text(
                                                        Constants.cafe_movies,
                                                        style: AppStyles.title
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 4.0.h),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  8.0.w),
                                                      child: _icons(
                                                          ImageConstants
                                                              .relaxiation),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  4.0.w),
                                                      child: Text(
                                                        Constants
                                                            .singing_dancing,
                                                        style: AppStyles.title
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 4.0.h),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  8.0.w),
                                                      child: _icons(
                                                          ImageConstants.study),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  4.0.w),
                                                      child: Text(
                                                        Constants.bangaloreU,
                                                        style: AppStyles.title
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                _appBar()
                              ],
                            ),
                          ),
                          SizedBox(
                            height: (Get.height * 0.35).h,
                          ),
                          Column(
                            children: [
                              /*Padding(
                                padding: EdgeInsets.symmetric(vertical: 15.0),
                                child: Visibility(
                                  visible: false,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                              const Color(0xFF6d25ba),
                                              const Color(0xffba25b8),
                                            ],
                                            begin: const FractionalOffset(
                                                0.0, 0.0),
                                            end: const FractionalOffset(
                                                1.0, 0.0),
                                            stops: [0.0, 1.0],
                                            tileMode: TileMode.clamp),
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24.0, vertical: 12),
                                      child: Container(
                                          child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 8.0),
                                            child: Icon(
                                              Icons.textsms_outlined,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                          ),
                                          Text("Request to chat",
                                              style: const TextStyle(
                                                  color:
                                                      const Color(0xffffffff),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Muli",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 13.0)),
                                        ],
                                      )),
                                    ),
                                  ),
                                ),
                              ),*/
                              Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  /*Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(0),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 6)
                                        ]),
                                    height: 280,
                                  ),*/
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 24.0.h),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.1)
                                              .w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black26,
                                                    blurRadius: 6)
                                              ]),
                                          child: Padding(
                                            padding: EdgeInsets.all(20.0.w),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 4.0.w,
                                                      vertical: 4.h),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0.w),
                                                    child: Text(
                                                      Constants.photo,
                                                      style: AppStyles.title
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  color: Colors.white,
                                                  height: 200.h,
                                                  child:controller.userGalleryModel
                                                          ?.data
                                                          .galleries
                                                          ?.length !=0? GridView.builder(
                                                      padding: EdgeInsets.zero,
                                                      itemCount: controller
                                                          .userGalleryModel
                                                          ?.data
                                                          .galleries
                                                          ?.length,
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 2,
                                                              crossAxisSpacing:
                                                                  4.0.w,
                                                              childAspectRatio:
                                                                  1,
                                                              mainAxisSpacing:
                                                                  4.0.w),
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0.w),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.r),
                                                            child:
                                                                Image.network(
                                                              "${controller.userGalleryModel?.data.galleries?[index].imgPath}",
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        );
                                                      }):Center(child: Text("Gallery Images Not found"),),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
          }),
    );
  }

  Widget _icons(String src) {
    return SvgPicture.asset(
      src,
      height: 15.h,
      width: 15.w,
    );
  }

  Positioned _appBar() {
    return Positioned(
      top: 20.h,
      left: 10.w,
      right: 10.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                size: 30.w,
                color: Colors.white,
              ))
        ],
      ),
    );
  }

  TextStyle buildTextStyle() => AppStyles.title2.copyWith(
      color: Color(0xFF757e90), fontSize: 16.sp, fontFamily: 'Helvetica');

  RoundedRectangleBorder buildRoundedRectangleBorder() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.r),
    );
  }
}
