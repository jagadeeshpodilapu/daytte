import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.wifi_off_outlined),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Text(
                'NO INTERNET CONNECTION',
                style: TextStyle(
                    color: Colors.orange, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Text(
                'You don\'t have internet connection, continue offline mode?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              TextButton(
                child: Container(
                  width: Get.width,
                  alignment: Alignment.center,
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.orange),
                ),
                onPressed: null,
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              TextButton(
                child: Container(
                  width: Get.width,
                  alignment: Alignment.center,
                  child: Text(
                    'CANCEL',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                onPressed: () => Get.back(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
