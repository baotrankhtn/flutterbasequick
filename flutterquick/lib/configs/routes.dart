import 'package:flutter/material.dart';

class RoutePaths {
  // TODO: Remove this demo
  static const String X = "/x";
}

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.X:
      // List<dynamic> args = settings.arguments as List<dynamic>;
      // var x1 = args[0] as String?;
      // var x2 = args[1] as int?;
      // return MaterialPageRoute(builder: (_) => XPage(), settings: settings);
      default:
        return null;
    }
  }
}
