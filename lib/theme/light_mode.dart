import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData lightMode = ThemeData(
  // Fonts
  fontFamily: "Rubik",

  // brighness
  brightness: Brightness.light,

  // Theme Text
  textTheme: Typography.englishLike2021.apply(fontSizeFactor: 1.sp),

  // Background dari [Scaffold], atau bisa juga background dari isi body
  scaffoldBackgroundColor: Colors.white,

  colorScheme: ColorScheme.light(
    // Warna utama, biru langit
    primary: Color(0xFF29B6F6),

    // Warna teks diatas warna biru langit
    onPrimary: Colors.white,

    // Warna utama kedua, kuning ke orenan
    secondary: Color(0xFFFFD54F),

    // Warna teks diatas warna kuning ke orenan
    onSecondary: Colors.black,

    // Warna teks abu-abu
    tertiary: Color(0xFF616161),

    // warna merah, biasanya untuk error
    error: Colors.red,
  ),
);
