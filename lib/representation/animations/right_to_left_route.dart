import 'package:flutter/material.dart';

class RightToLeftRoute extends PageRouteBuilder {
  final Widget page;
  RightToLeftRoute({required this.page})
      : super(
    transitionDuration: const Duration(microseconds: 600),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeIn;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}