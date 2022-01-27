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
      {this.textColor,
      this.textAlignment = TextAlign.center,
      this.fontSize,
      this.fontWeight,
      this.padding,
      this.backgroundColor,
      this.borderRadius = 4,
      this.borderWidth = 0,
      this.borderOpacity = 0.3,
      this.borderColor = Colors.grey,
      this.sizeStyle = CustomBottomSizeStyle.WRAP_CONTENT,
      this.minWidth = 60.0,
      this.leftIcon,
      this.maxLine = 1,
      this.onTap}) {
    textColor ??= FlutterBaseQuick.buttonTextColor;
    fontSize ??= FlutterBaseQuick.fontSize;
    fontWeight ??= FlutterBaseQuick.buttonFontWeight;
    padding ??= FlutterBaseQuick.buttonPadding;
    backgroundColor ??= FlutterBaseQuick.buttonBackgroundColor;
  }

  final String text;
  Color? textColor;
  final TextAlign textAlignment;
  double? fontSize;
  FontWeight? fontWeight;
  EdgeInsets? padding;
  Color? backgroundColor;
  final double borderRadius;
  final double borderWidth;
  final double borderOpacity;
  final Color borderColor;
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
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
                color: borderColor.withOpacity(borderOpacity),
                width: borderWidth)),
        child: InkWell(
          borderRadius: BorderRadius.circular((borderRadius - 2) < 0
              ? 0
              : borderRadius - 2), // Prevent ripple overflow
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
