import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';
import 'package:intl/intl.dart';
import 'package:vnlunar/vnlunar.dart';

class LunarCalendarWidget {
  static const String _appWidgetProvider = 'LunarCalendarWidgetProvider';
  static const String _group = 'group.com.example.licham';

  static Future<void> updateWidget() async {
    try {
      // Set group ID for widget
      await HomeWidget.setAppGroupId(_group);

      final now = DateTime.now();
      final solarDate = DateFormat('dd/MM/yyyy').format(now);

      // Convert to lunar date using Lunar class
      final lunar = Lunar(createdFromSolar: true, date: now);
      final lunarDate = 'Âm lịch: Ngày ${lunar.day} tháng ${lunar.month}';

      // Get upcoming events or notes
      String note = _getUpcomingEvent(lunar);

      debugPrint('Updating widget with:');
      debugPrint('Solar: $solarDate');
      debugPrint('Lunar: $lunarDate');
      debugPrint('Note: $note');

      // Save data for widget
      try {
        await Future.wait([
          HomeWidget.saveWidgetData<String>('solar_date', solarDate),
          HomeWidget.saveWidgetData<String>('lunar_date', lunarDate),
          HomeWidget.saveWidgetData<String>('note', note),
        ]);
        debugPrint('Data saved successfully');
      } catch (e) {
        debugPrint('Error saving data: $e');
      }

      // Request widget update
      try {
        await HomeWidget.updateWidget(
          name: _appWidgetProvider,
          androidName: _appWidgetProvider,
          iOSName: _appWidgetProvider,
        );
        debugPrint('Widget update requested successfully');
      } catch (e) {
        debugPrint('Error requesting widget update: $e');
      }
    } catch (e) {
      debugPrint('Error in updateWidget: $e');
    }
  }

  static String _getUpcomingEvent(Lunar lunar) {
    if (lunar.day == 1) {
      return '✨ Mùng 1 tháng ${lunar.month}';
    } else if (lunar.day == 15) {
      return '🌕 Rằm tháng ${lunar.month}';
    }

    // Add more special dates or get from a database
    return '';
  }

  static void startPeriodicUpdate() {
    // Initial update
    updateWidget();

    // Update widget every 30 minutes
    Future.doWhile(() async {
      await Future.delayed(const Duration(minutes: 30));
      await updateWidget();
      return true;
    });
  }
}
