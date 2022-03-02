import 'package:flutter/material.dart';
import '/common/values/dimens.dart';
import '/gen/localization/l10n.dart';
import '/common/values/font_sizes.dart';
import '/presentation/widget/base/custom_button.dart';
import '/presentation/widget/base/custom_text.dart';

import 'base/base_dialog.dart';

class InfoDialog extends BaseDialog {
  final String title;
  final String content;
  String positiveText;
  final Function? callbackPositive;

  InfoDialog(
      {required context,
      this.title = "",
      this.content = "",
      this.positiveText = "",
      this.callbackPositive})
      : super(context: context) {
    _init();
    _build();
  }

  void _init() {
    if (positiveText.isEmpty) {
      positiveText = S.current.ok;
    }
  }

  void _build() {
    dialog = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.radiusNormal)),
      contentPadding: EdgeInsets.zero,
      content: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimens.radiusNormal)),
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
            SizedBox(height: content.isEmpty ? 8 : 24),

            // Button
            CustomButton(
              positiveText,
              fontSize: FontSize.MEDIUM,
              fontWeight: FontWeight.w500,
              sizeStyle: CustomBottomSizeStyle.MATCH_PARENT,
              onTap: () {
                dismiss();
                callbackPositive?.call();
              },
            ),
          ],
        ),
      ),
    );
  }
}
