import 'package:flutter/material.dart';
import 'package:solar_system/Controller/PlanetController.dart';
import 'package:solar_system/view/HomeScreen/HomeScreen.dart';

Widget animation(PlanetProvider provider,int index) {
  return Padding(
    padding:  EdgeInsets.only(left: 30),
    child: AnimatedBuilder(
      animation: animationController,
      builder: (context,child) {
        return Transform.rotate(
          angle: animationController.value*2 * 3.14,child: child,);
      },
       child: SizedBox(
           height: 90,
           width: 90,
           child: Image.asset('${provider.planets[index].image}')),
    ),
  );
}