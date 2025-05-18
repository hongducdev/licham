import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:licham/features/reminder/models/reminder.dart';
import 'package:licham/core/services/storage_service.dart';

part 'reminder_provider.g.dart';

@riverpod
class ReminderList extends _$ReminderList {
  StorageService get _storage => ref.read(storageServiceProvider.notifier);

  @override
  Future<List<Reminder>> build() async {
    return _storage.loadReminders();
  }

  Future<void> addReminder(Reminder reminder) async {
    final currentState = await future;
    state = AsyncData([...currentState, reminder]);
    await _saveReminders();
  }

  Future<void> updateReminder(Reminder reminder) async {
    final currentState = await future;
    state = AsyncData([
      for (final r in currentState)
        if (r.id == reminder.id) reminder else r,
    ]);
    await _saveReminders();
  }

  Future<void> deleteReminder(String id) async {
    final currentState = await future;
    state = AsyncData([
      for (final reminder in currentState)
        if (reminder.id == id) reminder.copyWith(isDeleted: true) else reminder,
    ]);
    await _saveReminders();
  }

  Future<void> restoreReminder(String id) async {
    final currentState = await future;
    state = AsyncData([
      for (final reminder in currentState)
        if (reminder.id == id)
          reminder.copyWith(isDeleted: false)
        else
          reminder,
    ]);
    await _saveReminders();
  }

  List<Reminder> getRemindersForLunarDate(
    int lunarDay,
    int lunarMonth,
    int lunarYear,
  ) {
    final currentState = state.valueOrNull;
    if (currentState == null) return [];

    return currentState.where((reminder) {
      if (reminder.isDeleted) return false;

      final isDateMatch =
          reminder.lunarDay == lunarDay && reminder.lunarMonth == lunarMonth;

      if (reminder.isMonthlyRecurring) {
        return isDateMatch;
      }

      if (reminder.isYearlyRecurring) {
        return isDateMatch;
      }

      return isDateMatch && reminder.lunarYear == lunarYear;
    }).toList();
  }

  Future<void> _saveReminders() async {
    final currentState = await future;
    await _storage.saveReminders(currentState);
  }
}
