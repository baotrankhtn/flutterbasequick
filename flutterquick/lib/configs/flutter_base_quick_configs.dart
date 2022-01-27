import 'package:flutter/material.dart';

/*
 * Created on Wed Jan 19 2022 by baotran
 * Copyright (c) 2022
 */

class FlutterBaseQuick {
  static late bool debugMode;
  static late String? fontFamily;
  static late double? fontSize;
  static late Color? textColor;
  static late Color? buttonTextColor;
  static late EdgeInsets? buttonPadding;
  static late FontWeight? buttonFontWeight;
  static late Color? buttonBackgroundColor;

  FlutterBaseQuick._();

  void initialize(
      {required bool dMode,
      String? fontFamily,
      Color? textColor = Colors.black,
      double? fontSize = 14,
      Color? buttonTextColor = Colors.white,
      EdgeInsets? buttonPadding = const EdgeInsets.all(8),
      FontWeight? buttonFontWeight = FontWeight.w500,
      Color? buttonBackgroundColor = Colors.black}) {
    FlutterBaseQuick.debugMode = dMode;

    // Both text & button
    FlutterBaseQuick.fontFamily = fontFamily;
    FlutterBaseQuick.textColor = textColor;
    FlutterBaseQuick.fontSize = fontSize;

    // Button only
    FlutterBaseQuick.buttonTextColor = buttonTextColor;
    FlutterBaseQuick.buttonPadding = buttonPadding;
    FlutterBaseQuick.buttonFontWeight = buttonFontWeight;
    FlutterBaseQuick.buttonBackgroundColor = buttonBackgroundColor;
  }
}
