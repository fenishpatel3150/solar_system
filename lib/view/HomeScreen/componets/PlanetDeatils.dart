import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:solar_system/Controller/PlanetController.dart';
import 'package:solar_system/view/HomeScreen/HomeScreen.dart';
import 'package:solar_system/view/HomeScreen/componets/Animation.dart';
import 'package:solar_system/view/secondScreen/SecondScreen.dart';

import '../../secondScreen/componets/animationPageRoute.dart';

Widget Deatils(int index) {
  return Consumer<PlanetProvider>(
    builder: (BuildContext context, provider, child) {
      return Padding(
        padding:  EdgeInsets.all(8.0),
        child: Container(
          height: 200,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.grey.shade800),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: ()
                  {
                    Navigator.of(context).push(CustomPageRoute());
                    planetindex = index;
                  },
                  child: animation(provider, index)),

              Divider(
                color: Colors.white,
                thickness: 0.2,
                indent: 15,
                endIndent: 15,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text('${provider.planets[index].name}',
                      style: GoogleFonts.roboto(color: Colors.white,
                          fontSize: 15),),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text('${provider.planets[index].rotationPeriod}',
                      style: GoogleFonts.roboto(color: Colors.grey,
                          fontSize: 10),),
                  ),
                ],
              ),

            ],
          ),

        ),
      );

    },
  );
}





