import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:licham/features/calendar/domain/lunar_date.dart';

part 'calendar_provider.g.dart';

@riverpod
class CalendarState extends _$CalendarState {
  @override
  ({
    DateTime selectedDay,
    DateTime focusedDay,
    LunarDate lunarDate,
  }) build() {
    final now = DateTime.now();
    return (
      selectedDay: now,
      focusedDay: now,
      lunarDate: LunarDate.fromDateTime(now),
    );
  }

  void selectDay(DateTime day) {
    state = (
      selectedDay: day,
      focusedDay: day,
      lunarDate: LunarDate.fromDateTime(day),
    );
  }

  void focusDay(DateTime day) {
    state = (
      selectedDay: state.selectedDay,
      focusedDay: day,
      lunarDate: state.lunarDate,
    );
  }

  void goToToday() {
    final now = DateTime.now();
    state = (
      selectedDay: now,
      focusedDay: now,
      lunarDate: LunarDate.fromDateTime(now),
    );
  }

  void selectMonth(int month) {
    // Get the last day of the selected month
    final lastDayOfMonth = DateTime(
      state.focusedDay.year,
      month + 1,
      0,
    ).day;

    // Ensure the day is valid for the new month
    final validDay = state.focusedDay.day > lastDayOfMonth
        ? lastDayOfMonth
        : state.focusedDay.day;

    final newDate = DateTime(
      state.focusedDay.year,
      month,
      validDay,
    );

    state = (
      selectedDay: newDate,
      focusedDay: newDate,
      lunarDate: LunarDate.fromDateTime(newDate),
    );
  }

  void selectYear(int year) {
    // Check if current day is Feb 29 and the selected year is not a leap year
    final isCurrentlyFeb29 =
        state.focusedDay.month == 2 && state.focusedDay.day == 29;
    final isSelectedLeapYear =
        year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);

    final validDay =
        isCurrentlyFeb29 && !isSelectedLeapYear ? 28 : state.focusedDay.day;

    final newDate = DateTime(
      year,
      state.focusedDay.month,
      validDay,
    );

    state = (
      selectedDay: newDate,
      focusedDay: newDate,
      lunarDate: LunarDate.fromDateTime(newDate),
    );
  }
}
