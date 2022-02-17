import 'package:flutter/material.dart';
import 'package:flutterbasequick/presentation/pages/demo/demo_page.dart';

class RoutePaths {
  static const String DEMO = "/demo";
}

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.DEMO:
        List<dynamic> args = settings.arguments as List<dynamic>;
        var title = args[0] as String?;
        return MaterialPageRoute(
            builder: (_) => DemoPage(title: title ?? ""), settings: settings);
      default:
        return null;
    }
  }
}
