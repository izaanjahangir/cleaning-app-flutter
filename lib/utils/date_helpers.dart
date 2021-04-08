import 'package:intl/intl.dart';

class DateHelpers {
  static DateTime toDateTime(String dateString) {
    if (dateString == null || dateString == "") return null;

    final DateFormat dateFormat = DateFormat("dd'-'MMMM'-'yyyy");
    return dateFormat.parse(dateString);
  }

  static String format(DateTime dateTime) {
    if (dateTime == null) return null;

    final DateFormat dateFormat = DateFormat("dd'-'MMMM'-'yyyy");

    return dateFormat.format(dateTime);
  }
}
