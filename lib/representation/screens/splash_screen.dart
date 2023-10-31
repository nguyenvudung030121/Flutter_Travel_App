import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/helper/asset_helper.dart';
import 'package:flutter_travel_app/core/helper/image_helper.dart';
import 'package:flutter_travel_app/representation/animations/right_to_left_route.dart';
import 'package:flutter_travel_app/representation/screens/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String routeName = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    redirectToIntroScreen();
  }

  void redirectToIntroScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context)
        .pushReplacement(RightToLeftRoute(page: const IntroScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned.fill(
        child: ImageHelper.loadFromAsset(AssetHelper.imageBackGroundSplash,
            fit: BoxFit.fill),
      ),
    ]);
  }
}
