import 'package:cleaning_app/components/app_drawer/app_drawer.dart';
import 'package:cleaning_app/components/button/button.dart';
import 'package:cleaning_app/config/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import "package:cleaning_app/components/app_header/app_header.dart";

class BookJobStep4 extends StatefulWidget {
  static String screenName = "book-job-step-4";

  @override
  _BookJobStep4State createState() => _BookJobStep4State();
}

class _BookJobStep4State extends State<BookJobStep4> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        body: SafeArea(
          child: Column(
            children: [
              AppHeader(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Step 4 of 4",
                          style: TextStyle(
                              fontSize: 20,
                              color: ThemeColors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text("Address Details",
                            style: TextStyle(
                                fontSize: 26,
                                color: ThemeColors.blue,
                                fontWeight: FontWeight.bold)),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [],
                          ),
                        ),
                      ],
                    ),
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
