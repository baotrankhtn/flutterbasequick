import 'package:flutter/material.dart';

/*
 * Created on Wed Jan 19 2022 by baotran
 * Copyright (c) 2022
 */

class FlutterBaseQuick {
  static late bool debugMode;
  static late String? textFontFamily;
  static late double? textFontSize;
  static late Color? textColor;
  static late double? buttonTextFontSize;
  static late Color? buttonTextColor;
  static late EdgeInsets? buttonPadding;
  static late FontWeight? buttonFontWeight;
  static late Color? buttonBackgroundColor;

  FlutterBaseQuick._();

  void initialize(
      {required bool dMode,
      // Text
      String? textFontFamily,
      Color? textColor = Colors.black,
      double? textFontSize = 14,
      // Button
      double? buttonTextFontSize = 14,
      Color? buttonTextColor = Colors.white,
      EdgeInsets? buttonPadding = const EdgeInsets.all(8),
      FontWeight? buttonFontWeight = FontWeight.w500,
      Color? buttonBackgroundColor = Colors.black}) {
    // Mode
    FlutterBaseQuick.debugMode = dMode;

    // Text
    FlutterBaseQuick.textFontFamily = textFontFamily;
    FlutterBaseQuick.textColor = textColor;
    FlutterBaseQuick.textFontSize = textFontSize;

    // Button
    FlutterBaseQuick.buttonTextFontSize = buttonTextFontSize;
    FlutterBaseQuick.buttonTextColor = buttonTextColor;
    FlutterBaseQuick.buttonPadding = buttonPadding;
    FlutterBaseQuick.buttonFontWeight = buttonFontWeight;
    FlutterBaseQuick.buttonBackgroundColor = buttonBackgroundColor;
  }
}
