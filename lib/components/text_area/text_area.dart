import 'package:flutter/material.dart';
import 'package:cleaning_app/config/theme_colors.dart';

class TextArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 150,
        color: ThemeColors.lightGrey,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: TextField(
          maxLines: null,
          decoration: InputDecoration(
            hintText: "Write detailed instructions, if any",
            hintStyle: TextStyle(),
            isDense: true,
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          ),
          keyboardType: TextInputType.multiline,
        ),
      ),
    );
  }
}
