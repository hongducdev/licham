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
        name: 'Ngày truyền thông học sinh, sinh viên Việt Nam',
        day: 9,
        month: 1,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày thành lập Đảng Cộng sản Việt Nam',
        day: 3,
        month: 2,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Lễ Tình nhân (Valentine đỏ)',
        day: 14,
        month: 2,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày thầy thuốc Việt Nam',
        day: 27,
        month: 2,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày Quốc tế phụ nữ',
        day: 8,
        month: 3,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Lễ Tình nhân (Valentine trắng)',
        day: 14,
        month: 3,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày Quốc tế Hạnh phúc',
        day: 20,
        month: 3,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày thành lập Đoàn Thanh niên Cộng sản Hồ Chí Minh',
        day: 26,
        month: 3,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Lễ Tình nhân (Valentine đen)',
        day: 14,
        month: 4,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Giỗ Tổ Hùng Vương',
        day: 10,
        month: 3,
        isLunar: true,
      ),
      const VietnameseHoliday(
        name: 'Ngày Cá tháng Tư',
        day: 1,
        month: 4,
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
        name: 'Ngày của mẹ',
        day: 13,
        month: 5,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày Quốc tế thiếu nhi',
        day: 1,
        month: 6,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày của cha',
        day: 17,
        month: 6,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày báo chí Việt Nam',
        day: 21,
        month: 6,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày gia đình Việt Nam',
        day: 28,
        month: 6,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày dân số thế giới',
        day: 11,
        month: 7,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày Thương binh liệt sĩ',
        day: 27,
        month: 7,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày thành lập công đoàn Việt Nam',
        day: 28,
        month: 7,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày kỷ niệm Cách mạng tháng 8 thành công',
        day: 19,
        month: 8,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Lễ Thất tịch',
        day: 7,
        month: 7,
        isLunar: true,
      ),
      const VietnameseHoliday(
        name: 'Ngày Quốc khánh',
        day: 2,
        month: 9,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày thành lập Mặt trận Tổ quốc Việt Nam',
        day: 10,
        month: 9,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày quốc tế người cao tuổi',
        day: 1,
        month: 10,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày giải phóng thủ đô',
        day: 10,
        month: 10,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày doanh nhân Việt Nam',
        day: 13,
        month: 10,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày thành lập Hội liên hiệp phụ nữ Việt Nam',
        day: 20,
        month: 10,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày Halloween',
        day: 31,
        month: 10,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày pháp luật Việt Nam',
        day: 9,
        month: 11,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày Quốc tế Năm giới',
        day: 19,
        month: 11,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày nhà giáo Việt Nam',
        day: 20,
        month: 11,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày thành lập Hội chữ thập đỏ Việt Nam',
        day: 23,
        month: 11,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày thế giới phòng chống AIDS',
        day: 1,
        month: 12,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày toàn quốc kháng chiến',
        day: 19,
        month: 12,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày thành lập quân đội nhân dân Việt Nam',
        day: 22,
        month: 12,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày lễ Giáng sinh',
        day: 24,
        month: 12,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ngày lễ Giáng sinh',
        day: 25,
        month: 12,
        isLunar: false,
      ),
      const VietnameseHoliday(
        name: 'Ông Táo về trời',
        day: 23,
        month: 12,
        isLunar: true,
      ),
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
        day: 3,
        month: 3,
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
      const VietnameseHoliday(
        name: 'Tết Trùng Cửu',
        day: 9,
        month: 9,
        isLunar: true,
      ),
      const VietnameseHoliday(
        name: 'Tết Trùng thập',
        day: 10,
        month: 10,
        isLunar: true,
      ),
      const VietnameseHoliday(
        name: 'Tết Hạ Nguyên',
        day: 4,
        month: 10,
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
