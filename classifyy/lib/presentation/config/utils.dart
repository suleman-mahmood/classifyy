import 'package:flutter/material.dart';

class ScreenSizes {
  static double widthSlabOneRel(BuildContext context) => MediaQuery.of(context).size.width / 4;

  static double widthSlabTwoRel(BuildContext context) => MediaQuery.of(context).size.width / 2;

  static double widthSlabThreeRel(BuildContext context) =>
      (MediaQuery.of(context).size.width * 3) / 4;

  static double widthSlabFourRel(BuildContext context) => MediaQuery.of(context).size.width;

  static double heightQuarterRel(BuildContext context) => MediaQuery.of(context).size.height / 4;

  static double heightThreeQuarterRel(BuildContext context) =>
      MediaQuery.of(context).size.height * 3 / 4;

  static double heightHalfRel(BuildContext context) => MediaQuery.of(context).size.height / 2;

  static double heightFullRel(BuildContext context) => MediaQuery.of(context).size.height;

  static const double slabOne = 8;
  static const double slabTwo = 16;
  static const double slabThree = 24;
  static const double slabFour = 32;
  static const double slabFive = 40;
}

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter email';
  }

  final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9.]+\.[a-zA-Z]{2,}$');
  if (!emailRegExp.hasMatch(value)) {
    return 'Invalid email';
  }

  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter password';
  }

  if (value.length < 4) {
    return 'Password should be atleast 4 characters';
  }

  return null;
}
