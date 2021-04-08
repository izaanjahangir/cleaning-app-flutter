import 'package:cleaning_app/components/app_drawer/app_drawer.dart';
import 'package:cleaning_app/components/button/button.dart';
import 'package:cleaning_app/config/theme_colors.dart';
import 'package:cleaning_app/screens/book_job_step_2/book_job_step_2.dart';
import 'package:flutter/material.dart';

import "package:cleaning_app/components/app_header/app_header.dart";
import "package:cleaning_app/components/text_heading/text_heading.dart";
import "package:cleaning_app/screens/book_job_step_1/counter.dart";
import "package:cleaning_app/screens/book_job_step_1/extras.dart";

class BookJobStep1 extends StatefulWidget {
  static String screenName = "book-job-step-1";

  @override
  _BookJobStep1State createState() => _BookJobStep1State();
}

class _BookJobStep1State extends State<BookJobStep1> {
  int amount = 0;
  final List<Map> extras = [
    {"id": 0, "name": "Living Room"},
    {"id": 1, "name": "Kitchen"},
    {"id": 2, "name": "Bathroom"}
  ];
  final List<int> selectedExtras = [];

  void handleExtraSelect(Map selectedItem) {
    int selectedIndex = selectedExtras.indexOf(selectedItem["id"]);

    setState(() {
      if (selectedIndex == -1) {
        selectedExtras.add(selectedItem["id"]);
      } else {
        selectedExtras.removeAt(selectedIndex);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        body: SafeArea(
          child: Column(
            children: [
              AppHeader(),
              SizedBox(
                height: 10,
              ),
              Text(
                "Step 1 of 3",
                style: TextStyle(
                    fontSize: 20,
                    color: ThemeColors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text("Home Details",
                  style: TextStyle(
                      fontSize: 20,
                      color: ThemeColors.black,
                      fontWeight: FontWeight.bold)),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
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
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          child: Extras(
                            values: extras,
                            selected: selectedExtras,
                            onSelect: handleExtraSelect,
                          ))
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(disabled: true, onPressed: () {}, label: "Back"),
                    Button(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(BookJobStep2.screenName);
                        },
                        label: "Next")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
