import 'package:cleaning_app/components/button/button.dart';
import 'package:cleaning_app/config/theme_colors.dart';
import 'package:cleaning_app/screens/book_job_step_3/book_job_step_3.dart';
import 'package:cleaning_app/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import "package:cleaning_app/components/app_header/app_header.dart";
import "package:cleaning_app/components/text_area/text_area.dart";

class BookJobStep2 extends StatefulWidget {
  static String screenName = "book-job-step-2";

  @override
  _BookJobStep2State createState() => _BookJobStep2State();
}

class _BookJobStep2State extends State<BookJobStep2> {
  DateTime jobTime = DateTime.now();
  TextEditingController instructionController = TextEditingController();
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          Helpers.dismissKeyboardOnTap(context);
        },
        child: Scaffold(
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
                            "Step 2 of 4",
                            style: TextStyle(
                                fontSize: 20,
                                color: ThemeColors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text("Time Details",
                              style: TextStyle(
                                  fontSize: 26,
                                  color: ThemeColors.blue,
                                  fontWeight: FontWeight.bold)),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: PhysicalModel(
                                    color: ThemeColors.black,
                                    elevation: 3,
                                    child: Container(
                                      color: ThemeColors.white,
                                      height: 150,
                                      child: CupertinoDatePicker(
                                          initialDateTime: now,
                                          minimumDate: now,
                                          mode: CupertinoDatePickerMode
                                              .dateAndTime,
                                          onDateTimeChanged:
                                              (DateTime newDate) {
                                            setState(() {
                                              jobTime = newDate;
                                            });
                                          }),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Instructions",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: TextArea(
                                      controller: instructionController,
                                      hintText:
                                          "Write detailed instructions, if any",
                                    ))
                              ],
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
                      Button(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(BookJobStep3.screenName, arguments: {
                              ...arguments,
                              "jobTime": jobTime,
                              "instructions": instructionController.text
                            });
                          },
                          label: "Next")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
