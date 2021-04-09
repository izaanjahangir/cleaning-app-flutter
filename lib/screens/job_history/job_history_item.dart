import 'package:cleaning_app/models/job.dart';
import "package:flutter/material.dart";
import 'package:cleaning_app/config/theme_colors.dart';

class JobHistoryItem extends StatelessWidget {
  final Job item;

  JobHistoryItem({this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ThemeColors.lightGrey, width: 1)),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 1,
        color: ThemeColors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            width: double.infinity,
            child: Row(
              children: [
                Text(
                  item.ref,
                  style: TextStyle(
                      color: ThemeColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
