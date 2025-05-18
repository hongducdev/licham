import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:licham/features/reminder/models/reminder.dart';

part 'storage_service.g.dart';

@riverpod
class StorageService extends _$StorageService {
  static const _remindersKey = 'reminders';

  @override
  Future<SharedPreferences> build() => SharedPreferences.getInstance();

  Future<List<Reminder>> loadReminders() async {
    final prefs = await future;
    final remindersJson = prefs.getStringList(_remindersKey) ?? [];
    return remindersJson
        .map((json) => Reminder.fromJson(jsonDecode(json)))
        .toList();
  }

  Future<void> saveReminders(List<Reminder> reminders) async {
    final prefs = await future;
    final remindersJson =
        reminders.map((reminder) => jsonEncode(reminder.toJson())).toList();
    await prefs.setStringList(_remindersKey, remindersJson);
  }
}
