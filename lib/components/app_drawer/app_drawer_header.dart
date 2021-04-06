import 'package:cleaning_app/config/theme_colors.dart';
import 'package:flutter/material.dart';

class AppDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: ThemeColors.lightGrey, width: 1))),
      child: Column(
        children: [
          ClipOval(
            child: Image.asset("assets/images/default-dp.jpeg",
                width: width * 0.25, height: width * 0.25),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Izaan jahangir",
            style: TextStyle(fontSize: 18, color: ThemeColors.white),
          )
        ],
      ),
    );
  }
}
