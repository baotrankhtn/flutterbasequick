import 'package:flutter/material.dart';

abstract class BaseDialog {
  final BuildContext context;
  late AlertDialog dialog;

  BaseDialog({required this.context});

  void show({bool touchToDismiss = false}) {
    showDialog(
        context: context,
        barrierDismissible: touchToDismiss,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => touchToDismiss, child: dialog);
        });
  }

  void dismiss() {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
