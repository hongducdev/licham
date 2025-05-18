import 'dart:math' as math;
import 'package:vnlunar/vnlunar.dart';

class LunarCalculator {
  static const double PI = math.pi;
  static const int TIMEZONE = 7; // Múi giờ Việt Nam (GMT+7)

  // Chuyển đổi ngày dương lịch sang số ngày Julius
  static int jdFromDate(int dd, int mm, int yy) {
    int a = (14 - mm) ~/ 12;
    int y = yy + 4800 - a;
    int m = mm + 12 * a - 3;
    int jd = dd +
        ((153 * m + 2) ~/ 5) +
        365 * y +
        (y ~/ 4) -
        (y ~/ 100) +
        (y ~/ 400) -
        32045;
    if (jd < 2299161) {
      jd = dd + ((153 * m + 2) ~/ 5) + 365 * y + (y ~/ 4) - 32083;
    }
    return jd;
  }

  // Chuyển đổi số ngày Julius sang ngày dương lịch
  static List<int> jdToDate(int jd) {
    int a, b, c, d, e, m, day, month, year;
    if (jd > 2299160) {
      a = jd + 32044;
      b = ((4 * a + 3) ~/ 146097);
      c = a - ((b * 146097) ~/ 4);
    } else {
      b = 0;
      c = jd + 32082;
    }
    d = ((4 * c + 3) ~/ 1461);
    e = c - ((1461 * d) ~/ 4);
    m = ((5 * e + 2) ~/ 153);
    day = e - ((153 * m + 2) ~/ 5) + 1;
    month = m + 3 - 12 * (m ~/ 10);
    year = b * 100 + d - 4800 + (m ~/ 10);
    return [day, month, year];
  }

  // Tính ngày Sóc
  static int getNewMoonDay(int k) {
    double T = k / 1236.85; // Time in Julian centuries from 1900 January 0.5
    double T2 = T * T;
    double T3 = T2 * T;
    double dr = PI / 180;
    double Jd1 =
        2415020.75933 + 29.53058868 * k + 0.0001178 * T2 - 0.000000155 * T3;
    Jd1 = Jd1 + 0.00033 * math.sin((166.56 + 132.87 * T - 0.009173 * T2) * dr);
    double M = 359.2242 + 29.10535608 * k - 0.0000333 * T2 - 0.00000347 * T3;
    double Mpr = 306.0253 + 385.81691806 * k + 0.0107306 * T2 + 0.00001236 * T3;
    double F = 21.2964 + 390.67050646 * k - 0.0016528 * T2 - 0.00000239 * T3;
    double C1 = (0.1734 - 0.000393 * T) * math.sin(M * dr) +
        0.0021 * math.sin(2 * dr * M);
    C1 = C1 - 0.4068 * math.sin(Mpr * dr) + 0.0161 * math.sin(dr * 2 * Mpr);
    C1 = C1 - 0.0004 * math.sin(dr * 3 * Mpr);
    C1 = C1 + 0.0104 * math.sin(dr * 2 * F) - 0.0051 * math.sin(dr * (M + Mpr));
    C1 = C1 -
        0.0074 * math.sin(dr * (M - Mpr)) +
        0.0004 * math.sin(dr * (2 * F + M));
    C1 = C1 -
        0.0004 * math.sin(dr * (2 * F - M)) -
        0.0006 * math.sin(dr * (2 * F + Mpr));
    C1 = C1 +
        0.0010 * math.sin(dr * (2 * F - Mpr)) +
        0.0005 * math.sin(dr * (2 * Mpr + M));
    double deltat;
    if (T < -11) {
      deltat = 0.001 +
          0.000839 * T +
          0.0002261 * T2 -
          0.00000845 * T3 -
          0.000000081 * T * T3;
    } else {
      deltat = -0.000278 + 0.000265 * T + 0.000262 * T2;
    }
    double JdNew = Jd1 + C1 - deltat;
    return (JdNew + 0.5 + TIMEZONE / 24).floor();
  }

  // Tính tọa độ mặt trời
  static int getSunLongitude(int jdn) {
    double T = (jdn - 2451545.5 - TIMEZONE / 24) / 36525;
    double T2 = T * T;
    double dr = PI / 180;
    double M =
        357.52910 + 35999.05030 * T - 0.0001559 * T2 - 0.00000048 * T * T2;
    double L0 = 280.46645 + 36000.76983 * T + 0.0003032 * T2;
    double DL = (1.914600 - 0.004817 * T - 0.000014 * T2) * math.sin(dr * M);
    DL = DL +
        (0.019993 - 0.000101 * T) * math.sin(dr * 2 * M) +
        0.000290 * math.sin(dr * 3 * M);
    double L = L0 + DL;
    L = L * dr;
    L = L - PI * 2 * ((L / (PI * 2)).floor());
    return (L / PI * 6).floor();
  }

  // Tìm ngày bắt đầu tháng 11 âm lịch
  static int getLunarMonth11(int yy) {
    int off = jdFromDate(31, 12, yy) - 2415021;
    int k = off ~/ 29.530588853;
    int nm = getNewMoonDay(k);
    int sunLong = getSunLongitude(nm);
    if (sunLong >= 9) {
      nm = getNewMoonDay(k - 1);
    }
    return nm;
  }

  // Xác định tháng nhuận
  static int getLeapMonthOffset(int a11) {
    int k = ((a11 - 2415021.076998695) / 29.530588853 + 0.5).floor();
    int last = 0;
    int i = 1;
    int arc = getSunLongitude(getNewMoonDay(k + i));
    do {
      last = arc;
      i++;
      arc = getSunLongitude(getNewMoonDay(k + i));
    } while (arc != last && i < 14);
    return i - 1;
  }

  // Chuyển đổi ngày dương lịch sang âm lịch
  static List<int> convertSolar2Lunar(int dd, int mm, int yy) {
    int dayNumber = jdFromDate(dd, mm, yy);
    int k = ((dayNumber - 2415021.076998695) / 29.530588853).floor();
    int monthStart = getNewMoonDay(k + 1);
    if (monthStart > dayNumber) {
      monthStart = getNewMoonDay(k);
    }
    int a11 = getLunarMonth11(yy);
    int b11 = a11;
    int lunarYear;
    if (a11 >= monthStart) {
      lunarYear = yy;
      a11 = getLunarMonth11(yy - 1);
    } else {
      lunarYear = yy + 1;
      b11 = getLunarMonth11(yy + 1);
    }
    int lunarDay = dayNumber - monthStart + 1;
    int diff = (monthStart - a11) ~/ 29;
    int lunarLeap = 0;
    int lunarMonth = diff + 11;
    if (b11 - a11 > 365) {
      int leapMonthDiff = getLeapMonthOffset(a11);
      if (diff >= leapMonthDiff) {
        lunarMonth = diff + 10;
        if (diff == leapMonthDiff) {
          lunarLeap = 1;
        }
      }
    }
    if (lunarMonth > 12) {
      lunarMonth = lunarMonth - 12;
    }
    if (lunarMonth >= 11 && diff < 4) {
      lunarYear -= 1;
    }
    return [lunarDay, lunarMonth, lunarYear, lunarLeap];
  }

  // Chuyển đổi ngày âm lịch sang dương lịch
  static List<int> convertLunar2Solar(
      int lunarDay, int lunarMonth, int lunarYear, int lunarLeap) {
    int k, a11, b11, off, leapOff, leapMonth, monthStart;
    if (lunarMonth < 11) {
      a11 = getLunarMonth11(lunarYear - 1);
      b11 = getLunarMonth11(lunarYear);
    } else {
      a11 = getLunarMonth11(lunarYear);
      b11 = getLunarMonth11(lunarYear + 1);
    }
    off = lunarMonth - 11;
    if (off < 0) {
      off += 12;
    }
    if (b11 - a11 > 365) {
      leapOff = getLeapMonthOffset(a11);
      leapMonth = leapOff - 2;
      if (leapMonth < 0) {
        leapMonth += 12;
      }
      if (lunarLeap != 0 && lunarMonth != leapMonth) {
        return [0, 0, 0];
      } else if (lunarLeap != 0 || off >= leapOff) {
        off += 1;
      }
    }
    k = (0.5 + (a11 - 2415021.076998695) / 29.530588853).floor();
    monthStart = getNewMoonDay(k + off);
    return jdToDate(monthStart + lunarDay - 1);
  }

  // Tính Can Chi cho ngày
  static String getCanChiDay(int jd) {
    final List<String> CAN = [
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
    final List<String> CHI = [
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
    return '${CAN[(jd + 9) % 10]} ${CHI[(jd + 1) % 12]}';
  }

  // Tính Can Chi cho tháng
  static String getCanChiMonth(int month, int year) {
    final List<String> CAN = [
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
    final List<String> CHI = [
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
    return '${CAN[(year * 12 + month + 3) % 10]} ${CHI[(month + 1) % 12]}';
  }

  // Tính Can Chi cho năm
  static String getCanChiYear(int year) {
    final List<String> CAN = [
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
    final List<String> CHI = [
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
    return '${CAN[(year + 6) % 10]} ${CHI[(year + 8) % 12]}';
  }

  // Lấy tên gọi của Tiết khí
  static String getSolarTerm(int jd) {
    final List<String> TIET_KHI = [
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
    int sunLongitude = getSunLongitude(jd);
    return TIET_KHI[sunLongitude];
  }

  static List<int> getSolarToLunar(DateTime date) {
    return convertSolar2Lunar(date.day, date.month, date.year);
  }

  static String getTiet(DateTime date) {
    final jd = jdFromDate(date.day, date.month, date.year);
    return getSolarTerm(jd);
  }

  static List<String> getHoangDao(DateTime date) {
    final List<String> GIO_HD = [
      'Tý (23:00-1:00)',
      'Sửu (1:00-3:00)',
      'Dần (3:00-5:00)',
      'Mão (5:00-7:00)',
      'Thìn (7:00-9:00)',
      'Tỵ (9:00-11:00)',
      'Ngọ (11:00-13:00)',
      'Mùi (13:00-15:00)',
      'Thân (15:00-17:00)',
      'Dậu (17:00-19:00)',
      'Tuất (19:00-21:00)',
      'Hợi (21:00-23:00)',
    ];

    final jd = jdFromDate(date.day, date.month, date.year);
    final chiDay = (jd + 1) % 12;

    final List<int> hoangDaoHours = [];
    switch (chiDay) {
      case 0: // Thân
        hoangDaoHours
            .addAll([1, 3, 5, 7, 9, 11]); // Tý, Dần, Thìn, Ngọ, Thân, Tuất
        break;
      case 1: // Dậu
        hoangDaoHours.addAll([0, 2, 4, 6, 8, 10]); // Tý, Sửu, Mão, Tỵ, Mùi, Dậu
        break;
      case 2: // Tuất
        hoangDaoHours
            .addAll([1, 3, 5, 7, 9, 11]); // Dần, Thìn, Ngọ, Thân, Tuất, Tý
        break;
      case 3: // Hợi
        hoangDaoHours
            .addAll([0, 2, 4, 6, 8, 10]); // Sửu, Mão, Tỵ, Mùi, Dậu, Hợi
        break;
      case 4: // Tý
        hoangDaoHours
            .addAll([1, 3, 5, 7, 9, 11]); // Dần, Thìn, Ngọ, Thân, Tuất, Tý
        break;
      case 5: // Sửu
        hoangDaoHours
            .addAll([0, 2, 4, 6, 8, 10]); // Sửu, Mão, Tỵ, Mùi, Dậu, Hợi
        break;
      case 6: // Dần
        hoangDaoHours
            .addAll([1, 3, 5, 7, 9, 11]); // Dần, Thìn, Ngọ, Thân, Tuất, Tý
        break;
      case 7: // Mão
        hoangDaoHours
            .addAll([0, 2, 4, 6, 8, 10]); // Sửu, Mão, Tỵ, Mùi, Dậu, Hợi
        break;
      case 8: // Thìn
        hoangDaoHours
            .addAll([1, 3, 5, 7, 9, 11]); // Dần, Thìn, Ngọ, Thân, Tuất, Tý
        break;
      case 9: // Tỵ
        hoangDaoHours
            .addAll([0, 2, 4, 6, 8, 10]); // Sửu, Mão, Tỵ, Mùi, Dậu, Hợi
        break;
      case 10: // Ngọ
        hoangDaoHours
            .addAll([1, 3, 5, 7, 9, 11]); // Dần, Thìn, Ngọ, Thân, Tuất, Tý
        break;
      case 11: // Mùi
        hoangDaoHours
            .addAll([0, 2, 4, 6, 8, 10]); // Sửu, Mão, Tỵ, Mùi, Dậu, Hợi
        break;
    }

    return hoangDaoHours.map((index) => GIO_HD[index]).toList();
  }

  static String getDayMeaning(DateTime date) {
    final jd = jdFromDate(date.day, date.month, date.year);
    final chiDay = (jd + 1) % 12;
    final canDay = (jd + 9) % 10;

    final bool isHoangDao = [1, 3, 5, 7, 9, 11].contains(chiDay);
    return isHoangDao ? 'Hoàng đạo' : 'Hắc đạo';
  }
}
