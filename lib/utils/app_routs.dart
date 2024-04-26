import 'package:flutter/cupertino.dart';
import 'package:galaxy_planet_app/screen/detail/view/detail_screen.dart';
import 'package:galaxy_planet_app/screen/home/view/home_screen.dart';
import 'package:galaxy_planet_app/screen/splash/splash_screen.dart';

Map<String, WidgetBuilder> app_routs = {
  "/": (context) => SplashScreen(),
  "home": (context) => HomeScreen(),
  "detail": (context) => DetailScreen(),
};
