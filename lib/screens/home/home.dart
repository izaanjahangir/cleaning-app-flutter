import 'package:flutter/material.dart';

import "package:cleaning_app/screens/book_job_step_1/book_job_step_1.dart";
import "package:cleaning_app/components/app_header/app_header.dart";
import "package:cleaning_app/components/app_drawer/app_drawer.dart";
import "package:cleaning_app/components/text_heading/text_heading.dart";
import "package:cleaning_app/screens/home/home_option.dart";

class Home extends StatelessWidget {
  static String screenName = "home";

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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  TextHeading(label: "Welcome"),
                  TextHeading(label: "Izaan jahangir"),
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
