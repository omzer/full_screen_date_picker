import 'package:flutter_test/flutter_test.dart';
import 'package:full_screen_date_picker/date_logic.dart';

void main() {
  test('Test getting previous sunday', () {
    DateTime result = DatePickingLogic.previousSunday(DateTime.now());
    expect(result.weekday, DateTime.sunday);
  });

  test('Test getting first day of a month', () {
    DateTime result = DatePickingLogic.firstDayOfTheMonth(0);
    expect(result.day, 1);
  });

  test('Test getting first day of a month', () {
    DateTime now = DateTime.now();
    DateTime yesterday = now.subtract(Duration(days: 1));
    bool result = DatePickingLogic.isBeforeNow(yesterday);
    expect(result, yesterday.isBefore(now));
  });

}
