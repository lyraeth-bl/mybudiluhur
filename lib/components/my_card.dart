import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Color? borderColor;
  final EdgeInsetsGeometry padding;
  final double? width;
  final double? height;
  const MyCard({
    super.key,
    required this.child,
    this.color,
    this.padding = const EdgeInsets.symmetric(horizontal: 15),
    this.borderColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(10).r,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor ?? Colors.black87),
          borderRadius: BorderRadius.circular(12).r,
        ),
        child: child,
      ),
    );
  }
}
