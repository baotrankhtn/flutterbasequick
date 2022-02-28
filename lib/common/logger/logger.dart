import 'dart:developer';
import 'package:flutter/foundation.dart';

class Logger {
  static void error(String message,
      {String tag = "--------------------> ERROR <--------------------"}) {
    if (kDebugMode) {
      log(tag + "\n" + message);
    }
  }

  static void info(String message,
      {String tag = "--------------------> INFO <--------------------"}) {
    if (kDebugMode) {
      log(tag + "\n" + message);
    }
  }
}
