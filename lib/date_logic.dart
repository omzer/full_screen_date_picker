import 'package:intl/intl.dart';

class DatePickingLogic {
  static final Duration _oneDay = const Duration(days: 1);

  /// Returns the first previous Sunday from today
  static DateTime previousSunday(DateTime time) {
    DateTime result = time;

    while (DateFormat(DateFormat.WEEKDAY).format(result) != 'Sunday') {
      result = result.subtract(_oneDay);
    }

    return result;
  }

  /// Returns the first day of the month, given how far this month is from today
  static DateTime firstDayOfTheMonth(int far) {
    DateTime result = DateTime.now().add(Duration(days: 30 * far));
    while (result.day != 1) result = result.subtract(_oneDay);
    return result;
  }

  /// Return all the days of the month as DateTime list, starting from
  /// the first previous sunday, till the last day of the month
  static List<DateTime> daysOfTheMonth(DateTime firstDay) {
    final result = <DateTime>[];

    // First Sunday of the previous month till the first day
    DateTime dateIterator = previousSunday(firstDay);
    while (dateIterator.isBefore(firstDay)) {
      result.add(dateIterator);
      dateIterator = dateIterator.add(_oneDay);
    }

    // First day of the month
    result.add(firstDay);
    dateIterator = dateIterator.add(_oneDay);

    // last day of the month
    while (dateIterator.day != 1) {
      result.add(dateIterator);
      dateIterator = dateIterator.add(_oneDay);
    }

    return result;
  }

  /// Verify if the given date is in a previous day than the current
  static bool isBeforeNow(DateTime date) {
    final DateTime now = DateTime.now();

    // Handle year
    if (date.year < now.year) return true;
    if (date.year > now.year) return false;

    // Handle month (both dates should be on the same year)
    if (date.month < now.month) return true;
    if (date.month > now.month) return false;

    return date.day < now.day;
  }

  /// Verify if the given date is the same as the selected day
  static bool isSameAsSelected(DateTime date, DateTime? selectedDate) {
    // Handle null
    if (selectedDate == null) return false;

    // Handle year
    if (date.year != selectedDate.year) return false;

    // Handle month (both dates should be on the same year)
    if (date.month != selectedDate.month) return false;

    return date.day == selectedDate.day;
  }

  static bool isToday(DateTime date) {
    return isSameAsSelected(date, DateTime.now());
  }
}
