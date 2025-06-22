import 'package:flutter/material.dart';

enum PageTransitionDirection { left, right, top, bottom }

class MyPageTransition extends StatelessWidget {
  final Widget destination;
  final Widget? child;
  final PageTransitionDirection direction;

  const MyPageTransition._({
    super.key,
    required this.destination,
    this.child,
    required this.direction,
  });

  // Factory untuk ke kiri
  factory MyPageTransition.left({
    Key? key,
    required Widget destination,
    Widget? child,
  }) {
    return MyPageTransition._(
      key: key,
      destination: destination,
      direction: PageTransitionDirection.left,
      child: child,
    );
  }

  // Factory untuk ke kanan
  factory MyPageTransition.right({
    Key? key,
    required Widget destination,
    Widget? child,
  }) {
    return MyPageTransition._(
      key: key,
      destination: destination,
      direction: PageTransitionDirection.right,
      child: child,
    );
  }

  // Factory untuk ke atas
  factory MyPageTransition.top({
    Key? key,
    required Widget destination,
    Widget? child,
  }) {
    return MyPageTransition._(
      key: key,
      destination: destination,
      direction: PageTransitionDirection.top,
      child: child,
    );
  }

  // Factory untuk ke bawah
  factory MyPageTransition.bottom({
    Key? key,
    required Widget destination,
    Widget? child,
  }) {
    return MyPageTransition._(
      key: key,
      destination: destination,
      direction: PageTransitionDirection.bottom,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (direction == PageTransitionDirection.left ||
            direction == PageTransitionDirection.right) {
          Navigator.of(context).push(_createRouteLR());
        } else {
          Navigator.of(context).push(_createRouteTB());
        }
      },
      child: child,
    );
  }

  Route _createRouteLR() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => destination,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final beginOffset = direction == PageTransitionDirection.left
            ? const Offset(1.0, 0.0)
            : const Offset(-1.0, 0.0);
        final endOffset = Offset.zero;
        final tween = Tween(
          begin: beginOffset,
          end: endOffset,
        ).chain(CurveTween(curve: Curves.ease));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  Route _createRouteTB() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => destination,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final beginOffset = direction == PageTransitionDirection.top
            ? const Offset(0.0, 1.0)
            : const Offset(0.0, -1.0);
        final endOffset = Offset.zero;
        final tween = Tween(
          begin: beginOffset,
          end: endOffset,
        ).chain(CurveTween(curve: Curves.ease));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }
}
