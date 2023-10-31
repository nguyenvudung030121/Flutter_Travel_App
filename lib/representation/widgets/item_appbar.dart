import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/color_palatte.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/core/constants/textstyle_ext.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget(
      {super.key,
      required this.child,
      this.title,
      this.titleString,
      this.subTitleString,
      this.implementTraling = false,
      this.implementLeading = true,
      this.paddingContent = const EdgeInsets.symmetric(
        horizontal: kMediumPadding,
      )});

  final Widget child;
  final Widget? title;
  final String? titleString;
  final String? subTitleString;
  final bool implementTraling;
  final bool implementLeading;
  final EdgeInsets? paddingContent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 200,
            child: AppBar(
              automaticallyImplyLeading: false,
              title: title ??
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (implementLeading)
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  kDefaultPadding,
                                ),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.all(kItemPadding),
                              child: const Icon(
                                FontAwesomeIcons.arrowLeft,
                                size: kDefaultPadding,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  titleString ?? '',
                                  style: TextStyles.defaultStyle.fontHeader
                                      .whiteTextColor.bold,
                                ),
                                if (subTitleString != null)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: kMediumPadding),
                                    child: Text(
                                      subTitleString!,
                                      style: TextStyles.defaultStyle.fontCaption
                                          .whiteTextColor,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        if (implementTraling)
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                kDefaultPadding,
                              ),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.all(kItemPadding),
                            child: const Icon(
                              FontAwesomeIcons.bars,
                              size: kDefaultPadding,
                              color: Colors.black,
                            ),
                          ),
                      ],
                    ),
                  ),
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        gradient: Gradients.defaultGradientBackground,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40))),
                  ),
                ],
              ),
              toolbarHeight: 90,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 156),
            padding: paddingContent,
            child: child,
          ),
        ],
      ),
    );
  }
}
