import 'package:cleaning_app/screens/job_history_details/job_history_details.dart';
import 'package:cleaning_app/utils/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import "package:cleaning_app/components/app_header/app_header.dart";
import "package:cleaning_app/components/text_heading/text_heading.dart";
import "package:cleaning_app/screens/job_history/job_history_item.dart";
import "package:cleaning_app/models/job.dart";
import 'package:flutter_easyloading/flutter_easyloading.dart';

class JobHistory extends StatefulWidget {
  static String screenName = "job-history";

  @override
  _JobHistoryState createState() => _JobHistoryState();
}

class _JobHistoryState extends State<JobHistory> {
  List<Job> jobs = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    try {
      EasyLoading.show(status: 'loading');

      QuerySnapshot data = await FirebaseHelpers.getCollection("jobs");
      final List<Job> newJobs = [];

      data.docs.forEach((element) {
        Map d = element.data();

        Job job = Job(
            ref: "REF-101",
            time: DateTime.parse(d["time"].toDate().toString()),
            addedOn: DateTime.parse(d["addedOn"].toDate().toString()),
            instructions: d["instructions"],
            location: {
              "latitude": d["location"].latitude,
              "longitude": d["location"].longitude
            },
            noOfBedrooms: d["noOfBedrooms"]);

        newJobs.add(job);
      });

      setState(() {
        jobs = newJobs;
      });

      EasyLoading.dismiss();
    } catch (e) {
      print(e);
      EasyLoading.showError(e["message"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              AppHeader(showBackIcon: true),
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
                                  .map((e) => JobHistoryItem(
                                        item: e,
                                        onTab: (Job selectedJob) {
                                          Navigator.of(context).pushNamed(
                                              JobHistoryDetails.screenName,
                                              arguments: {"data": selectedJob});
                                        },
                                      ))
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
