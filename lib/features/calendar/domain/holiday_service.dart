import 'package:vnlunar/vnlunar.dart';
import 'package:licham/features/calendar/domain/vietnamese_holiday.dart';

class HolidayService {
  static List<VietnameseHoliday> getHolidaysForMonth(int month, int year) {
    final List<VietnameseHoliday> holidays = [];

    // Thêm các ngày lễ dương lịch cố định
    _addSolarHolidays(holidays, month);

    // Thêm các ngày lễ âm lịch
    _addLunarHolidays(holidays, month, year);

    return holidays;
  }

  static void _addSolarHolidays(List<VietnameseHoliday> holidays, int month) {
    switch (month) {
      case 1:
        holidays.add(const VietnameseHoliday(
          name: 'Tết Dương lịch',
          day: 1,
          month: 1,
          isLunar: false,
          description: 'Ngày đầu năm mới dương lịch',
          isOfficial: true,
        ));
        break;
      case 2:
        holidays.add(const VietnameseHoliday(
          name: 'Ngày Lễ tình nhân',
          day: 14,
          month: 2,
          isLunar: false,
          description: 'Valentine\'s Day',
          isOfficial: false,
        ));
        break;
      case 3:
        holidays.add(const VietnameseHoliday(
          name: 'Ngày Quốc tế Phụ nữ',
          day: 8,
          month: 3,
          isLunar: false,
          description: 'International Women\'s Day',
          isOfficial: false,
        ));
        break;
      case 4:
        holidays.add(const VietnameseHoliday(
          name: 'Ngày Giỗ Tổ Hùng Vương',
          day: 10,
          month: 3,
          isLunar: true,
          description: 'Lễ hội đền Hùng',
          isOfficial: true,
        ));
        holidays.add(const VietnameseHoliday(
          name: 'Ngày Giải phóng miền Nam',
          day: 30,
          month: 4,
          isLunar: false,
          description: 'Ngày thống nhất đất nước',
          isOfficial: true,
        ));
        break;
      case 5:
        holidays.add(const VietnameseHoliday(
          name: 'Ngày Quốc tế Lao động',
          day: 1,
          month: 5,
          isLunar: false,
          description: 'International Labor Day',
          isOfficial: true,
        ));
        break;
      case 6:
        holidays.add(const VietnameseHoliday(
          name: 'Ngày Quốc tế Thiếu nhi',
          day: 1,
          month: 6,
          isLunar: false,
          description: 'International Children\'s Day',
          isOfficial: false,
        ));
        break;
      case 7:
        holidays.add(const VietnameseHoliday(
          name: 'Ngày Thương binh Liệt sĩ',
          day: 27,
          month: 7,
          isLunar: false,
          description: 'War Invalids and Martyrs Day',
          isOfficial: true,
        ));
        break;
      case 9:
        holidays.add(const VietnameseHoliday(
          name: 'Ngày Quốc khánh',
          day: 2,
          month: 9,
          isLunar: false,
          description: 'Ngày độc lập',
          isOfficial: true,
        ));
        break;
      case 10:
        holidays.add(const VietnameseHoliday(
          name: 'Ngày Giải phóng Thủ đô',
          day: 10,
          month: 10,
          isLunar: false,
          description: 'Hanoi Liberation Day',
          isOfficial: false,
        ));
        holidays.add(const VietnameseHoliday(
          name: 'Ngày Phụ nữ Việt Nam',
          day: 20,
          month: 10,
          isLunar: false,
          description: 'Vietnamese Women\'s Day',
          isOfficial: false,
        ));
        break;
      case 11:
        holidays.add(const VietnameseHoliday(
          name: 'Ngày Nhà giáo Việt Nam',
          day: 20,
          month: 11,
          isLunar: false,
          description: 'Vietnamese Teachers\' Day',
          isOfficial: false,
        ));
        break;
      case 12:
        holidays.add(const VietnameseHoliday(
          name: 'Ngày thành lập Quân đội Nhân dân Việt Nam',
          day: 22,
          month: 12,
          isLunar: false,
          description: 'Vietnamese People\'s Army Day',
          isOfficial: false,
        ));
        holidays.add(const VietnameseHoliday(
          name: 'Lễ Giáng sinh',
          day: 25,
          month: 12,
          isLunar: false,
          description: 'Christmas Day',
          isOfficial: false,
        ));
        break;
    }
  }

  static void _addLunarHolidays(
    List<VietnameseHoliday> holidays,
    int month,
    int year,
  ) {
    // Lấy tất cả các ngày trong tháng
    final DateTime firstDayOfMonth = DateTime(year, month, 1);
    final DateTime lastDayOfMonth = DateTime(year, month + 1, 0);

    const timeZone = 7; // Vietnam timezone

    for (int day = 1; day <= lastDayOfMonth.day; day++) {
      final date = DateTime(year, month, day);
      final lunarDate = convertSolar2Lunar(day, month, year, timeZone);

      // Tết Nguyên đán (mùng 1-5 tháng 1)
      if (lunarDate[1] == 1 && lunarDate[0] >= 1 && lunarDate[0] <= 5) {
        holidays.add(VietnameseHoliday(
          name: 'Tết Nguyên đán',
          day: lunarDate[0],
          month: lunarDate[1],
          isLunar: true,
          description: 'Ngày ${lunarDate[0]} tháng Giêng',
          isOfficial: true,
        ));
      }

      // Các ngày lễ âm lịch truyền thống
      _addTraditionalLunarHolidays(holidays, lunarDate[0], lunarDate[1]);
    }
  }

  static void _addTraditionalLunarHolidays(
    List<VietnameseHoliday> holidays,
    int lunarDay,
    int lunarMonth,
  ) {
    // Tết Hàn thực (3/3)
    if (lunarMonth == 3 && lunarDay == 3) {
      holidays.add(const VietnameseHoliday(
        name: 'Tết Hàn thực',
        day: 3,
        month: 3,
        isLunar: true,
        description: 'Lễ hội bánh trôi bánh chay',
        isOfficial: false,
      ));
    }

    // Tết Đoan ngọ (5/5)
    if (lunarMonth == 5 && lunarDay == 5) {
      holidays.add(const VietnameseHoliday(
        name: 'Tết Đoan ngọ',
        day: 5,
        month: 5,
        isLunar: true,
        description: 'Lễ diệt sâu bọ, tránh dịch bệnh',
        isOfficial: false,
      ));
    }

    // Lễ Vu lan (15/7)
    if (lunarMonth == 7 && lunarDay == 15) {
      holidays.add(const VietnameseHoliday(
        name: 'Lễ Vu lan',
        day: 15,
        month: 7,
        isLunar: true,
        description: 'Ngày báo hiếu',
        isOfficial: false,
      ));
    }

    // Tết Trung thu (15/8)
    if (lunarMonth == 8 && lunarDay == 15) {
      holidays.add(const VietnameseHoliday(
        name: 'Tết Trung thu',
        day: 15,
        month: 8,
        isLunar: true,
        description: 'Tết thiếu nhi',
        isOfficial: false,
      ));
    }

    // Tết Thượng nguyên (15/1)
    if (lunarMonth == 1 && lunarDay == 15) {
      holidays.add(const VietnameseHoliday(
        name: 'Tết Thượng nguyên',
        day: 15,
        month: 1,
        isLunar: true,
        description: 'Lễ hội đèn lồng',
        isOfficial: false,
      ));
    }

    // Tết Hạ nguyên (15/7)
    if (lunarMonth == 7 && lunarDay == 15) {
      holidays.add(const VietnameseHoliday(
        name: 'Tết Hạ nguyên',
        day: 15,
        month: 7,
        isLunar: true,
        description: 'Xá tội vong nhân',
        isOfficial: false,
      ));
    }

    // Tết Trung nguyên (15/8)
    if (lunarMonth == 8 && lunarDay == 15) {
      holidays.add(const VietnameseHoliday(
        name: 'Tết Trung nguyên',
        day: 15,
        month: 8,
        isLunar: true,
        description: 'Cúng cô hồn',
        isOfficial: false,
      ));
    }
  }
}

final holidays = HolidayService.getHolidaysForMonth(1, 2024);
