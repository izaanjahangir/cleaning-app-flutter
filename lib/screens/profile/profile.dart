import 'package:flutter/material.dart';

import "package:cleaning_app/components/app_header/app_header.dart";

class Profile extends StatelessWidget {
  static String screenName = "profile";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AppHeader(),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text("Profile"))
          ],
        ),
      ),
    );
  }
}
