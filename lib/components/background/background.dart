import 'package:cleaning_app/config/theme_colors.dart';
import "package:flutter/material.dart";

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/room.jpeg"))),
        child: Opacity(
          opacity: 0.7,
          child: Container(
            color: ThemeColors.yellow,
          ),
        ),
      ),
    );
  }
}
