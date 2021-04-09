import 'package:flutter/material.dart';

import "package:cleaning_app/components/app_header/app_header.dart";
import "package:cleaning_app/components/app_drawer/app_drawer.dart";
import "package:cleaning_app/components/text_heading/text_heading.dart";
import "package:cleaning_app/screens/job_history/job_history_item.dart";
import "package:cleaning_app/models/job.dart";

class JobHistory extends StatelessWidget {
  static String screenName = "job-history";
  final List<Job> jobs = [
    Job(
        ref: "REF-101",
        time: DateTime.now(),
        instructions: "Some random instrunctions",
        location: {"latitude": 24.8611791, "longitude": 66.9231016},
        noOfBedrooms: 2),
    Job(
        ref: "REF-102",
        time: DateTime(2021, 2, 14),
        instructions: "Another instruction",
        location: {"latitude": 24.8611791, "longitude": 66.9231016},
        noOfBedrooms: 4),
  ];

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
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      children: [
                        TextHeading(label: "Job History"),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              ...jobs
                                  .map((e) => JobHistoryItem(item: e))
                                  .toList()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
