import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/core/constants/textstyle_ext.dart';
import 'package:flutter_travel_app/core/helper/asset_helper.dart';
import 'package:flutter_travel_app/core/helper/image_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/item_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      titleString: 'home',
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kItemPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hi James!',
                    style:
                        TextStyles.defaultStyle.fontHeader.whiteTextColor.bold),
                const SizedBox(
                  height: kMediumPadding,
                ),
                Text(
                  'Where are you going next?',
                  style: TextStyles.defaultStyle.fontCaption.whiteTextColor,
                )
              ],
            ),
            const Spacer(),
            const Icon(
              FontAwesomeIcons.bell,
              size: kDefaultIconSize,
              color: Colors.white,
            ),
            const SizedBox(
              width: kDefaultPadding,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  kItemPadding,
                ),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(kItemPadding),
              child: ImageHelper.loadFromAsset(
                AssetHelper.person,
              ),
            ),
          ],
        ),
      ),
      implementLeading: false,
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
                hintText: 'Search your destination',
                prefixIcon: Padding(
                  padding: EdgeInsets.all(kTopPadding),
                  child: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Colors.black,
                    size: kDefaultPadding,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius:
                        BorderRadius.all(Radius.circular(kItemPadding)))),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                categoryWidget('Hotels',0xffFE9C5E,AssetHelper.hotels),
                categoryWidget('Flights',0xffF77777,AssetHelper.flights),
                categoryWidget('All',0xff3EC8BC,AssetHelper.allfighthotel),
              ],
            ),
          )
        ],
      ),
    );
  }

  Column categoryWidget(String title, int color,String img) {
    return Column(
                children: [
                  Container(
                    width: 95,
                    height: 70,
                    decoration: BoxDecoration(
                      color:  Color(color).withOpacity(0.2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                      child: ImageHelper.loadFromAsset(img,
                          alignment: Alignment.center, width: 25, height: 25),
                    ),
                  ),
                  const SizedBox(height: 15,),
                   Text(title,
                    style: TextStyles.defaultStyle.regular.semibold,
                  )
                ],
              );
  }
}
