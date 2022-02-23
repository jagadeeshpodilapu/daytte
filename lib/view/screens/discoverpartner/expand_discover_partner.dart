
import 'package:daytte/consts/constants.dart';
import 'package:daytte/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../consts/image_constants.dart';
import '../../../model/find_nearest_model.dart';
import '../../widgets/common_widgets.dart';

class ExpandPartnerDetails extends StatelessWidget {
  final User user = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "img",
      child: Scaffold(
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white12,
              expandedHeight: 350.0.h,
              flexibleSpace: FlexibleSpaceBar(
                background:user.profileImg?.imgPath !=null ? Image.network('${user.profileImg?.imgPath}',
                    fit: BoxFit.cover):Image.asset(ImageConstants.placeHolder, fit: BoxFit.cover),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                addVerticalSpace(10.h),
                _userNameWidget(),
                addVerticalSpace(10.h),
                _infoWidget(Icons.business_center,
                    "${user.institute ?? "Wildlife Photographer"}"),
                addVerticalSpace(5.h),
                _infoWidget(Icons.location_city_rounded, "Lives in New York"),
                addVerticalSpace(5.h),
                _infoWidget(Icons.person, "${user.gender}"),
                addVerticalSpace(5.h),
                _infoWidget(Icons.location_on, "2Km away"),
                _aboutmeText("About Me"),
                _aboutmeInfoWidget(),
                addVerticalSpace(20.h),
                _divider,
                addVerticalSpace(20.h),
                _aboutmeText("Passions"),
                _passionListWidget(),
                addVerticalSpace(20.h),
                _divider,
                addVerticalSpace(20.h),
                _shareProfileWidget(),
                _shareWidgetSub(),
                addVerticalSpace(20.h),
                _divider,
                addVerticalSpace(20.h),
                _reportProfileWidget(),
                addVerticalSpace(20.h),
                _divider,
                addVerticalSpace(40.h),
                _setIconsWidget(),
                addVerticalSpace(30.h),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _reportProfileWidget() {
    return Text(
      "REPORT  ${user.firstname} ${user.lastname}",
      textAlign: TextAlign.center,
      style: AppStyles.title
          .copyWith(color: Color(0xff9a9a9a), fontWeight: FontWeight.w400),
    );
  }

  Widget _shareWidgetSub() {
    return Center(
        child: Text(
      Constants.friendThinks,
      style: AppStyles.title
          .copyWith(color: Color(0xff7004E3), fontWeight: FontWeight.w400),
    ));
  }

  Widget _shareProfileWidget() {
    return Center(
        child: Text(
      "Share  ${user.firstname} ${user.lastname}",
      style: AppStyles.heading3
          .copyWith(color: Color(0xff7004E3), fontWeight: FontWeight.w500),
    ));
  }

  Widget _setIconsWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _tinderIcons(ImageConstants.ic_rewind),
        addHorizontalSpace(50.w),
        _tinderIcons(ImageConstants.ic_love),
        addHorizontalSpace(50.w),
        _tinderIcons(ImageConstants.ic_close),
      ],
    );
  }

  Widget _tinderIcons(String icon) {
    return Container(
      height: 50.h,
      width: 50.w,
      child: MaterialButton(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
          side: BorderSide(color: Colors.white),
        ),
        padding: EdgeInsets.all(8.w),
        onPressed: () {
          if (icon == ImageConstants.ic_rewind) {
            // controller.matchEngine?.currentItem?.nope();
          } else if (icon == ImageConstants.ic_love) {
            //  controller.matchEngine?.currentItem?.like();
          } else if (icon == ImageConstants.ic_close) {
            // controller.matchEngine?.currentItem?.superLike();
          }
        },
        child: Image.asset(
          icon,
          height: icon == ImageConstants.ic_close ? 24.h : 30.h,
          width: icon == ImageConstants.ic_close ? 24.w : 30.w,
        ),
      ),
    );
  }

  Widget _passionListWidget() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 12.w),
      child: Wrap(
        runSpacing: 5,
        children: List.generate(
            user.passion?.length ?? 0,
            (index) => Padding(
                  padding:  EdgeInsets.all(8.0.w),
                  child: Container(
                    padding:  EdgeInsets.all(10.0.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: Color(0xff7004E3), width: 2.w)),
                    child: Text("${user.passion?[index].name}",
                        style: AppStyles.title2.copyWith(
                            color: Color(0xff7004E3),
                            fontWeight: FontWeight.w400)),
                  ),
                )),
      ),
    );
  }

  Padding _aboutmeInfoWidget() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 14.w, vertical: 3.h),
      child: Text(
        "${user.shortDescription}",
        style: AppStyles.title.copyWith(
          fontWeight: FontWeight.w400,
          color: Color(0xff9a9a9a),
        ),
      ),
    );
  }

  Container get _divider => Container(
        height: 2,
        color: Colors.grey,
        margin: EdgeInsets.symmetric(horizontal: 24),
      );

  Align _aboutmeText(String text) {
    return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 10.h),
          child: Text(text,
              style: AppStyles.heading3.copyWith(fontWeight: FontWeight.w500)),
        ));
  }

  Widget _infoWidget(IconData src, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Icon(src, color: Colors.grey),
        ),
        addHorizontalSpace(10.w),
        Text(
          text,
          style: AppStyles.title
              .copyWith(color: Color(0xFF9A9A9A), fontWeight: FontWeight.w400),
        )
      ],
    );
  }

  Widget _userNameWidget() {
    var age = user.age.toString().split(" ");
    return Align(
        alignment: Alignment.topCenter,
        child: Text(
          "${user.firstname} ${user.lastname} ${age.first}",
          style: AppStyles.title
              .copyWith(color: Color(0xFF9A9A9A), fontWeight: FontWeight.w400),
        ));
  }
}
