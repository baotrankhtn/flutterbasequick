import 'package:flutter/material.dart';
import 'package:flutterquick/configs/flutter_base_quick_configs.dart';

/*
 * Created on Wed Jan 19 2022 by baotran
 * Copyright (c) 2022
 */

class CustomText extends StatelessWidget {
  CustomText(this.text,
      {this.fontFamily,
      this.fontStyle = FontStyle.normal,
      this.color,
      this.fontSize,
      this.padding = const EdgeInsets.all(0),
      this.margin = const EdgeInsets.all(0),
      this.maxLine,
      this.overflow = TextOverflow.ellipsis,
      this.align = TextAlign.start,
      this.fontWeight = FontWeight.normal,
      this.textDecoration = TextDecoration.none}) {
    fontFamily ??= FlutterBaseQuick.fontFamily;
    color ??= FlutterBaseQuick.textColor;
    fontSize ??= FlutterBaseQuick.fontSize;
  }

  final String text;
  String? fontFamily;
  final FontStyle? fontStyle;
  Color? color;
  double? fontSize;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final int? maxLine;
  final TextOverflow overflow;
  final TextAlign align;
  final FontWeight fontWeight;
  final TextDecoration textDecoration;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        padding: padding,
        child: Text(
          text,
          style: TextStyle(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontStyle: fontStyle,
              fontWeight: fontWeight,
              decoration: textDecoration),
          overflow: overflow,
          maxLines: maxLine,
          textAlign: align,
        ));
  }
}
