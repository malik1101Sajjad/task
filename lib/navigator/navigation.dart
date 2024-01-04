import 'package:flutter/material.dart';

class NavigationPage extends PageRouteBuilder {
  NavigationPage(
      {required this.child,
      Offset a = const Offset(1, 1),
      Offset b = Offset.zero,
      double t = 0.6,
      Duration duration = const Duration(milliseconds: 600)})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => child,
            transitionDuration: duration,
            reverseTransitionDuration: duration,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
                      position: animation.drive(Tween<Offset>(
                              begin: Offset.lerp(a, b, t), end: Offset.zero)
                          .chain(CurveTween(curve: Curves.easeInOutBack))),
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    ));
  final Widget child;
}
