import 'package:flutter/material.dart';

class UIConfig {
  static Color appBarColor = Colors.green;

  static Size screenSize(BuildContext context) => MediaQuery.of(context).size;
  static double screenWidth(BuildContext context) => screenSize(context).width;
  static double screenHeight(BuildContext context) => screenSize(context).height;
}