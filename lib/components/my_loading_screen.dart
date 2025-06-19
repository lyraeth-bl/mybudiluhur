import 'package:flutter/material.dart';
import 'package:mybudiluhur/components/my_text.dart';

class MyLoadingScreen extends StatelessWidget {
  final String text;
  const MyLoadingScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 10),
            MyText(text: text),
          ],
        ),
      ),
    );
  }
}
