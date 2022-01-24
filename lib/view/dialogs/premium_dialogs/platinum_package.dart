import 'package:daytte/themes/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controllers/premiumpackageController/premium_package_controller.dart';
import '../../screens/matchscreen/match_screen.dart';
import '../../widgets/button_widget.dart';

class CheckTest extends StatelessWidget {
  const CheckTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: RaisedGradientButton(
        onPressed: () => Get.dialog(
          Dialog(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: PremiumPackages()),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          ),
        ),
        title: 'test',
      )),
    );
  }
}

class PremiumPackages extends StatelessWidget {
  final _controller = PremiumPackageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 260,
              width: Get.width,
              child: PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.selectedPageIndex,
                itemCount: _controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: <Color>[
                          Color(0xFF7004E3),
                          Color(0xFF8511E6),
                          Color(0xFF9A1EE9),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 4),
                          child: Text(
                            _controller.onboardingPages[index].title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SvgPicture.asset(
                              _controller.onboardingPages[index].imageAsset),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(
                            _controller.onboardingPages[index].description,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Positioned(
              left: 10,
              top: 210,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _controller.onboardingPages.length,
                  (index) => Obx(() {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                          color: _controller.selectedPageIndex.value == index
                              ? Colors.white
                              : Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white)),
                    );
                  }),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 240,
              child: Container(
                color: backgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => Obx(
                      () => GestureDetector(
                        onTap: () {
                          _controller.selectedPremiumType.value = index;
                        },
                        child: Card(
                          elevation: 0.0,
                          color: _controller.selectedPremiumType.value == index
                              ? whiteColor
                              : backgroundColor,
                          child: Column(
                            children: [
                            
                              Container(
                                height: _controller.selectedPremiumType.value ==
                                        index
                                    ? 130
                                    : 115,
                                width: Get.width * 0.25,
                                
                                decoration:BoxDecoration(
                                  border: Border.all(color: _controller.selectedPremiumType.value ==
                                        index? primaryColor:backgroundColor,width:3)
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      _controller.premiums[index].months,
                                      textAlign: TextAlign.center,
                                      style: offerTextStyle(index, 50).copyWith(fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      _controller.premiums[index].offerType,
                                      textAlign: TextAlign.center,
                                      style: offerTextStyle(index, 16),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        _controller
                                            .premiums[index].purchaseAmount,
                                        style: offerTextStyle(index, 20)
                                            .copyWith(
                                                fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.67).add(Alignment.center),
              child: Container(
                height: 50,
                child: RaisedGradientButton(
                  width: Get.width*0.8,
                  onPressed: () => Get.back(),
                  title: "Continue",
                ),
              ),
            ),
            /* Align(
                alignment: Alignment(0, 0.8).add(Alignment.center),
                child: GestureDetector(
                  onTap: () => onBackPressed(),
                  child: Text(
                    "NO, THANKS",
                    style: TextStyle(fontSize: 20, color: Color(0xFFb1bacc)),
                  ),
                )) */
          ],
        ),
      ),
    );
  }

  TextStyle offerTextStyle(int index, double fontSize) {
    return TextStyle(
        color: _controller.selectedPremiumType.value == index
            ? Color(0xFF7004E3)
            : Color(0xff9a9a9a),
        fontSize: fontSize);
  }
}
