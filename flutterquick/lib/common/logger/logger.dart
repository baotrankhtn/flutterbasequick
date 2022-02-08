import 'dart:developer';
import 'package:flutter/foundation.dart';

/*
 * Created on Mon Jan 24 2022 by baotran
 * Copyright (c) 2022
 */

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
