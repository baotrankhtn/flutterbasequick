/*
 * Created on Wed Jan 19 2022 by baotran
 * Copyright (c) 2022
 */

class FlutterBaseQuick {
  static bool debugMode = false;
  static String? fontFamily;

  static initialize({required bool debugMode, required String fontFamily}) {
    FlutterBaseQuick.debugMode = debugMode;
    FlutterBaseQuick.fontFamily = fontFamily;
  }
}
