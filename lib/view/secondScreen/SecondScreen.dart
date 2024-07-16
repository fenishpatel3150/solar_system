import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:solar_system/Controller/PlanetController.dart';
import 'package:solar_system/Controller/likeController.dart';
import 'package:solar_system/view/HomeScreen/componets/Animation.dart';
import 'package:solar_system/view/secondScreen/componets/PlanetData.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        title: Center(
          child: Text(
            '${Provider.of<PlanetProvider>(context).planets[planetindex].name}',
            style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () {
                Provider.of<LikeController>(context,listen: false).addData();
              },
              icon:  Icon(
                CupertinoIcons.heart,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Consumer<PlanetProvider>(
          builder: (BuildContext context, provider, child) {
            return Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/star.jpeg'),
                          fit: BoxFit.cover)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: SizedBox(
                            height: 250,
                            width: 250
                            ,child: animation(provider, planetindex)),
                      ),
                      Text(
                        'Distance From Sun',
                        style: GoogleFonts.fahkwang(color: Colors.white),
                      ),
                      Text(
                        '${provider.planets[planetindex].distanceFromSun}',
                        style: GoogleFonts.poppins(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: height/2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff000000),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(color: Colors.white30, blurRadius: 20),
                      ]
            ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15,top: 20),
                            child: Text(
                              '${provider.planets[planetindex].description}',
                              style: GoogleFonts.varelaRound(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      PlanetData(provider,"${provider.planets[planetindex].averageOrbitalSpeed}km/s",'Average orbital speed',Icons.av_timer,height, width),
                      SizedBox(
                        height: 15,
                      ),
                      PlanetData(provider,"${provider.planets[planetindex].satellites}",'Satellites',Icons.satellite_alt,height,width),
                      SizedBox(
                        height: 15,
                      ),
                      PlanetData(provider,"${provider.planets[planetindex].surfaceArea} km2",'Surface area',Icons.rocket_launch,height,width),
                      SizedBox(
                        height: 15,
                      ),
                      PlanetData(provider,"${provider.planets[planetindex].rotationPeriod}d",'Rotation period',Icons.rotate_right ,height,width),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

}

int planetindex = 0;
