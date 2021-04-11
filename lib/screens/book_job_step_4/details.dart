import 'package:cleaning_app/config/constants.dart';
import 'package:cleaning_app/config/theme_colors.dart';
import 'package:cleaning_app/models/job.dart';
import "package:flutter/material.dart";
import 'package:intl/intl.dart';

class Details extends StatelessWidget {
  final Job data;

  Details({this.data});

  Widget getSingleDetail(String label, value) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        label,
        style: TextStyle(fontSize: 18),
      ),
      Text(value,
          style: TextStyle(
              fontSize: 18,
              color: ThemeColors.blue,
              fontWeight: FontWeight.bold))
    ]);
  }

  String getExtrasNames() {
    String names = "";

    Constants.extras.forEach((element) {
      if (data.extras.contains(element["id"])) {
        if (names != "") {
          names += ", ";
        }

        names += element["name"] + " ";
      }
    });

    return names.trim();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        color: ThemeColors.lightestGrey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getSingleDetail("No of Bedrooms", data.noOfBedrooms.toString()),
            SizedBox(
              height: 20,
            ),
            getSingleDetail("Extra Included", getExtrasNames()),
            SizedBox(
              height: 20,
            ),
            getSingleDetail("Time", DateFormat.yMMMd().format(data.time)),
          ],
        ),
      ),
    );
  }
}
