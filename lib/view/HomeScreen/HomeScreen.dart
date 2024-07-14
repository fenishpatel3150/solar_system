import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:solar_system/Controller/PlanetController.dart';
import 'package:solar_system/view/HomeScreen/componets/Animation.dart';
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
          padding:  EdgeInsets.only(left: 15),
          child: Container(
            height: height/2,
            width: width/5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                  image: AssetImage('assets/image/profile.jpeg')),
            ),
          ),
        ),
        title: Center(
          child: Text(
            'Planets',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              CupertinoIcons.rectangle_grid_2x2_fill,
              color: Colors.white,
              size: 25,
            ),
          )
        ],
      ),
      body: Consumer<PlanetProvider>(
        builder: (BuildContext context, PlanetProvider value, Widget? child) {
          return Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: height/4.2,
                width: width/1.1,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade500,),
                    image: DecorationImage(image: AssetImage('assets/image/banner.jpeg'),fit: BoxFit.cover), borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: Provider.of<PlanetProvider>(context).planets.length,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: height/1.5,
                        width: width/2,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade600),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white10
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5,),
                            GestureDetector(
                                onTap: ()
                                {
                                  Navigator.of(context).push(CustomPageRoute());
                                  planetindex = index;
                                },
                                child: animation(value, index)),
                            SizedBox(height: 10,),
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
                                  child: Text('${value.planets[index].name}',
                                    style: GoogleFonts.roboto(color: Colors.white,
                                        fontSize: 15),),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Text('${value.planets[index].rotationPeriod}',
                                    style: GoogleFonts.roboto(color: Colors.grey,
                                        fontSize: 10),),
                                ),
                              ],
                            ),

                          ],
                        ),

                      ),
                    ),
                ),
              ),

            ],
          );
        },
      ),
    );
  }
}
