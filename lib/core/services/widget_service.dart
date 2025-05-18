import 'package:home_widget/home_widget.dart';
import 'package:licham/core/models/lunar_date.dart';

class WidgetService {
  static const String _appWidgetProvider = 'LunarCalendarWidgetProvider';

  static Future<void> updateWidget(LunarDate lunarDate) async {
    try {
      // Update solar date
      await HomeWidget.saveWidgetData('solar_date',
          '${lunarDate.solarDay}/${lunarDate.solarMonth}/${lunarDate.solarYear}');

      // Update lunar date components
      await HomeWidget.saveWidgetData(
          'lunar_day', lunarDate.lunarDay.toString());
      await HomeWidget.saveWidgetData(
          'lunar_month', lunarDate.lunarMonth.toString());
      await HomeWidget.saveWidgetData('lunar_year_name', lunarDate.canChiYear);

      // Trigger widget update
      await HomeWidget.updateWidget(
        name: _appWidgetProvider,
        androidName: _appWidgetProvider,
      );
    } catch (e) {
      print('Error updating widget: $e');
    }
  }
}
