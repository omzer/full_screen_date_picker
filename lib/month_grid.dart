import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'date_logic.dart';

class MonthGrid extends StatelessWidget {
  MonthGrid({required this.firstDay, this.selectedDate});

  final DateTime now = DateTime.now();
  final DateTime firstDay;
  final DateTime? selectedDate;
  final days = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];
  final dayStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  final previousDayStyle = TextStyle(fontSize: 14, color: Colors.grey);
  final selectedDayStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w900,
    color: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 32, right: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Month and year (i.e: June 2021)
          _buildMonthAndYearText(),

          // Divider to separate views
          Divider(),

          // Grid to show month days
          SizedBox(height: 300, child: _buildGrid(context)),
        ],
      ),
    );
  }

  Widget _buildMonthAndYearText() {
    return Text(DateFormat(DateFormat.YEAR_MONTH).format(firstDay));
  }

  Widget _buildGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 7,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 16),
      children: [
        // Render days of the week text (Sun, Mon, ..etc)
        for (String day in days) Center(child: Text(day, style: dayStyle)),

        // Render days of the month (1, 2, 3, ..etc)
        for (DateTime date in DatePickingLogic.daysOfTheMonth(firstDay))
          _buildDay(date, context),
      ],
    );
  }

  Widget _buildDay(DateTime date, BuildContext context) {
    // Gray out days before today
    if (DatePickingLogic.isBeforeNow(date))
      return Center(child: Text(date.day.toString(), style: previousDayStyle));

    // Highlight selected day
    if (DatePickingLogic.isSameAsSelected(date, selectedDate))
      return Center(child: Text(date.day.toString(), style: selectedDayStyle));

    // Make other days clickable
    return InkWell(
      // When a date clicked
      onTap: () => _onDateClicked(date, context),
      child: Container(child: Center(child: Text(date.day.toString()))),
    );
  }

  void _onDateClicked(DateTime date, context) => Navigator.pop(context, date);
}
