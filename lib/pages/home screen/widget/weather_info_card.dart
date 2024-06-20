// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:weatherapp/text%20style/my_text_style.dart';

class WeatherInfoCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final double height;
  final double width;
  final IconData iconData;
  const WeatherInfoCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
    required this.height,
    required this.width,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          color: color,
        ),
        SizedBox(
          height: height * 0.006,
        ),
        Column(
          children: [
            Text(
              value,
              style: myTextStyle(
                color: Colors.white,
                fontsize: height * 0.022,
                fontweight: FontWeight.w700,
              ),
            ),
            Text(
              title,
              style: myTextStyle(
                color: Colors.white,
                fontsize: height * 0.019,
                fontweight: FontWeight.w700,
              ),
            )
          ],
        )
      ],
    );
  }
}
