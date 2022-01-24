import 'package:flutter/material.dart';

mixin AfterFirstFrameMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => afterFirstFrame(context));
  }

  void afterFirstFrame(BuildContext context);
}
