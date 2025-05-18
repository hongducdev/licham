import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:licham/features/calendar/domain/calendar_event.dart';

part 'event_provider.g.dart';

@riverpod
class EventState extends _$EventState {
  @override
  List<CalendarEvent> build() {
    return [];
  }

  void addEvent(CalendarEvent event) {
    state = [...state, event];
  }

  void updateEvent(CalendarEvent event) {
    state = [
      for (final e in state)
        if (e.id == event.id) event else e,
    ];
  }

  void deleteEvent(String id) {
    state = [
      for (final event in state)
        if (event.id == id) event.copyWith(isDeleted: true) else event,
    ];
  }

  List<CalendarEvent> getEventsForDay(DateTime day) {
    return state.where((event) {
      if (event.isDeleted) return false;

      if (!event.isRecurring) {
        return isSameDay(event.date, day);
      }

      switch (event.recurrenceType) {
        case RecurrenceType.none:
          return isSameDay(event.date, day);
        case RecurrenceType.daily:
          return true;
        case RecurrenceType.weekly:
          return event.date.weekday == day.weekday;
        case RecurrenceType.monthly:
          return event.date.day == day.day;
        case RecurrenceType.yearly:
          return event.date.month == day.month && event.date.day == day.day;
        case RecurrenceType.lunarMonthly:
          // TODO: Implement lunar monthly recurrence
          return false;
        case RecurrenceType.lunarYearly:
          // TODO: Implement lunar yearly recurrence
          return false;
      }
    }).toList();
  }
}

bool isSameDay(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}
