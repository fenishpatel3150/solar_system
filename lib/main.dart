import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar_system/Controller/PlanetController.dart';
import 'package:solar_system/Controller/likeController.dart';
import 'package:solar_system/view/HomeScreen/HomeScreen.dart';
import 'package:solar_system/view/SplashScreen/SplashScreen.dart';

void main() {
  runApp(MultiProvider(providers: [),
    ChangeNotifierProvider(create: (context) => PlanetProvider(),
    )
  ],child: const MyApp(),),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

