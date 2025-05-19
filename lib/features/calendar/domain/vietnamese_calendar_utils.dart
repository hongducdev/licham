// Constants for Vietnamese calendar calculations
class VietnameseCalendarConstants {
  static const List<String> CAN = [
    'Giáp',
    'Ất',
    'Bính',
    'Đinh',
    'Mậu',
    'Kỷ',
    'Canh',
    'Tân',
    'Nhâm',
    'Quý'
  ];

  static const List<String> CHI = [
    'Tý',
    'Sửu',
    'Dần',
    'Mẹo',
    'Thìn',
    'Tỵ',
    'Ngọ',
    'Mùi',
    'Thân',
    'Dậu',
    'Tuất',
    'Hợi'
  ];

  static const List<String> TUAN = [
    'Chủ Nhật',
    'Thứ Hai',
    'Thứ Ba',
    'Thứ Tư',
    'Thứ Năm',
    'Thứ Sáu',
    'Thứ Bảy'
  ];

  static const List<String> GIO_HD = [
    '110100101100',
    '001101001011',
    '110011010010',
    '101100110100',
    '001011001101',
    '010010110011'
  ];

  static const List<String> TIET_KHI = [
    'Xuân phân',
    'Thanh minh',
    'Cốc vũ',
    'Lập hạ',
    'Tiểu mãn',
    'Mang chủng',
    'Hạ chí',
    'Tiểu thử',
    'Đại thử',
    'Lập thu',
    'Xử thử',
    'Bạch lộ',
    'Thu phân',
    'Hàn lộ',
    'Sương giáng',
    'Lập đông',
    'Tiểu tuyết',
    'Đại tuyết',
    'Đông chí',
    'Tiểu hàn',
    'Đại hàn',
    'Lập xuân',
    'Vũ thủy',
    'Kinh trập'
  ];

  static const List<String> THANG = [
    'Một',
    'Hai',
    'Ba',
    'Bốn',
    'Năm',
    'Sáu',
    'Bảy',
    'Tám',
    'Chín',
    'Mười',
    'Mười một',
    'Mười hai'
  ];

  static const Map<String, List<Map<String, dynamic>>> HOLIDAYS = {
    'solar': [
      {'d': 1, 'm': 1, 'name': 'Tết Dương lịch'},
      {'d': 9, 'm': 1, 'name': 'Ngày Học sinh - Sinh viên Việt Nam'},
      {'d': 14, 'm': 2, 'name': 'Ngày Lễ tình nhân'},
      {'d': 3, 'm': 2, 'name': 'Ngày thành lập Đảng Cộng sản Việt Nam'},
      {'d': 27, 'm': 2, 'name': 'Ngày Thầy thuốc Việt Nam'},
      {'d': 8, 'm': 3, 'name': 'Ngày Quốc tế Phụ nữ'},
      {
        'd': 26,
        'm': 3,
        'name': 'Ngày thành lập Đoàn Thanh niên Cộng sản Hồ Chí Minh'
      },
      {'d': 30, 'm': 4, 'name': 'Ngày Giải phóng miền Nam'},
      {'d': 1, 'm': 5, 'name': 'Ngày Quốc tế Lao động'},
      {'d': 19, 'm': 5, 'name': 'Ngày sinh của Chủ tịch Hồ Chí Minh'},
      {'d': 1, 'm': 6, 'name': 'Ngày Quốc tế Thiếu nhi'},
      {'d': 27, 'm': 7, 'name': 'Ngày Thương binh Liệt sĩ'},
      {'d': 19, 'm': 8, 'name': 'Ngày Cách mạng tháng Tám thành công'},
      {'d': 2, 'm': 9, 'name': 'Ngày Quốc khánh'},
      {'d': 10, 'm': 10, 'name': 'Ngày Giải phóng Thủ đô'},
      {'d': 20, 'm': 10, 'name': 'Ngày Phụ nữ Việt Nam'},
      {'d': 20, 'm': 11, 'name': 'Ngày Nhà giáo Việt Nam'},
      {'d': 22, 'm': 12, 'name': 'Ngày thành lập Quân đội Nhân dân Việt Nam'},
      {'d': 25, 'm': 12, 'name': 'Lễ Giáng sinh'}
    ],
    'lunar': [
      {'d': 1, 'm': 1, 'name': 'Tết Nguyên Đán'},
      {'d': 15, 'm': 1, 'name': 'Tết Thượng nguyên'}, // còn gọi là Nguyên tiêu
      {'d': 3, 'm': 3, 'name': 'Tết Hàn thực'},
      {'d': 10, 'm': 3, 'name': 'Giỗ Tổ Hùng Vương'},
      {'d': 5, 'm': 5, 'name': 'Tết Đoan ngọ'},
      {'d': 15, 'm': 7, 'name': 'Lễ Vu lan'}, // còn gọi là Tết Hạ nguyên
      {'d': 15, 'm': 8, 'name': 'Tết Trung thu'}, // cũng là Tết Trung nguyên
      {'d': 23, 'm': 12, 'name': 'Ông Táo chầu trời'}
    ]
  };
}

class VietnameseCalendarUtils {
  static String getCanChiYear(int year) {
    final can = VietnameseCalendarConstants.CAN[(year + 6) % 10];
    final chi = VietnameseCalendarConstants.CHI[(year + 8) % 12];
    return '$can $chi';
  }

  static String getCanChiMonth(int month, int year) {
    final can = VietnameseCalendarConstants.CAN[(year * 12 + month + 3) % 10];
    final chi = VietnameseCalendarConstants.CHI[(month + 1) % 12];
    return '$can $chi';
  }

  static String getCanChiDay(int jd) {
    final can = VietnameseCalendarConstants.CAN[(jd + 9) % 10];
    final chi = VietnameseCalendarConstants.CHI[(jd + 1) % 12];
    return '$can $chi';
  }

  static String getGioHoangDao(int jd) {
    final chiOfDay = (jd + 1) % 12;
    final gioHD = VietnameseCalendarConstants.GIO_HD[chiOfDay % 6];
    final List<String> result = [];

    for (var i = 0; i < 12; i++) {
      if (gioHD[i] == '1') {
        final startHour = (i * 2 + 23) % 24;
        final endHour = (i * 2 + 1) % 24;
        result
            .add('${VietnameseCalendarConstants.CHI[i]} ($startHour-$endHour)');
      }
    }

    return result.join(', ');
  }

  static List<String> getHolidays(int day, int month, {bool isLunar = false}) {
    final List<String> holidays = [];
    final holidayList = isLunar
        ? VietnameseCalendarConstants.HOLIDAYS['lunar']!
        : VietnameseCalendarConstants.HOLIDAYS['solar']!;

    for (final holiday in holidayList) {
      if (holiday['d'] == day && holiday['m'] == month) {
        holidays.add(
            '${holiday['name']} (${holiday['d']}/${holiday['m']} ${isLunar ? 'ÂL' : 'DL'})');
      }
    }

    return holidays;
  }

  static String getTietKhi(int index) {
    return VietnameseCalendarConstants.TIET_KHI[index % 24];
  }

  static String getWeekdayName(int jd) {
    return VietnameseCalendarConstants.TUAN[(jd + 1) % 7];
  }

  static String getMonthName(int month) {
    return 'Tháng ${VietnameseCalendarConstants.THANG[month - 1]}';
  }

  static int getPhatLich(int lunarDay, int lunarMonth, int lunarYear) {
    return (lunarMonth > 4 || (lunarMonth >= 4 && lunarDay >= 15))
        ? lunarYear + 544
        : lunarYear + 543;
  }
}
