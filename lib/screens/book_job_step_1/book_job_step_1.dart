import 'package:cleaning_app/config/theme_colors.dart';
import 'package:flutter/material.dart';

import "package:cleaning_app/components/app_header/app_header.dart";
import "package:cleaning_app/screens/home/home_option.dart";

class BookJobStep1 extends StatelessWidget {
  static String screenName = "book-job-step-1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppHeader(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
