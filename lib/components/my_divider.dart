import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry height;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  const MyDivider({
    super.key,
    this.padding = const EdgeInsets.symmetric(vertical: 10),
    this.height = const EdgeInsets.symmetric(vertical: 2),
    this.color,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        padding: height,
        decoration: BoxDecoration(color: color, borderRadius: borderRadius),
      ),
    );
  }
}
