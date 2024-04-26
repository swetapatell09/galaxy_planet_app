import 'package:flutter/material.dart';
import 'package:galaxy_planet_app/screen/home/model/home_model.dart';
import 'package:galaxy_planet_app/utils/json_helper.dart';

class HomeProvider with ChangeNotifier {
  List<PlanetModel> list = [];
  bool theme = false;
  ThemeMode mode = ThemeMode.light;
  bool isLight = true;
  bool isTheme = false;
  IconData themeMode = Icons.dark_mode;
  void getData() async {
    List<PlanetModel> l1 = await JsonHelper.helper.getPlanetData();
    if (l1 != null) {
      list = l1;
      notifyListeners();
    }
  }

  void changeTheme() {
    isLight = !isLight;
    notifyListeners();
  }

  void setTheme() async {
    theme = !theme;
    saveTheme(isTheme: theme);
    isTheme = (await applyTheme())!;
    if (isTheme == true) {
      mode = ThemeMode.dark;
      themeMode = Icons.light_mode;
    } else if (isTheme == false) {
      mode = ThemeMode.light;
      themeMode = Icons.dark_mode;
    } else {
      mode = ThemeMode.light;
      themeMode = Icons.dark_mode;
    }
    notifyListeners();
  }

  void getTheme() async {
    if (await applyTheme() == null) {
      isTheme = false;
    } else {
      isTheme = (await applyTheme())!;
    }
    if (isTheme == true) {
      mode = ThemeMode.dark;
      themeMode = Icons.light_mode;
    } else if (isTheme == false) {
      mode = ThemeMode.light;
      themeMode = Icons.dark_mode;
    } else {
      mode = ThemeMode.light;
      themeMode = Icons.dark_mode;
    }
    notifyListeners();
  }

  void saveTheme({required bool isTheme}) {}

  applyTheme() {}
}
