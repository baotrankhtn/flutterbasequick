import 'package:flutter/material.dart';
import 'package:flutterquick/configs/flutter_base_quick_configs.dart';

import 'custom_text.dart';

/*
 * Created on Wed Jan 19 2022 by baotran
 * Copyright (c) 2022
 */

class CustomBottomSizeStyle {
  static const WRAP_CONTENT = 0;
  static const MATCH_PARENT = 1;
}

class CustomButton extends StatelessWidget {
  CustomButton(this.text,
      {this.fontFamily,
      this.textColor,
      this.textAlignment = TextAlign.center,
      this.fontSize,
      this.fontWeight,
      this.padding,
      this.backgroundColor,
      this.borderRadius,
      this.borderWidth,
      this.borderOpacity,
      this.borderColor,
      this.sizeStyle = CustomBottomSizeStyle.WRAP_CONTENT,
      this.minWidth = 60.0,
      this.leftIcon,
      this.maxLine = 1,
      this.onTap}) {
    fontFamily ??= FlutterBaseQuick.buttonTextFontFamily;
    textColor ??= FlutterBaseQuick.buttonTextColor;
    fontSize ??= FlutterBaseQuick.buttonTextFontSize;
    fontWeight ??= FlutterBaseQuick.buttonTextFontWeight;
    padding ??= FlutterBaseQuick.buttonPadding;
    backgroundColor ??= FlutterBaseQuick.buttonBackgroundColor;
    borderRadius ??= FlutterBaseQuick.buttonBorderRadius;
    borderWidth ??= FlutterBaseQuick.buttonBorderWidth;
    borderOpacity ??= FlutterBaseQuick.buttonBorderOpacity;
    borderColor ??= FlutterBaseQuick.buttonBorderColor;
  }

  final String text;
  String? fontFamily;
  Color? textColor;
  final TextAlign textAlignment;
  double? fontSize;
  FontWeight? fontWeight;
  EdgeInsets? padding;
  Color? backgroundColor;
  double? borderRadius;
  double? borderWidth;
  double? borderOpacity;
  Color? borderColor;
  final int sizeStyle;
  final double minWidth;
  final Widget? leftIcon;
  final int maxLine;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return sizeStyle == CustomBottomSizeStyle.WRAP_CONTENT
        ? Row(
            children: [_buildChild()],
          )
        : _buildChild();
  }

  Widget _buildChild() {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
            border: Border.all(
                color:
                    borderColor ?? Colors.black.withOpacity(borderOpacity ?? 1),
                width: borderWidth ?? 0)),
        child: InkWell(
          borderRadius: BorderRadius.circular((borderRadius ?? 2 - 2) < 0
              ? 0
              : borderRadius ?? 2 - 2), // Prevent ripple overflow
          child: Container(
            padding: padding,
            alignment: Alignment.center,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: minWidth),
              child: leftIcon != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ..._buildLeftIcon(),
                        Flexible(
                          child: CustomText(
                            text,
                            fontFamily: fontFamily,
                            maxLine: maxLine,
                            color: textColor,
                            fontSize: fontSize,
                            fontWeight: fontWeight ?? FontWeight.normal,
                            align: textAlignment,
                          ),
                        ),
                      ],
                    )
                  : CustomText(
                      text,
                      fontFamily: fontFamily,
                      maxLine: maxLine,
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight: fontWeight ?? FontWeight.normal,
                      align: textAlignment,
                    ),
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }

  _buildLeftIcon() {
    return [
      SizedBox(
        width: 24.0,
        child: leftIcon,
      ),
      const SizedBox(width: 12.0),
    ];
  }
}
