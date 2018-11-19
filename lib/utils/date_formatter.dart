import 'package:intl/intl.dart';

String formatDate(String value) {
  if (value == null || value.isEmpty) return "";
  DateTime date;
  try {
    date = DateTime.parse(value);
  } catch (e) {
    return "";
  }
  if (date.year < 1900) return "";
  return DateFormat('MM-dd-yy').format(date);
}
