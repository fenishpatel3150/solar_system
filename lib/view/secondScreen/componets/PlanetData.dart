
import 'package:flutter/material.dart';
import 'package:solar_system/Controller/PlanetController.dart';

Widget PlanetData(PlanetProvider provider,String data,String name,IconData iconData) {
  return Center(
    child: Container(
      height: 60,
      width: 330,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white10,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              iconData,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 10,
                  color: Colors.white,
                )
              ],
              size: 30,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${data}',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),

        ],
      ),
    ),
  );
}