import 'package:cleaning_app/config/theme_colors.dart';
import "package:flutter/material.dart";

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          Image(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/room.jpeg"),
          ),
          Expanded(
            child: Container(
              color: ThemeColors.white,
            ),
          )
        ],
      ),
    );
  }
}
