import 'package:flutter/material.dart';

import "package:cleaning_app/components/app_header/app_header.dart";
import "package:cleaning_app/components/text_heading/text_heading.dart";
import "package:cleaning_app/screens/book_job_step_1/counter.dart";

class BookJobStep1 extends StatefulWidget {
  static String screenName = "book-job-step-1";

  @override
  _BookJobStep1State createState() => _BookJobStep1State();
}

class _BookJobStep1State extends State<BookJobStep1> {
  int amount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppHeader(),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextHeading(
                    textAlign: TextAlign.center,
                    label: "How many bedrooms you want to clean?",
                    size: "medium",
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: Counter(
                        onAdd: () {
                          setState(() {
                            amount += 1;
                          });
                        },
                        onSubstract: () {
                          setState(() {
                            amount -= 1;
                          });
                        },
                        amount: amount,
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: TextHeading(
                      textAlign: TextAlign.center,
                      label: "Extras to add",
                      size: "medium",
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
