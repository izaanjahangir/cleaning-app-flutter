import 'package:cleaning_app/screens/job_history/job_history.dart';
import 'package:flutter/material.dart';

import "package:cleaning_app/screens/book_job_step_1/book_job_step_1.dart";
import "package:cleaning_app/screens/settings/settings.dart";
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
          children: [
            AppHeader(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeOption(
                        onTab: () {
                          Navigator.pushNamed(context, BookJobStep1.screenName);
                        },
                        label: "Book Job",
                      ),
                      HomeOption(
                        onTab: () {
                          Navigator.pushNamed(context, JobHistory.screenName);
                        },
                        label: "Jobs History",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeOption(
                        onTab: () {
                          Navigator.pushNamed(context, Settings.screenName);
                        },
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
