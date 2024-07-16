import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:solar_system/Controller/PlanetController.dart';
import 'package:solar_system/view/HomeScreen/componets/Animation.dart';
import 'package:solar_system/view/favorite/FavoriteScreen.dart';
import 'package:solar_system/view/secondScreen/SecondScreen.dart';
import 'package:solar_system/view/secondScreen/componets/animationPageRoute.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

late AnimationController animationController;

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 10000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      appBar: AppBar(
        backgroundColor: const Color(0xff000000),
        leading: Padding(
          padding: EdgeInsets.only(left: 15),
          child: Container(
            height: height / 2,
            width: width / 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                  image: AssetImage('assets/image/profile.jpeg')),
            ),
          ),
        ),
        title: Text(
          'Hey ! ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              CupertinoIcons.search,
              color: Colors.white,
              size: 25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(CustomPageRoutelike());
              },
              icon: Icon(
                CupertinoIcons.heart,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      body: Consumer<PlanetProvider>(
        builder: (BuildContext context, PlanetProvider value, Widget? child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    'Your personal       ',
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.w200),
                  ),
                  Row(
                    children: [
                      Text(
                        ' guide',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.w200),
                      ),
                      Text(
                        ' to the',
                        style: GoogleFonts.roboto(
                            color: Colors.grey,
                            fontSize: 45,
                            fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                  Text(
                    'universe                ',
                    style: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 45,
                        fontWeight: FontWeight.w200),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount:
                      Provider.of<PlanetProvider>(context).planets.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 250,
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                // border: Border.all(color: Colors.grey),
                              ),
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(CustomPageRoute());
                                    planetindex = index;
                                  },
                                  child: animation(value, index)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 5),
                              child: Text(
                                '${value.planets[index].name}',
                                style: GoogleFonts.roboto(
                                    color: Colors.white, fontSize: 22),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                '${value.planets[index].description}',
                                style: GoogleFonts.roboto(
                                    color: Colors.grey, fontSize: 8),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Divider(
                    color: Colors.grey.shade800,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Distance from sun',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Spacer(),
                      Text(
                        '${value.planets[planetindex].distanceFromSun}',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey.shade800,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'moons',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Spacer(),
                      Text(
                        '${value.planets[planetindex].moons}',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey.shade800,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'average orbital speed',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Spacer(),
                      Text(
                        '${value.planets[planetindex].averageOrbitalSpeed}',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey.shade800,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'satellites',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Spacer(),
                      Text(
                        '${value.planets[planetindex].satellites}',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
