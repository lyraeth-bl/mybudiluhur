import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final bool bold;
  final double? textSize;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  const MyText({
    super.key,
    required this.text,
    this.textColor,
    this.bold = false,
    this.textSize,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
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
      overflow: textOverflow ?? TextOverflow.ellipsis,
      maxLines: maxLines,
    );
  }
}
