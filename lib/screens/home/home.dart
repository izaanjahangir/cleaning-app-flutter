import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static String screenName = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [Text("Home")],
          ),
        ),
      ),
    );
  }
}
