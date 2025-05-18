import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:licham/core/models/holiday.dart';
import 'package:licham/core/utils/lunar_calculator.dart';

part 'holiday_provider.g.dart';

@riverpod
class HolidayList extends _$HolidayList {
  static const List<Holiday> _solarHolidays = [
    Holiday(day: 1, month: 1, name: 'Tết Dương lịch'),
    Holiday(day: 9, month: 1, name: 'Ngày Học sinh - Sinh viên Việt Nam'),
    Holiday(day: 3, month: 2, name: 'Ngày thành lập Đảng Cộng sản Việt Nam'),
    Holiday(day: 27, month: 2, name: 'Ngày Thầy thuốc Việt Nam'),
    Holiday(day: 8, month: 3, name: 'Ngày Quốc tế Phụ nữ'),
    Holiday(
        day: 26,
        month: 3,
        name: 'Ngày thành lập Đoàn Thanh niên Cộng sản Hồ Chí Minh'),
    Holiday(day: 21, month: 4, name: 'Ngày Sách Việt Nam'),
    Holiday(day: 30, month: 4, name: 'Ngày Thống nhất đất nước'),
    Holiday(day: 1, month: 5, name: 'Ngày Quốc tế Lao động'),
    Holiday(
        day: 15,
        month: 5,
        name: 'Ngày thành lập Đội Thiếu niên Tiền phong Hồ Chí Minh'),
    Holiday(day: 19, month: 5, name: 'Ngày sinh của Chủ tịch Hồ Chí Minh'),
    Holiday(day: 1, month: 6, name: 'Ngày Quốc tế Thiếu nhi'),
    Holiday(day: 5, month: 6, name: 'Ngày Bác Hồ ra đi tìm đường cứu nước'),
    Holiday(day: 27, month: 7, name: 'Ngày Thương binh Liệt sĩ'),
    Holiday(day: 19, month: 8, name: 'Ngày Cách mạng tháng Tám thành công'),
    Holiday(day: 2, month: 9, name: 'Ngày Quốc khánh'),
    Holiday(day: 13, month: 10, name: 'Ngày Doanh nhân Việt Nam'),
    Holiday(day: 20, month: 10, name: 'Ngày thành lập Hội Phụ nữ Việt Nam'),
    Holiday(day: 20, month: 11, name: 'Ngày Nhà giáo Việt Nam'),
    Holiday(
        day: 22, month: 12, name: 'Ngày thành lập Quân đội Nhân dân Việt Nam'),
    Holiday(day: 24, month: 12, name: 'Ngày Lễ Giáng Sinh'),
  ];

  static const List<Holiday> _lunarHolidays = [
    Holiday(day: 1, month: 1, name: 'Tết Nguyên Đán', isLunar: true),
    Holiday(day: 15, month: 1, name: 'Tết Nguyên tiêu', isLunar: true),
    Holiday(day: 3, month: 3, name: 'Tết Hàn thực', isLunar: true),
    Holiday(day: 10, month: 3, name: 'Giỗ Tổ Hùng Vương', isLunar: true),
    Holiday(day: 15, month: 4, name: 'Lễ Phật Đản', isLunar: true),
    Holiday(day: 5, month: 5, name: 'Tết Đoan ngọ', isLunar: true),
    Holiday(day: 15, month: 7, name: 'Vu Lan', isLunar: true),
    Holiday(day: 15, month: 8, name: 'Tết Trung thu', isLunar: true),
    Holiday(day: 23, month: 12, name: 'Ông Táo chầu trời', isLunar: true),
  ];

  @override
  List<Holiday> build() => [..._solarHolidays, ..._lunarHolidays];

  bool isHoliday(DateTime date) {
    return getHolidaysForDate(date).isNotEmpty;
  }

  List<Holiday> getHolidaysForDate(DateTime date) {
    final List<Holiday> holidays = [];

    // Check solar holidays
    for (final holiday in _solarHolidays) {
      if (holiday.day == date.day && holiday.month == date.month) {
        holidays.add(holiday);
      }
    }

    // Check lunar holidays
    final lunarDate = LunarCalculator.convertSolar2Lunar(
      date.day,
      date.month,
      date.year,
    );
    for (final holiday in _lunarHolidays) {
      if (holiday.day == lunarDate[0] && holiday.month == lunarDate[1]) {
        holidays.add(holiday);
      }
    }

    return holidays;
  }
}
