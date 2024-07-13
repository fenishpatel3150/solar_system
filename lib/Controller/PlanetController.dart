import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solar_system/model/DataModle.dart';


class PlanetProvider with ChangeNotifier {
  List<Planet> _planets = [];
  List<Planet> get planets => _planets;


  PlanetProvider()
  {
    fetchPlanets();
  }

  Future<void> fetchPlanets() async {
    String response = await rootBundle.loadString('assets/planets.json');
    final List data = json.decode(response);
    print(data);
    _planets = data.map((json) => Planet.fromJson(json)).toList();
    notifyListeners();
  }
}
