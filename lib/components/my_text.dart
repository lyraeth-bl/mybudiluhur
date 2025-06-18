import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final bool bold;
  final double? textSize;
  const MyText({
    super.key,
    required this.text,
    this.textColor,
    this.bold = false,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontWeight: bold ? FontWeight.bold : null,
        fontSize: textSize,
      ),
    );
  }
}
