import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:galaxy_planet_app/screen/home/model/home_model.dart';

class JsonHelper {
  static JsonHelper helper = JsonHelper._();
  JsonHelper._();
  Future<List<PlanetModel>> getPlanetData() async {
    String jsonString = await rootBundle.loadString("assets/json/planet.json");
    List json = jsonDecode(jsonString);
    List<PlanetModel> list =
        json.map((e) => PlanetModel.mapToModel(e)).toList();
    return list;
  }
}
