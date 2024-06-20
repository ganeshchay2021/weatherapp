import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

TextStyle myTextStyle(
    {double? fontsize,
    Color? color,
    FontWeight? fontweight = FontWeight.normal}) {
  return TextStyle(
    fontSize: fontsize,
    color: color,
    fontWeight: fontweight,
  );
}
