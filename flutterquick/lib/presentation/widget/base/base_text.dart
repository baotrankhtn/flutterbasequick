import 'package:flutter/material.dart';
import 'package:flutterquick/common/values/font_sizes.dart';

/*
 * Created on Wed Jan 19 2022 by baotran
 * Copyright (c) 2022
 */

class BaseText extends StatelessWidget {
  BaseText(this.text,
      {this.fontFamily,
      this.fontStyle = FontStyle.normal,
      this.color = Colors.black,
      this.fontSize = BaseFontSize.MEDIUM,
      this.padding = const EdgeInsets.all(0),
      this.margin = const EdgeInsets.all(0),
      this.maxLine,
      this.overflow = TextOverflow.ellipsis,
      this.align = TextAlign.start,
      this.fontWeight = FontWeight.normal,
      this.textDecoration = TextDecoration.none});

  final String text;
  final String? fontFamily;
  final FontStyle fontStyle;
  final Color color;
  final double fontSize;
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
