import 'package:flutter/material.dart';

class Helpers {
  static void dismissKeyboardOnTap(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus.unfocus();
    }
  }

  static bool isWholeNumber(num value) =>
      value is int || value == value.roundToDouble();
}
