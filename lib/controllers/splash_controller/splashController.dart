import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:daytte/routes/app_routes.dart';
import 'package:daytte/services/notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends BaseController {
  final storage = GetStorage();
  @override
  void onInit() {
    storage.writeIfNull("page", "0");
    storage.writeIfNull("isLogged", false);
    storage.writeIfNull("page", 0);
    LocalNotificationService.initialize();

    ///gives you the message on which user taps
    ///and it opened the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        print('on getInitial Data ${message.data}');
      }
    });

    ///foreground work
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print('on message Data ${message.data}');
        LocalNotificationService.display(message);
      }
    });

    ///When the app is in background but opened and user taps
    ///on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('on MessageOpen Data ${message.data}');
    });
    super.onInit();
  }

  void gotoPage() {
    final String pageNumber;
    if (storage.read("isLogged")) {
      pageNumber = '8';
    } else {
      pageNumber = storage.read('page');
    }
    switch (pageNumber) {
      case '0':
        Get.offAndToNamed(AppRoutes.LOGINVIEW);
        break;
      case '1':
        Get.offAndToNamed(AppRoutes.SIGNUPVIEW);
        break;
      case '2':
        Get.offAndToNamed(AppRoutes.CHOOSEGENDER);
        break;
      case '3':
        Get.offAndToNamed(AppRoutes.PASSION);
        break;
      case '4':
        Get.offAndToNamed(AppRoutes.UNIVERSITY);
        break;
      case '5':
        Get.offAndToNamed(AppRoutes.INTERESTED);
        break;
      case '6':
        Get.offAndToNamed(AppRoutes.ABOUTVIEW);
        break;
      case '7':
        Get.offAndToNamed(AppRoutes.EDITDETAILS);
        break;
      case '8':
        Get.offAndToNamed(AppRoutes.HOMEVIEW);
        break;
      default:
        Get.offAndToNamed(AppRoutes.LOGINVIEW);
        break;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
