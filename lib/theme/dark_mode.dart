import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData darkMode = ThemeData(
  /// * Fonts
  fontFamily: "Rubik",

  /// * brightness
  brightness: Brightness.dark,

  /// * Theme Text
  textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),

  /// * Background dari [Scaffold], atau bisa juga background dari isi body
  scaffoldBackgroundColor: Colors.black,

  colorScheme: ColorScheme.dark(
    /// * Warna utama, biru langit (lebih gelap dari light mode)
    primary: Colors
        .lightBlue
        .shade800, // Versi lebih gelap dari Colors.lightBlue[400]
    /// * Warna teks diatas warna biru langit
    onPrimary: Colors.white,

    /// * Warna utama kedua, kuning ke orenan (lebih gelap dari light mode)
    secondary:
        Colors.amber.shade600, // Versi lebih gelap dari Colors.amber[300]
    /// * Warna teks diatas warna kuning ke orenan
    onSecondary: Colors.black,

    /// * Warna teks abu-abu (lebih terang di dark mode)
    tertiary: Colors.grey, // Colors.grey[500]
    /// * warna merah, biasanya untuk error
    error: Color(0xFFCF6679), // Warna error yang lebih cocok untuk dark mode
    /// * warna teks diatas warna error
    onError: Colors.black,

    /// * warna teks diatas warna [Scaffold]
    onSurface: Colors.grey.shade300, // Colors.grey[300]
    /// * warna card (lebih gelap dari light mode)
    surface: Color(0xFF1E1E1E),

    /// * warna card secondary
    onInverseSurface: Color(0xFF2D2D2D),

    /// * warna lightblue untuk dark mode
    onTertiary: Colors.grey.shade600, // Colors.blueGrey[600]
  ),
);
