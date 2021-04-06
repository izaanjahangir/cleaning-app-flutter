import 'package:cleaning_app/config/theme_colors.dart';
import 'package:flutter/material.dart';

import "package:cleaning_app/screens/book_job_step_1/book_job_step_1.dart";
import "package:cleaning_app/components/app_header/app_header.dart";
import "package:cleaning_app/screens/home/home_option.dart";

class Home extends StatelessWidget {
  static String screenName = "home";

  Widget renderHeading(String label) {
    return Text(
      label,
      style: TextStyle(
          fontSize: 26, color: ThemeColors.black, fontWeight: FontWeight.bold),
    );
  }

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
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  renderHeading("Welcome"),
                  renderHeading("Izaan jahangir"),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      HomeOption(
                        onTab: () {
                          Navigator.pushNamed(context, BookJobStep1.screenName);
                        },
                        label: "Book Job",
                      ),
                      HomeOption(
                        onTab: () {},
                        label: "Your Jobs",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      HomeOption(
                        onTab: () {},
                        label: "Settings",
                      ),
                      HomeOption(
                        onTab: () {},
                        label: "Promotions",
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
