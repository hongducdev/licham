import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'reminder.freezed.dart';
part 'reminder.g.dart';

@freezed
class Reminder with _$Reminder {
  const factory Reminder({
    required String id,
    required String title,
    required String description,
    required int lunarDay,
    required int lunarMonth,
    required int lunarYear,
    required bool isYearlyRecurring,
    required bool isMonthlyRecurring,
    required DateTime createdAt,
    DateTime? updatedAt,
    @Default(false) bool isDeleted,
  }) = _Reminder;

  factory Reminder.create({
    required String title,
    required String description,
    required int lunarDay,
    required int lunarMonth,
    required int lunarYear,
    required bool isYearlyRecurring,
    required bool isMonthlyRecurring,
  }) {
    final now = DateTime.now();
    return Reminder(
      id: const Uuid().v4(),
      title: title,
      description: description,
      lunarDay: lunarDay,
      lunarMonth: lunarMonth,
      lunarYear: lunarYear,
      isYearlyRecurring: isYearlyRecurring,
      isMonthlyRecurring: isMonthlyRecurring,
      createdAt: now,
      updatedAt: now,
    );
  }

  factory Reminder.fromJson(Map<String, dynamic> json) =>
      _$ReminderFromJson(json);

  const Reminder._();

  String get lunarDateString =>
      'Ngày $lunarDay tháng $lunarMonth${isYearlyRecurring ? ' hàng năm' : isMonthlyRecurring ? ' hàng tháng' : ' năm $lunarYear'}';
}
