
import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/core/constants/textstyle_ext.dart';
import 'package:flutter_travel_app/core/helper/asset_helper.dart';
import 'package:flutter_travel_app/core/helper/image_helper.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({
    super.key, required this.title, required this.description, required this.sourceImage, required this.aligment,
  });

  final String title;
  final String description;
  final String sourceImage;
  final AlignmentGeometry aligment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            alignment: aligment,
            child: ImageHelper.loadFromAsset(
                sourceImage,
                height: 375,
                width: 300,
                fit: BoxFit.fitHeight)),
        const SizedBox(
          height: kMediumPadding * 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(title,
                textAlign: TextAlign.left,
                style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                    fontSize: 23),
              ),

              const SizedBox(height: kMediumPadding,),
              Text(
                  description,
                  style: TextStyles.defaultStyle.regular),
            ],
          ),
        )
      ],
    );
  }
}