import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/gen/assets/assets.gen.dart';
import '/common/values/dimens.dart';
import '/common/values/font_sizes.dart';
import '/gen/assets/colors.gen.dart';

import 'base/custom_text.dart';

class ToolbarPage extends StatelessWidget {
  ToolbarPage(
      {required this.title,
      required this.child,
      this.topAreaColor = ColorName.background,
      this.bottomAreaColor = ColorName.background,
      this.safeAreaColor = ColorName.background,
      this.safeAreaLeft = false,
      this.safeAreaRight = false,
      this.safeAreaTop = true,
      this.safeAreaBottom = true,
      this.extendBodyBehindToolbar = false,
      this.actionButtons = const [],
      this.toolbarBackgroundColor = ColorName.primary,
      this.toolbarMargin,
      this.toolbarHeight = Dimens.toolbarHeight,
      this.showLeftButton = true,
      this.leftButtonColor = Colors.black,
      this.leading,
      this.titleFontWeight = FontWeight.w600,
      this.statusBarIconBrightness = Brightness.dark,
      this.onLeftButtonListener});

  final String title;
  final Widget child;
  final Color topAreaColor; // Space above SafeArea
  final Color bottomAreaColor; // Space below SafeArea
  final Color safeAreaColor;
  final bool safeAreaLeft;
  final bool safeAreaRight;
  final bool safeAreaTop;
  final bool safeAreaBottom;
  final bool extendBodyBehindToolbar;
  final List<Widget> actionButtons;
  final Color toolbarBackgroundColor;
  final EdgeInsets? toolbarMargin;
  final double? toolbarHeight;
  final bool showLeftButton;
  final Color leftButtonColor;
  final Widget? leading;
  final FontWeight titleFontWeight;
  final Brightness statusBarIconBrightness;
  final Function? onLeftButtonListener;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          systemNavigationBarColor: null,
          systemNavigationBarDividerColor: null,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
          statusBarBrightness: statusBarIconBrightness == Brightness.light
              ? Brightness.dark
              : Brightness.light,
          statusBarIconBrightness: statusBarIconBrightness),
      child: Stack(
        children: [
          // Top and bottom of SafeArea
          Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                      decoration: BoxDecoration(color: topAreaColor))),
              Expanded(
                  flex: 1,
                  child: Container(
                      decoration: BoxDecoration(color: bottomAreaColor)))
            ],
          ),

          // Main content
          SafeArea(
            left: safeAreaLeft,
            right: safeAreaRight,
            top: safeAreaTop,
            bottom: safeAreaBottom,
            child: Scaffold(
              backgroundColor: safeAreaColor,
              body: Container(
                  decoration: BoxDecoration(color: safeAreaColor),
                  child: extendBodyBehindToolbar
                      ? Stack(
                          children: [child, _buildToolbar(context)],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                              _buildToolbar(context),
                              Expanded(child: child),
                            ])),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToolbar(BuildContext context) {
    return Container(
      height: toolbarHeight,
      decoration: BoxDecoration(
        color: toolbarBackgroundColor,
      ),
      margin: toolbarMargin,
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left icon
          Visibility(
            visible: showLeftButton,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {
                if (onLeftButtonListener == null) {
                  Navigator.pop(context);
                } else {
                  onLeftButtonListener?.call();
                }
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Assets.images.icBack.image(
                    width: Dimens.toolbarIcon,
                    height: Dimens.toolbarIcon,
                    color: leftButtonColor),
              ),
            ),
          ),

          // Title
          Expanded(
              child: (leading != null)
                  ? leading!
                  : CustomText(
                      title,
                      fontWeight: titleFontWeight,
                      fontSize: FontSize.BIG,
                      maxLine: 1,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 0),
                    )),

          // Action buttons
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: actionButtons,
          )
        ],
      ),
    );
  }
}
