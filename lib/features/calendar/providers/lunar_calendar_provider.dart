import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vnlunar/vnlunar.dart' as vn;
import 'package:licham/core/models/lunar_date.dart';
import 'package:licham/core/utils/lunar_calculator.dart';
import 'package:licham/core/services/widget_service.dart';

part 'lunar_calendar_provider.g.dart';

@riverpod
class LunarCalendar extends _$LunarCalendar {
  @override
  LunarDate? build() => null;

  void selectDate(DateTime date) {
    final lunarInfo = LunarCalculator.convertSolar2Lunar(
      date.day,
      date.month,
      date.year,
    );

    final jd = LunarCalculator.jdFromDate(date.day, date.month, date.year);
    final canChiDay = LunarCalculator.getCanChiDay(jd);
    final canChiMonth =
        LunarCalculator.getCanChiMonth(lunarInfo[1], lunarInfo[2]);
    final canChiYear = LunarCalculator.getCanChiYear(lunarInfo[2]);
    final tiet = LunarCalculator.getSolarTerm(jd);
    final hoangDaoHours = LunarCalculator.getHoangDao(date);
    final dayMeaning = LunarCalculator.getDayMeaning(date);

    final lunarDate = LunarDate(
      lunarDay: lunarInfo[0],
      lunarMonth: lunarInfo[1],
      lunarYear: lunarInfo[2],
      solarDay: date.day,
      solarMonth: date.month,
      solarYear: date.year,
      canChiDay: canChiDay,
      canChiMonth: canChiMonth,
      canChiYear: canChiYear,
      tiet: tiet,
      isLeapMonth: lunarInfo[3] == 1,
      jd: jd.toString(),
      hoangDao: hoangDaoHours,
      dayMeaning: dayMeaning,
    );

    state = lunarDate;

    // Update widget
    WidgetService.updateWidget(lunarDate);
  }

  LunarDate? getLunarDateForDay(DateTime date) {
    final lunarInfo = LunarCalculator.convertSolar2Lunar(
      date.day,
      date.month,
      date.year,
    );

    final jd = LunarCalculator.jdFromDate(date.day, date.month, date.year);
    final canChiDay = LunarCalculator.getCanChiDay(jd);
    final canChiMonth =
        LunarCalculator.getCanChiMonth(lunarInfo[1], lunarInfo[2]);
    final canChiYear = LunarCalculator.getCanChiYear(lunarInfo[2]);
    final tiet = LunarCalculator.getSolarTerm(jd);
    final hoangDaoHours = LunarCalculator.getHoangDao(date);
    final dayMeaning = LunarCalculator.getDayMeaning(date);

    return LunarDate(
      lunarDay: lunarInfo[0],
      lunarMonth: lunarInfo[1],
      lunarYear: lunarInfo[2],
      solarDay: date.day,
      solarMonth: date.month,
      solarYear: date.year,
      canChiDay: canChiDay,
      canChiMonth: canChiMonth,
      canChiYear: canChiYear,
      tiet: tiet,
      isLeapMonth: lunarInfo[3] == 1,
      jd: jd.toString(),
      hoangDao: hoangDaoHours,
      dayMeaning: dayMeaning,
    );
  }
}
