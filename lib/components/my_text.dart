import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final bool bold;
  final double? textSize;
  final TextAlign? textAlign;
  const MyText({
    super.key,
    required this.text,
    this.textColor,
    this.bold = false,
    this.textSize,
    this.textAlign,
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
      textAlign: textAlign,
    );
  }
}
