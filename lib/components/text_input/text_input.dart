import 'package:cleaning_app/config/theme_colors.dart';
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function validator;

  TextInput({this.controller, this.hintText, this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          fontSize: 16,
          color: ThemeColors.black,
        ),
        decoration: InputDecoration(
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            filled: true,
            fillColor: ThemeColors.white,
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black))),
        validator: (String value) {
          if (validator != null) {
            return validator(value);
          }

          return null;
        },
      ),
    );
  }
}
