import 'package:flutter/material.dart';
import 'package:mybudiluhur/components/my_text.dart';

class MyLoadingScreen extends StatelessWidget {
  final String text;
  final String? title;
  const MyLoadingScreen({super.key, required this.text, this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(text: title ?? '', bold: true),
        backgroundColor: Colors.lightBlue[400],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
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
