import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:licham/features/calendar/domain/vietnamese_holiday.dart';
import 'package:licham/features/calendar/domain/lunar_date.dart';

part 'holiday_provider.g.dart';

@riverpod
class HolidayState extends _$HolidayState {
  @override
  List<VietnameseHoliday> build() {
    return [
      // Solar holidays
      const VietnameseHoliday(
        name: 'Tết Dương lịch',
        day: 1,
        month: 1,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Giỗ Tổ Hùng Vương',
        day: 10,
        month: 3,
        isLunar: true,
      ),
      const VietnameseHoliday(
        name: 'Ngày Giải phóng miền Nam',
        day: 30,
        month: 4,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày Quốc tế Lao động',
        day: 1,
        month: 5,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày Quốc khánh',
        day: 2,
        month: 9,
        isLunar: false,
      ),
      // Lunar holidays
      const VietnameseHoliday(
        name: 'Tết Nguyên đán',
        day: 1,
        month: 1,
        isLunar: true,
      ),
      const VietnameseHoliday(
        name: 'Tết Nguyên đán',
        day: 2,
        month: 1,
        isLunar: true,
      ),
      const VietnameseHoliday(
        name: 'Tết Nguyên đán',
        day: 3,
        month: 1,
        isLunar: true,
      ),
      const VietnameseHoliday(
        name: 'Tết Nguyên đán',
        day: 4,
        month: 1,
        isLunar: true,
      ),
      const VietnameseHoliday(
        name: 'Tết Nguyên đán',
        day: 5,
        month: 1,
        isLunar: true,
      ),
      const VietnameseHoliday(
        name: 'Lễ Thượng Nguyên',
        day: 15,
        month: 1,
        isLunar: true,
      ),
      const VietnameseHoliday(
        name: 'Tết Đoan Ngọ',
        day: 5,
        month: 5,
        isLunar: true,
      ),
      const VietnameseHoliday(
        name: 'Lễ Vu Lan',
        day: 15,
        month: 7,
        isLunar: true,
      ),
      const VietnameseHoliday(
        name: 'Tết Trung Thu',
        day: 15,
        month: 8,
        isLunar: true,
      ),
    ];
  }

  bool isHoliday(DateTime date) {
    final lunarDate = LunarDate.fromDateTime(date);
    return state.any((holiday) {
      if (holiday.isLunar) {
        return holiday.day == lunarDate.day && holiday.month == lunarDate.month;
      } else {
        return holiday.day == date.day && holiday.month == date.month;
      }
    });
  }

  List<VietnameseHoliday> getHolidaysForDay(DateTime date) {
    final lunarDate = LunarDate.fromDateTime(date);
    return state.where((holiday) {
      if (holiday.isLunar) {
        return holiday.day == lunarDate.day && holiday.month == lunarDate.month;
      } else {
        return holiday.day == date.day && holiday.month == date.month;
      }
    }).toList();
  }
}
