import 'package:flutter/material.dart';

import "package:cleaning_app/components/app_header/app_header.dart";

class Home extends StatelessWidget {
  static String screenName = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [AppHeader(), Text("Home")],
        ),
      ),
    );
  }
}
