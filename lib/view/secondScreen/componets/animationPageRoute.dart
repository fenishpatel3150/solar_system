import 'package:flutter/material.dart';
import 'package:solar_system/view/secondScreen/SecondScreen.dart';

class CustomPageRoute extends PageRouteBuilder {
  CustomPageRoute()
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
        SecondScreen(), // Replace with your destination widget

    transitionDuration: Duration(milliseconds: 1000),

    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) {
      // Define forward animation
      Animation<Offset> forwardAnimation = Tween<Offset>(
        begin: Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation);

      // Define reverse animation
      Animation<Offset> reverseAnimation = Tween<Offset>(
        begin: Offset(-1.0, 0.0),
        end: Offset.zero,
      ).animate(animation);

      return SlideTransition(
        position: animation.status == AnimationStatus.reverse
            ? reverseAnimation
            : forwardAnimation,
        child: child,
      );
    },
  );
}