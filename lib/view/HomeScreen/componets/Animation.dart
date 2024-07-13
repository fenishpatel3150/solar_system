import 'package:flutter/material.dart';
import 'package:solar_system/Controller/PlanetController.dart';
import 'package:solar_system/view/HomeScreen/HomeScreen.dart';

Widget animation(PlanetProvider provider,int index) {
  return Padding(
    padding:  EdgeInsets.only(left: 20),
    child: AnimatedBuilder(
      animation: animationController,
      builder: (context,child) {
        return Transform.rotate(
          angle: animationController.value*2 * 3.14,child: child,);
      },
      child: Container(
        height: 110,
        width: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image:AssetImage('${provider.planets[index].image}')),
        ),
      ),
    ),
  );
}