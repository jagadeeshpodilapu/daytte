import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';

import '../../model/premium_offer_model.dart';
import '../../model/premium_package_model.dart';

class PremiumPackageController extends GetxController {
  var selectedPageIndex = 0.obs;
  var selectedPremiumType = 1.obs;

  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      //go to home page
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<PremiumPackageModel> onboardingPages = [
    PremiumPackageModel('assets/images/platinum.svg', 'Platinum Package',
        'Lorem Ipsum is simply dummy text of the printing typesetting industry. ... will be distracted by the readable'),
    PremiumPackageModel('assets/images/gold.svg', 'Gold Package',
        'Lorem Ipsum is simply dummy text of the printing typesetting industry. ... will be distracted by the readable'),
    PremiumPackageModel('assets/images/silver.svg', 'Silver Package',
        'Lorem Ipsum is simply dummy text of the printing typesetting industry. ... will be distracted by the readable')
  ];
  List<PremiumOfferModel> premiums = [
    PremiumOfferModel(false, "10", 'Boosts', '\$130/mo'),
    PremiumOfferModel(true, "6", 'Months', '\$329/mo'),
    PremiumOfferModel(false, "1", 'Month', '\$760/mo'),
  ];
}
