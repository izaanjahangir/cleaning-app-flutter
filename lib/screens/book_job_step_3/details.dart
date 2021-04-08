import 'package:cleaning_app/config/theme_colors.dart';
import "package:flutter/material.dart";

class Details extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        color: ThemeColors.lightGrey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getSingleDetail("No of Bedrooms", "10"),
            SizedBox(
              height: 20,
            ),
            getSingleDetail("Extra Included", "10"),
            SizedBox(
              height: 20,
            ),
            getSingleDetail("Time", "10"),
          ],
        ),
      ),
    );
  }
}
