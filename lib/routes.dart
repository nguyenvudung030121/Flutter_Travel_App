import 'package:flutter/cupertino.dart';
import 'package:flutter_travel_app/representation/screens/home_sreen.dart';
import 'package:flutter_travel_app/representation/screens/intro_screen.dart';
import 'package:flutter_travel_app/representation/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
};
