import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:mybudiluhur/components/my_text.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(List<ConnectivityResult> connectivityResults) {
    final isDarkMode = Get.theme.brightness == Brightness.dark;

    if (connectivityResults.every(
      (result) => result == ConnectivityResult.none,
    )) {
      Get.rawSnackbar(
        messageText: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              LucideIcons.wifiOff,
              color: isDarkMode ? Colors.white : Colors.black,
              size: 20.r,
            ),
            SizedBox(width: 8.w),
            MyText(
              text: "No Internet Connection",
              textColor: isDarkMode ? Colors.white : Colors.black,
              textSize: 14.r,
            ),
          ],
        ),
        isDismissible: true,
        duration: const Duration(days: 1),
        backgroundColor: isDarkMode ? Colors.grey[800]! : Colors.grey[200]!,
        margin: EdgeInsets.only(top: 42.h),
        borderRadius: 10.r,
        snackPosition: SnackPosition.TOP,
        animationDuration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
        // Tambahkan notifikasi singkat ketika koneksi kembali
        Get.rawSnackbar(
          messageText: Center(
            child: MyText(
              text: "Internet Connected",
              textColor: isDarkMode ? Colors.white : Colors.black,
              textSize: 14.r,
            ),
          ),
          duration: const Duration(seconds: 3),
          backgroundColor: isDarkMode ? Colors.green[800]! : Colors.green[200]!,
          margin: EdgeInsets.only(top: 42.h),
          borderRadius: 10.r,
          snackPosition: SnackPosition.TOP,
        );
      }
    }
  }
}
