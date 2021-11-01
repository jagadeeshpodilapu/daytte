import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controllers/premiumpackageController/premium_package_controller.dart';
import '../../../utils/common_functions.dart';
import '../../screens/matchscreen/match_screen.dart';
import '../../widgets/button_widget.dart';

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
              height: 250,
              width: Get.width,
              child: PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.selectedPageIndex,
                itemCount: _controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color(0xFF3c0fc7),
                          Color(0xFFc86dd7),
                        ],
                      ),
                    ),
                    child: Column(
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
              top: 220,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _controller.onboardingPages.length,
                      (index) => Obx(() {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: _controller.selectedPageIndex.value == index
                            ? Colors.white
                            : Colors.black,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
              ),
            ),
            Positioned(
              left: 5,
              right: 5,
              top: 240,
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
                            ? Color(0xFFfe4b6b)
                            : Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                _controller.premiums[index].isPopular
                                    ? "Popular"
                                    : '',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: _controller.selectedPremiumType.value ==
                                    index
                                    ? 120
                                    : 105,
                                width: Get.width * 0.228,
                                color: _controller.selectedPremiumType.value ==
                                    index
                                    ? Color(0xFFffe8ec)
                                    : Colors.white,
                                child: Column(
                                  children: [
                                    Text(
                                      _controller.premiums[index].months,
                                      textAlign: TextAlign.center,
                                      style: offerTextStyle(index, 50),
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
                                        style: offerTextStyle(index, 18)
                                            .copyWith(
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
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
            Align(
              alignment: Alignment(0, 0.67).add(Alignment.center),
              child: Container(
                height: 50,
                child: ButtonWidget(
                  action: () => showDialog(
                      context: context, builder: (context) => MatchScreen()),
                  buttonTitle: "Continue",
                ),
              ),
            ),
            Align(
                alignment: Alignment(0, 0.8).add(Alignment.center),
                child: GestureDetector(
                  onTap: () => onBackPressed(),
                  child: Text(
                    "NO, THANKS",
                    style: TextStyle(fontSize: 20, color: Color(0xFFb1bacc)),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  TextStyle offerTextStyle(int index, double fontSize) {
    return TextStyle(
        color: _controller.selectedPremiumType.value == index
            ? Color(0xFFfe4b6b)
            : Colors.black,
        fontSize: fontSize);
  }
}
