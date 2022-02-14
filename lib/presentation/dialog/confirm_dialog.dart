import 'package:flutter/material.dart';
import 'package:flutterbasequick/gen/localization/l10n.dart';
import '/common/values/font_sizes.dart';
import '/presentation/widget/base/custom_text.dart';
import '/presentation/widget/base/custom_button.dart';

import 'base/base_dialog.dart';

class ConfirmDialog extends BaseDialog {
  final String title;
  final String content;
  String positiveText;
  String negativeText;
  final bool isShowButtonVertically;
  final Function? callbackPositive;
  final Function? callbackNegative;

  ConfirmDialog(
      {required context,
      this.title = "",
      this.content = "",
      this.positiveText = "",
      this.negativeText = "",
      this.isShowButtonVertically = false,
      this.callbackPositive,
      this.callbackNegative})
      : super(context: context) {
    _init();
    _build();
  }

  void _init() {
    if (positiveText.isEmpty) {
      positiveText = S.current.ok;
    }
    if (negativeText.isEmpty) {
      negativeText = S.current.cancel;
    }
  }

  void _build() {
    Widget customButtonNegativeText = CustomButton(negativeText,
        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
        fontSize: FontSize.MEDIUM,
        fontWeight: FontWeight.w500,
        borderRadius: 16,
        backgroundColor: Colors.transparent,
        borderColor: Colors.black,
        borderOpacity: 1,
        textColor: Colors.black,
        borderWidth: 1,
        sizeStyle: CustomBottomSizeStyle.MATCH_PARENT, onTap: () {
      dismiss();
      callbackNegative?.call();
    });
    Widget customButtonPositive = CustomButton(
      positiveText,
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
      fontSize: FontSize.MEDIUM,
      fontWeight: FontWeight.w500,
      borderRadius: 16,
      sizeStyle: CustomBottomSizeStyle.MATCH_PARENT,
      onTap: () {
        dismiss();
        callbackPositive?.call();
      },
    );

    dialog = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: EdgeInsets.zero,
      content: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            title.isEmpty
                ? Container()
                : CustomText(title,
                    align: TextAlign.center,
                    fontSize: FontSize.BIG,
                    fontWeight: FontWeight.w600,
                    maxLine: 3),
            SizedBox(height: title.isEmpty ? 0 : 16),

            // Content
            content.isEmpty
                ? Container()
                : CustomText(
                    content,
                    align: TextAlign.center,
                    maxLine: 5,
                  ),
            SizedBox(height: content.isEmpty ? 8 : 28),

            (isShowButtonVertically == true)
                ? Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Positive
                      customButtonPositive,
                      const SizedBox(height: 8),
                      // Negative
                      customButtonNegativeText
                    ],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Negative
                      Expanded(child: customButtonNegativeText),
                      const SizedBox(width: 16),
                      // Positive
                      Expanded(child: customButtonPositive)
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
