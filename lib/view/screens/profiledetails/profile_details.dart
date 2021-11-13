import 'package:daytte/controllers/profileDetails/profile_details_controller.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../consts/image_constants.dart';
import '../../../themes/app_styles.dart';

class ProfileView extends StatelessWidget {
  final userId = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment(0, 2),
                  end: Alignment(1, 1),
                  colors: [const Color(0xffffffff), const Color(0xffe4e6eb)])),
          child: GetBuilder<ProfileDetailsController>(
              init: ProfileDetailsController(),
              didChangeDependencies: (state) async {
                await state.controller?.fetchUser(userId);
                await state.controller?.fetchUserGallery(userId);
              },
              builder: (controller) {
                return Column(
                  children: [
                    Container(
                      color: Colors.red,
                      child: controller.isLoading.value
                          ? CircularProgressIndicator()
                          : Stack(
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
                                        height: 400,
                                      )
                                    : SizedBox(),
                                Positioned(
                                  bottom: -250,
                                  left: 0,
                                  right: 0,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.1,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black26,
                                                  blurRadius: 6)
                                            ]),
                                        child: Padding(
                                          padding: const EdgeInsets.all(24.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                "${controller.user?.firstname}${controller.user?.lastname}",
                                                style: AppStyles.subHeading
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily: 'SFPro',
                                                        color:
                                                            Color(0xFF363636)),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                "Bangalore - INDIA",
                                                style: buildTextStyle(),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 4.0),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0),
                                                      child:
                                                          Icon(EvaIcons.person),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 4.0),
                                                      child: Text(
                                                        "${controller.user?.firstname}",
                                                        style: buildTextStyle(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 4.0),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0),
                                                      child:
                                                          Icon(EvaIcons.person),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 4.0),
                                                      child: Text(
                                                        "${controller.user?.lastname}",
                                                        style: buildTextStyle(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 4.0),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0),
                                                      child: Image.asset(
                                                        ImageConstants.ic_age,
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 4.0),
                                                      child: Text(
                                                        "${controller.user?.age}",
                                                        style: buildTextStyle(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 4.0),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0),
                                                      child: Icon(
                                                          EvaIcons.bookOpen),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 4.0),
                                                      child: Text(
                                                        "Cafe , Movies",
                                                        style: buildTextStyle(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 4.0),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0),
                                                      child: Icon(Icons
                                                          .music_note_rounded),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 4.0),
                                                      child: Text(
                                                        "Singing, Dancing",
                                                        style: buildTextStyle(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 4.0),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0),
                                                      child: Icon(Icons.school),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 4.0),
                                                      child: Text(
                                                        "Bangalore university",
                                                        style: buildTextStyle(),
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
                              ],
                            ),
                    ),
                    SizedBox(
                      height: 260,
                    ),
                    Column(
                      children: [
                        Padding(
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
                                      begin: const FractionalOffset(0.0, 0.0),
                                      end: const FractionalOffset(1.0, 0.0),
                                      stops: [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 12),
                                child: Container(
                                    child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(
                                        Icons.textsms_outlined,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    ),
                                    Text("Request to chat",
                                        style: const TextStyle(
                                            color: const Color(0xffffffff),
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Muli",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 13.0)),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ),
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26, blurRadius: 6)
                                  ]),
                              height: 280,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 24.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 6)
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 4.0),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 4.0,
                                                      vertical: 8),
                                                  child: Text(
                                                    "Photo",
                                                    style: const TextStyle(
                                                        color: const Color(
                                                            0xff363636),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontFamily: "Muli",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 18.0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 4.0),
                                                child: controller
                                                        .userGalleryModel!
                                                        .data
                                                        .galleries!
                                                        .isNotEmpty
                                                    ? Container(
                                                        height: 200,
                                                        decoration:
                                                            BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  "${controller.userGalleryModel?.data.galleries?.first.imgPath}"),
                                                              fit:
                                                                  BoxFit.cover),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Colors.orange,
                                                        ),
                                                      )
                                                    : SizedBox(
                                                        height: 200,
                                                      ),
                                              )),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4.0),
                                                  child: Container(
                                                    height: 200,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              "https://wallup.net/wp-content/uploads/2016/05/13/334355-people-model-fashion-forest-dress-portrait.jpg"),
                                                          fit: BoxFit.cover),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
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
                );
              }),
        ),
      ),
    );
  }

  TextStyle buildTextStyle() => AppStyles.title2.copyWith(
      color: Color(0xFF757e90), fontSize: 16, fontFamily: 'Helvetica');

  RoundedRectangleBorder buildRoundedRectangleBorder() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    );
  }
}
