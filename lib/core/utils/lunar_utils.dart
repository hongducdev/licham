import 'package:vnlunar/vnlunar.dart';
import 'package:licham/core/utils/lunar_calculator.dart';

class LunarUtils {
  static List<int> getSolarToLunar(int dd, int mm, int yy) {
    return LunarCalculator.convertSolar2Lunar(dd, mm, yy);
  }

  static String getCanChiDay(DateTime date) {
    final jd = LunarCalculator.jdFromDate(date.day, date.month, date.year);
    return LunarCalculator.getCanChiDay(jd);
  }

  static String getCanChiMonth(DateTime date) {
    final lunarInfo = LunarCalculator.convertSolar2Lunar(
      date.day,
      date.month,
      date.year,
    );
    return LunarCalculator.getCanChiMonth(lunarInfo[1], lunarInfo[2]);
  }

  static String getCanChiYear(DateTime date) {
    final lunarInfo = LunarCalculator.convertSolar2Lunar(
      date.day,
      date.month,
      date.year,
    );
    return LunarCalculator.getCanChiYear(lunarInfo[2]);
  }

  static String getTiet(DateTime date) {
    final jd = LunarCalculator.jdFromDate(date.day, date.month, date.year);
    return LunarCalculator.getSolarTerm(jd);
  }

  static List<String> getHoangDao(DateTime date) {
    return LunarCalculator.getHoangDao(date);
  }

  static String getDayMeaning(DateTime date) {
    return LunarCalculator.getDayMeaning(date);
  }
}
