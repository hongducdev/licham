import 'package:freezed_annotation/freezed_annotation.dart';

part 'vietnamese_holiday.freezed.dart';
part 'vietnamese_holiday.g.dart';

@freezed
class VietnameseHoliday with _$VietnameseHoliday {
  const factory VietnameseHoliday({
    required String name,
    required int day,
    required int month,
    required bool isLunar,
    String? description,
    @Default(false) bool isOfficial,
  }) = _VietnameseHoliday;

  factory VietnameseHoliday.fromJson(Map<String, dynamic> json) =>
      _$VietnameseHolidayFromJson(json);
}
