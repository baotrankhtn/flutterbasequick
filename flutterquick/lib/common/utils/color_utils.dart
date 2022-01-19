import 'package:flutter/material.dart';

/*
 * Created on Wed Jan 19 2022 by baotran
 * Copyright (c) 2022
 */

extension BaseColorExtension on Color {
  ///
  /// https://medium.com/@filipvk/creating-a-custom-color-swatch-in-flutter-554bcdcb27f3
  ///
  MaterialColor generateMaterialColor() {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = this.red, g = this.green, b = this.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(this.value, swatch);
  }
}
