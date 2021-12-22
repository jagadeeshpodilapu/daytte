import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static void initialize() {
    final IOSInitializationSettings initializationSettingsIOS =
    IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      // onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    //initialize the notifications based on PlatformSpecifications
    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"),
        iOS: initializationSettingsIOS);

    _notificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
          print('payload:$payload');
          if (payload != null) {
            //   Get.to(() =>
            //       CommonBGScreen(screenWidget: PendingJobs(), text: 'Pending Jobs'),);
            // }
          }}
    );
  }

  static void display(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      const NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
            "wst_channel",
            "wst channel",
            //"this is our channel",
            importance: Importance.max,
            priority: Priority.high,
          ),
          iOS: IOSNotificationDetails()
      );

      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data["route"],
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}