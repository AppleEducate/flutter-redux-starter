import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';

class DateViewWidget extends StatelessWidget {
  final ValueChanged<DateTime> dateChanged;
  DateViewWidget({this.dateChanged});
  void handleNewDate(DateTime value) {
    print("handleNewDate $value");
    dateChanged(value);
  }

  void handleDateRange(range) {
    print("Range is ${range.item1}, ${range.item2}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: new Calendar(
        isExpandable: true,
        onSelectedRangeChange: handleDateRange,
        onDateSelected: handleNewDate,
      ),
    );
  }
}
