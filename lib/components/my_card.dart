import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  const MyCard({super.key, required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          border: BoxBorder.all(color: Colors.black87),
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
      ),
    );
  }
}
