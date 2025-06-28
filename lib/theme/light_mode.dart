import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData lightMode = ThemeData(
  /// * Fonts
  fontFamily: "Rubik",

  /// * brighness
  brightness: Brightness.light,

  /// * Theme Text
  textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),

  /// * Background dari [Scaffold], atau bisa juga background dari isi body
  scaffoldBackgroundColor: Colors.white,

  colorScheme: ColorScheme.light(
    /// * Warna utama, biru langit
    /// Colors.lightblue[400]
    primary: Colors.lightBlue.shade400,

    /// * Warna teks diatas warna biru langit
    onPrimary: Colors.white,

    /// * Warna utama kedua, kuning ke orenan
    /// Colors.amber[300]
    secondary: Colors.amber.shade300,

    /// * Warna teks diatas warna kuning ke orenan
    onSecondary: Colors.black,

    /// * Warna teks abu-abu
    /// Colors.grey[700]
    tertiary: Colors.grey.shade700,

    /// * warna merah, biasanya untuk error
    error: Colors.red,

    /// * warna teks diatas warna error
    onError: Colors.white,

    /// * warna teks diatas warna [Scaffold]
    /// Colors.grey[900]
    onSurface: Colors.grey.shade900,

    /// * warna card
    /// Colors.grey[100]
    surface: Colors.grey.shade100,

    /// * warna card
    /// Colors.grey[300]
    onInverseSurface: Colors.grey.shade300,

    /// * warna lightblue
    onTertiary: Color(0xFF78909C),
  ),
);
