import 'package:cleaning_app/components/app_drawer/app_drawer.dart';
import 'package:cleaning_app/components/button/button.dart';
import 'package:cleaning_app/config/theme_colors.dart';
import 'package:flutter/material.dart';

import "package:cleaning_app/components/app_header/app_header.dart";

class BookJobStep2 extends StatefulWidget {
  static String screenName = "book-job-step-2";

  @override
  _BookJobStep2State createState() => _BookJobStep2State();
}

class _BookJobStep2State extends State<BookJobStep2> {
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
                "Step 2 of 3",
                style: TextStyle(
                    fontSize: 20,
                    color: ThemeColors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text("Time Details",
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
                    children: [],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        label: "Back"),
                    Button(onPressed: () {}, label: "Next")
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
