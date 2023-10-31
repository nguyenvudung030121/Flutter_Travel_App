import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/color_palatte.dart';
import 'package:flutter_travel_app/core/constants/textstyle_ext.dart';
import 'package:flutter_travel_app/core/helper/asset_helper.dart';
import 'package:flutter_travel_app/representation/screens/splash_screen.dart';
import 'package:flutter_travel_app/representation/widgets/intro_widget.dart';
import 'package:flutter_travel_app/representation/widgets/item_buttom_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/constants/dimension_constants.dart';
import 'home_sreen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  static const String routeName = '/intro';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  final StreamController<int> _streamController = StreamController<int>();
  final List<Widget> listPage = [
    const IntroWidget(
      title: 'Book a flight',
      description:
          'Found a flight that matches your destination and schedule? Book it instantly.',
      sourceImage: AssetHelper.imageIntro1st,
      aligment: Alignment.centerRight,
    ),
    const IntroWidget(
      title: 'Find a hotel room',
      description:
          'Select the day, book your room. We give you the best price.',
      sourceImage: AssetHelper.imageIntro2nd,
      aligment: Alignment.center,
    ),
    const IntroWidget(
      title: 'Enjoy your trip',
      description:
          'Easy discovering new places and share these between your friends and travel together.',
      sourceImage: AssetHelper.imageIntro3rd,
      aligment: Alignment.centerLeft,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _streamController.add(_pageController.page!.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: listPage,
          ),
          Positioned(
              left: kMediumPadding,
              right: kMediumPadding,
              bottom: kMediumPadding * 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 6,
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: listPage.length,
                      effect: const ExpandingDotsEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          activeDotColor: Colors.amber,
                          dotColor: Colors.grey),
                    ),
                  ),
                  StreamBuilder<int>(
                    initialData: 0,
                    stream: _streamController.stream,
                    builder: (context, snapshot) {
                      return  Expanded(
                          flex: 4,
                          child:
                          ItemButtonWidget(title: snapshot.data != 2 ? 'Next' : 'Get Started',onTap:() {
                            if (_pageController.page == 2) {
                              Navigator.of(context).pushNamed(HomeScreen.routeName);
                            } else {
                              _pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
                            }
                          } ,)
                      );
                    },
                  )
                ],
              )),
        ],
      ),
    );
  }
}
