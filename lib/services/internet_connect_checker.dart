import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:daytte/view/widgets/no_internet_widget.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class NetworkUtils {
  static StreamSubscription? subscription;
  static Future<Null> Function(ConnectivityResult result)? networkListener;

  /// Method to check Network connectivity.
  static Future<bool> checkNetwork() async {
    bool boolNetConnected = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      boolNetConnected = false;
    } else if (connectivityResult == ConnectivityResult.mobile) {
      boolNetConnected = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      boolNetConnected = true;
    }
    return boolNetConnected;
  }

  static streamSubscribeConnectivityListener() {
    networkListener = (ConnectivityResult result) async {
      switch (result) {
        case ConnectivityResult.wifi:
        case ConnectivityResult.ethernet:
        case ConnectivityResult.mobile:
          break;
        case ConnectivityResult.none:
          await Get.dialog(NoInternetWidget(), barrierDismissible: false);

          await 2.seconds.delay();
          break;
      }
    };
    subscription = Connectivity().onConnectivityChanged.listen(networkListener);
  }

  static cancelNetworkSubscription() async {
    await subscription!.cancel();
  }
}