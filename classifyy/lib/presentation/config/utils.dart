import 'package:flutter/material.dart';

class ScreenSizes {
  static double widthSlabOneRel(BuildContext context) =>
      MediaQuery.of(context).size.width / 4;

  static double widthSlabTwoRel(BuildContext context) =>
      MediaQuery.of(context).size.width / 2;

  static double widthSlabThreeRel(BuildContext context) =>
      (MediaQuery.of(context).size.width * 3) / 4;

  static double widthSlabFourRel(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double heightFullRel(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static const double heightSlabOneAbs = 8;
  static const double heightSlabTwoAbs = 16;
  static const double heightSlabThreeAbs = 24;
  static const double heightSlabFourAbs = 32;
}
