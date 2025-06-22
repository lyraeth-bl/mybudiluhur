import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Color? borderColor;
  final EdgeInsetsGeometry padding;
  const MyCard({
    super.key,
    required this.child,
    this.color,
    this.padding = const EdgeInsets.symmetric(horizontal: 15),
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor ?? Colors.black87),
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
      ),
    );
  }
}
