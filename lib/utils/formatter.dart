import "package:cleaning_app/utils/helpers.dart";

class Formatter {
  static String formatCreditCard(text) {
    if (text == null) return "";

    String masked = "";

    for (int i = 0; i < text.length; i++) {
      masked += text[i];

      if (Helpers.isWholeNumber((i + 1) / 4)) {
        masked += " ";
      }
    }

    return masked;
  }
}
