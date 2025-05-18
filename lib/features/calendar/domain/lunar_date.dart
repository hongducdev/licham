import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vnlunar/vnlunar.dart';

part 'lunar_date.freezed.dart';
part 'lunar_date.g.dart';

@freezed
class LunarDate with _$LunarDate {
  const factory LunarDate({
    required int day,
    required int month,
    required int year,
    required String solarTerm,
    required bool isLeapMonth,
    required int jd,
    required String dayName,
    required String monthName,
    required String yearName,
    required String tietKhi,
    required String ngayHoangDao,
  }) = _LunarDate;

  factory LunarDate.fromJson(Map<String, dynamic> json) =>
      _$LunarDateFromJson(json);

  factory LunarDate.fromDateTime(DateTime date) {
    const timeZone = 7; // Vietnam timezone
    final lunarDate = convertSolar2Lunar(
      date.day,
      date.month,
      date.year,
      timeZone,
    );

    // Calculate Julian Day Number
    final jd = _jdn(date.day, date.month, date.year);

    // Get Can Chi for day, month, year
    final canChiDay = getCanChiDay(jd);
    final canChiMonth = getCanChiMonth(lunarDate[1], lunarDate[2]);
    final canChiYear = getCanChiYear(lunarDate[2]);

    // Get Tiet Khi
    final tietKhi = getTietKhi(date);

    // Get Hoang Dao days
    final hoangDao = getHoangDao(jd);

    return LunarDate(
      day: lunarDate[0],
      month: lunarDate[1],
      year: lunarDate[2],
      solarTerm: _getSolarTerm(date),
      isLeapMonth: lunarDate[3] == 1,
      jd: jd,
      dayName: canChiDay,
      monthName: canChiMonth,
      yearName: canChiYear,
      tietKhi: tietKhi,
      ngayHoangDao: hoangDao,
    );
  }

  static String _getSolarTerm(DateTime date) {
    final solarTerms = [
      'Lập Xuân',
      'Vũ Thủy',
      'Kinh Trập',
      'Xuân Phân',
      'Thanh Minh',
      'Cốc Vũ',
      'Lập Hạ',
      'Tiểu Mãn',
      'Mang Chủng',
      'Hạ Chí',
      'Tiểu Thử',
      'Đại Thử',
      'Lập Thu',
      'Xử Thử',
      'Bạch Lộ',
      'Thu Phân',
      'Hàn Lộ',
      'Sương Giáng',
      'Lập Đông',
      'Tiểu Tuyết',
      'Đại Tuyết',
      'Đông Chí',
      'Tiểu Hàn',
      'Đại Hàn',
    ];

    final month = date.month;
    final day = date.day;

    // Approximate solar terms based on the Vietnamese calendar
    if (day >= 19 && day <= 21) {
      return solarTerms[(month * 2 - 2) % 24];
    } else if (day >= 4 && day <= 6) {
      return solarTerms[(month * 2 - 1) % 24];
    }

    return '';
  }

  static int _jdn(int dd, int mm, int yy) {
    final a = ((14 - mm) / 12).floor();
    final y = yy + 4800 - a;
    final m = mm + 12 * a - 3;
    final jd = dd +
        ((153 * m + 2) / 5).floor() +
        365 * y +
        (y / 4).floor() -
        (y / 100).floor() +
        (y / 400).floor() -
        32045;
    return jd;
  }
}

// Helper functions for Vietnamese calendar calculations
String getCanChiDay(int jd) {
  final can = [
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
  final chi = [
    'Tý',
    'Sửu',
    'Dần',
    'Mão',
    'Thìn',
    'Tỵ',
    'Ngọ',
    'Mùi',
    'Thân',
    'Dậu',
    'Tuất',
    'Hợi'
  ];
  return '${can[jd % 10]} ${chi[jd % 12]}';
}

String getCanChiMonth(int mm, int yy) {
  final can = [
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
  final chi = [
    'Dần',
    'Mão',
    'Thìn',
    'Tỵ',
    'Ngọ',
    'Mùi',
    'Thân',
    'Dậu',
    'Tuất',
    'Hợi',
    'Tý',
    'Sửu'
  ];
  return '${can[(yy * 12 + mm + 3) % 10]} ${chi[mm - 1]}';
}

String getCanChiYear(int year) {
  final can = [
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
  final chi = [
    'Tý',
    'Sửu',
    'Dần',
    'Mão',
    'Thìn',
    'Tỵ',
    'Ngọ',
    'Mùi',
    'Thân',
    'Dậu',
    'Tuất',
    'Hợi'
  ];

  final canIndex = ((year - 1984) % 10 + 10) % 10;
  final chiIndex = ((year - 1984) % 12 + 12) % 12;

  return '${can[canIndex]} ${chi[chiIndex]}';
}

String getTietKhi(DateTime date) {
  final tietKhi = [
    'Tiểu Hàn',
    'Đại Hàn',
    'Lập Xuân',
    'Vũ Thủy',
    'Kinh Trập',
    'Xuân Phân',
    'Thanh Minh',
    'Cốc Vũ',
    'Lập Hạ',
    'Tiểu Mãn',
    'Mang Chủng',
    'Hạ Chí',
    'Tiểu Thử',
    'Đại Thử',
    'Lập Thu',
    'Xử Thử',
    'Bạch Lộ',
    'Thu Phân',
    'Hàn Lộ',
    'Sương Giáng',
    'Lập Đông',
    'Tiểu Tuyết',
    'Đại Tuyết',
    'Đông Chí'
  ];

  final idx = ((date.month - 1) * 2 + (date.day > 15 ? 1 : 0)) % 24;
  return tietKhi[idx];
}

String getHoangDao(int jd) {
  final hoangDao = [
    'Thiên Đức',
    'Nguyệt Đức',
    'Thiên Giải',
    'Thiên Hỷ',
    'Thiên Ấn',
    'Thiên Quý'
  ];
  final chiDay = jd % 12;
  final monthBase = ((jd + 1) % 12) * 2;

  for (var i = 0; i < 6; i++) {
    if (chiDay == (monthBase + i) % 12) {
      return hoangDao[i];
    }
  }
  return 'Hắc Đạo';
}
