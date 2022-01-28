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

  static late String? buttonTextFontFamily;
  static late double? buttonTextFontSize;
  static late Color? buttonTextColor;
  static late FontWeight? buttonTextFontWeight;
  static late EdgeInsets? buttonPadding;
  static late Color? buttonBackgroundColor;

  FlutterBaseQuick._();

  ///
  /// Must called functions
  ///
  static void initialize({
    required bool dMode,
  }) {
    FlutterBaseQuick.debugMode = dMode;
  }

  static void initizalizeText({
    String? textFontFamily,
    double? textFontSize = 14,
    Color? textColor = Colors.black,
  }) {
    FlutterBaseQuick.textFontFamily = textFontFamily;
    FlutterBaseQuick.textColor = textColor;
    FlutterBaseQuick.textFontSize = textFontSize;
  }

  static void initializeButton(
      {String? buttonTextFontFamily,
      double? buttonTextFontSize = 14,
      Color? buttonTextColor = Colors.white,
      EdgeInsets? buttonPadding = const EdgeInsets.all(8),
      FontWeight? buttonTextFontWeight = FontWeight.w500,
      Color? buttonBackgroundColor = Colors.black}) {
    FlutterBaseQuick.buttonTextFontSize = buttonTextFontSize;
    FlutterBaseQuick.buttonTextColor = buttonTextColor;
    FlutterBaseQuick.buttonTextFontWeight = buttonTextFontWeight;

    FlutterBaseQuick.buttonPadding = buttonPadding;
    FlutterBaseQuick.buttonBackgroundColor = buttonBackgroundColor;
  }
}
