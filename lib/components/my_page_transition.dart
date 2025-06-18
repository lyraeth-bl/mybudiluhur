import 'package:flutter/material.dart';

enum PageTransitionDirection { left, right }

class MyPageTransition extends StatelessWidget {
  final Widget destination;
  final Widget child;
  final PageTransitionDirection direction;

  const MyPageTransition._({
    super.key,
    required this.destination,
    required this.child,
    required this.direction,
  });

  // Factory untuk ke kiri
  factory MyPageTransition.left({
    Key? key,
    required Widget destination,
    required Widget child,
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
    required Widget child,
  }) {
    return MyPageTransition._(
      key: key,
      destination: destination,
      direction: PageTransitionDirection.right,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(_createRoute());
      },
      child: child,
    );
  }

  Route _createRoute() {
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
}
