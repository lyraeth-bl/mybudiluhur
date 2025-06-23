import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybudiluhur/components/my_text.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(List<ConnectivityResult> connectivityResults) {
    // Check if all connections are 'none'
    if (connectivityResults.every(
      (result) => result == ConnectivityResult.none,
    )) {
      Get.rawSnackbar(
        messageText: const MyText(
          text: "No Internet! :(",
          textColor: Colors.white,
          textSize: 20,
        ),
        isDismissible: false,
        duration: const Duration(days: 1),
        icon: const Icon(Icons.wifi_off, color: Colors.white, size: 40),
        margin: EdgeInsets.zero,
        snackStyle: SnackStyle.FLOATING,
        backgroundGradient: LinearGradient(
          colors: [Color(0xFFFF1744), Colors.redAccent, Color(0xFFFF8A80)],
        ),
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
