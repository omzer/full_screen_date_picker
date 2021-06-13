library full_screen_date_picker;

import 'package:flutter/material.dart';

import 'date_logic.dart';
import 'month_grid.dart';

class FullScreenDatePicker extends StatelessWidget {
  FullScreenDatePicker({this.selectedDate, this.title});

  final String? title;
  final titleStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.w900);
  final DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildExitIcon(context),
            _buildTitle(),
            Expanded(child: _buildMonthsListView()),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(title ?? 'Select departure date', style: titleStyle),
    );
  }

  Widget _buildExitIcon(context) {
    return Align(
      // To align the button to the top right
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(Icons.close),
        ),
      ),
    );
  }

  Widget _buildMonthsListView() {
    return ListView.builder(
      itemBuilder: (_, i) => MonthGrid(
        firstDay: DatePickingLogic.firstDayOfTheMonth(i),
        selectedDate: selectedDate,
      ),
    );
  }
}
