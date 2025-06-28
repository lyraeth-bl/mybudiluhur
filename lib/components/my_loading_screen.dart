import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybudiluhur/components/my_text.dart';

class MyLoadingScreen extends StatelessWidget {
  final String text;
  final String? title;
  const MyLoadingScreen({super.key, required this.text, this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(text: title ?? '', bold: true, textSize: 20.r),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 10.h),
            MyText(text: text, textSize: 14.r),
          ],
        ),
      ),
    );
  }
}
