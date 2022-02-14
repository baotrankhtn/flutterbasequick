import 'package:flutter/material.dart';
import 'package:flutterbasequick/presentation/widget/toolbar_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ToolbarPage(title: "Home", child: Container());
  }
}
