import 'package:flutter/material.dart';

import "package:cleaning_app/components/app_header/app_header.dart";
import "package:cleaning_app/components/app_drawer/app_drawer.dart";

class YourJobs extends StatelessWidget {
  static String screenName = "your-jobs";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppHeader(),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text("Your jobs"))
          ],
        ),
      ),
    );
  }
}
