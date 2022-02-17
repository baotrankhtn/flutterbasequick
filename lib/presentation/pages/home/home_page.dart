import 'package:flutter/material.dart';
import '/configs/routes.dart';
import '/presentation/widget/base/custom_button.dart';
import '/presentation/widget/toolbar_page.dart';

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
    return ToolbarPage(
        title: "Home",
        showLeftButton: false,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(
                "Important! Check this DEMO",
                onTap: () {
                  Navigator.pushNamed(context, RoutePaths.DEMO,
                      arguments: ["Demo"]);
                },
              ),
            ],
          ),
        ));
  }
}
