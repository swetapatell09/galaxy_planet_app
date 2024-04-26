import 'package:flutter/material.dart';
import 'package:galaxy_planet_app/screen/home/provider/home_provider.dart';
import 'package:galaxy_planet_app/utils/app_routs.dart';
import 'package:galaxy_planet_app/utils/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: HomeProvider()),
    ],
    child: Consumer<HomeProvider>(builder: (context, value, child) {
      value.getTheme();
      value.theme = value.isTheme;
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: app_routs,
        theme: value.isTheme ? dark : light,
        themeMode: value.mode,
      );
    }),
  ));
}
