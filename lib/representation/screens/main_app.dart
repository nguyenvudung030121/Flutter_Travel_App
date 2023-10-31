import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/color_palatte.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/representation/screens/booking_screen.dart';
import 'package:flutter_travel_app/representation/screens/favorite_screen.dart';
import 'package:flutter_travel_app/representation/screens/home_screen.dart';
import 'package:flutter_travel_app/representation/screens/profile_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  static const String routeName = '/home';

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomeScreen(),
          FavoriteScreen(),
          BookingScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        selectedItemColor: ColorPalette.primaryColor,
        unselectedItemColor: const Color(0xFFE0DDF5),
        margin: const EdgeInsets.all(kItemPadding),
        items: [
          SalomonBottomBarItem(
              icon: const Icon(Icons.home, size: kBottomBarIconSize,), title: const Text('Home')),
          SalomonBottomBarItem(
              icon: const Icon(Icons.favorite, size: kBottomBarIconSize), title: const Text('Favorite')),
          SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.briefcase, size: kBottomBarIconSize), title: const Text('Booking')),
          SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.solidUser, size: kBottomBarIconSize), title: const Text('Profile')),
        ],
      ),
    );
  }
}
