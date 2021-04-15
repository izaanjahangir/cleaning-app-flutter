import 'package:cleaning_app/providers/user_provider.dart';
import 'package:cleaning_app/screens/job_history/job_history.dart';
import 'package:flutter/material.dart';

import "package:cleaning_app/screens/book_job_step_1/book_job_step_1.dart";
import "package:cleaning_app/screens/settings/settings.dart";
import "package:cleaning_app/components/app_header/app_header.dart";
import "package:cleaning_app/components/text_heading/text_heading.dart";
import "package:cleaning_app/screens/home/home_option.dart";
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  static String screenName = "home";

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AppHeader(
              showLogoutIcon: true,
            ),
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
                  TextHeading(label: userProvider.fullName),
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
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     HomeOption(
                  //       onTab: () {
                  //         Navigator.pushNamed(context, Settings.screenName);
                  //       },
                  //       label: "Settings",
                  //     ),
                  //     HomeOption(
                  //       onTab: () {},
                  //       label: "Promotions",
                  //     ),
                  //   ],
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
