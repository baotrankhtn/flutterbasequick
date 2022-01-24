import 'dart:developer';
import 'package:flutterquick/configs/flutter_base_quick_configs.dart';

/*
 * Created on Mon Jan 24 2022 by baotran
 * Copyright (c) 2022
 */

class BaseLogger {
  static void error(String message,
      {String tag = "--------------------> ERROR <--------------------"}) {
    if (FlutterBaseQuick.debugMode) {
      log(tag + "\n" + message);
    }
  }

  static void info(String message,
      {String tag = "--------------------> INFO <--------------------"}) {
    if (FlutterBaseQuick.debugMode) {
      log(tag + "\n" + message);
    }
  }
}
