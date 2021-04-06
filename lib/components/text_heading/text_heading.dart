import 'package:cleaning_app/config/theme_colors.dart';
import 'package:flutter/material.dart';

class TextHeading extends StatelessWidget {
  final String label;
  final String size;
  final TextAlign textAlign;

  TextHeading(
      {@required this.label,
      this.size = "large",
      this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    double fontSize;

    if (size == "large") {
      fontSize = 26;
    }

    if (size == "medium") {
      fontSize = 18;
    }

    return Text(
      label,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: fontSize,
          color: ThemeColors.black,
          fontWeight: FontWeight.bold),
    );
  }
}
