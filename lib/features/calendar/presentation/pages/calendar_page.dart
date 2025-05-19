import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart' as calendar;
import 'package:licham/features/calendar/application/calendar_provider.dart';
import 'package:licham/features/calendar/application/event_provider.dart';
import 'package:licham/features/calendar/application/holiday_provider.dart';
import 'package:licham/features/calendar/domain/lunar_date.dart';
import 'package:licham/features/calendar/domain/vietnamese_calendar_utils.dart';
import 'package:licham/features/calendar/presentation/dialogs/add_event_dialog.dart';
import 'package:licham/features/calendar/presentation/widgets/day_details_bottom_sheet.dart';

class CalendarPage extends ConsumerWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final calendarState = ref.watch(calendarStateProvider);
    final events = ref.watch(eventStateProvider);

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                theme.colorScheme.primary.withOpacity(0.05),
                theme.colorScheme.surface,
              ],
            ),
          ),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                pinned: true,
                floating: true,
                snap: true,
                backgroundColor: theme.colorScheme.surface.withOpacity(0.95),
                expandedHeight: 120,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Month Selection
                      PopupMenuButton<int>(
                        initialValue: calendarState.focusedDay.month,
                        onSelected: (month) {
                          ref
                              .read(calendarStateProvider.notifier)
                              .selectMonth(month);
                        },
                        itemBuilder: (context) => List.generate(
                          12,
                          (index) => PopupMenuItem(
                            value: index + 1,
                            child: Text(
                              'Tháng ${index + 1}',
                              style: GoogleFonts.montserrat(
                                textStyle: theme.textTheme.bodyLarge?.copyWith(
                                  color: calendarState.focusedDay.month ==
                                          index + 1
                                      ? theme.colorScheme.primary
                                      : null,
                                  fontWeight: calendarState.focusedDay.month ==
                                          index + 1
                                      ? FontWeight.bold
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Tháng ${calendarState.focusedDay.month}',
                              style: GoogleFonts.montserrat(
                                textStyle:
                                    theme.textTheme.headlineMedium?.copyWith(
                                  color: theme.colorScheme.onSurface,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down_rounded,
                              color: theme.colorScheme.onSurface,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Year Selection
                      PopupMenuButton<int>(
                        initialValue: calendarState.focusedDay.year,
                        onSelected: (year) {
                          ref
                              .read(calendarStateProvider.notifier)
                              .selectYear(year);
                        },
                        itemBuilder: (context) {
                          final currentYear = DateTime.now().year;
                          return List.generate(
                            21,
                            (index) => PopupMenuItem(
                              value: currentYear - 10 + index,
                              child: Text(
                                '${currentYear - 10 + index}',
                                style: GoogleFonts.montserrat(
                                  textStyle:
                                      theme.textTheme.bodyLarge?.copyWith(
                                    color: calendarState.focusedDay.year ==
                                            currentYear - 10 + index
                                        ? theme.colorScheme.primary
                                        : null,
                                    fontWeight: calendarState.focusedDay.year ==
                                            currentYear - 10 + index
                                        ? FontWeight.bold
                                        : null,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${calendarState.focusedDay.year}',
                              style: GoogleFonts.montserrat(
                                textStyle: theme.textTheme.titleLarge?.copyWith(
                                  color: theme.colorScheme.onSurface
                                      .withOpacity(0.7),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down_rounded,
                              color:
                                  theme.colorScheme.onSurface.withOpacity(0.7),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ).animate().fadeIn(duration: 300.ms).slideX(),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.today_rounded),
                    onPressed: () =>
                        ref.read(calendarStateProvider.notifier).goToToday(),
                    style: IconButton.styleFrom(
                      foregroundColor: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ],
            body: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Card(
                elevation: 2,
                shadowColor: theme.colorScheme.shadow.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    // Weekday Headers
                    Container(
                      decoration: BoxDecoration(
                        color:
                            theme.colorScheme.primaryContainer.withOpacity(0.5),
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(24),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            'T2',
                            'T3',
                            'T4',
                            'T5',
                            'T6',
                            'T7',
                            'CN',
                          ]
                              .map((day) => SizedBox(
                                    width: 40,
                                    child: Text(
                                      day,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.montserrat(
                                        textStyle: theme.textTheme.titleSmall
                                            ?.copyWith(
                                          color: theme
                                              .colorScheme.onPrimaryContainer,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                    // Calendar Grid
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: calendar.TableCalendar<void>(
                        key: ValueKey('calendar_${calendarState.focusedDay}'),
                        locale: 'vi_VN',
                        firstDay: DateTime.utc(2000, 1, 1),
                        lastDay: DateTime.utc(2050, 12, 31),
                        focusedDay: calendarState.focusedDay,
                        selectedDayPredicate: (day) =>
                            isSameDay(calendarState.selectedDay, day),
                        calendarFormat: calendar.CalendarFormat.month,
                        startingDayOfWeek: calendar.StartingDayOfWeek.monday,
                        daysOfWeekHeight: 0,
                        rowHeight: 68,
                        calendarStyle: calendar.CalendarStyle(
                          outsideDaysVisible: false,
                          cellMargin: const EdgeInsets.all(2),
                          selectedDecoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          todayDecoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          defaultDecoration: BoxDecoration(
                            border: Border.all(
                              color: theme.colorScheme.outline.withOpacity(0.1),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          weekendDecoration: BoxDecoration(
                            border: Border.all(
                              color: theme.colorScheme.outline.withOpacity(0.1),
                            ),
                            borderRadius: BorderRadius.circular(12),
                            color: theme.colorScheme.surface,
                          ),
                          holidayDecoration: BoxDecoration(
                            border: Border.all(
                              color: theme.colorScheme.error.withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          markersAlignment: Alignment.bottomCenter,
                          markerDecoration: BoxDecoration(
                            color: theme.colorScheme.tertiary,
                            shape: BoxShape.circle,
                          ),
                          weekendTextStyle: TextStyle(
                            color: theme.colorScheme.primary,
                          ),
                          holidayTextStyle: TextStyle(
                            color: theme.colorScheme.error,
                          ),
                        ),
                        headerVisible: false,
                        onDaySelected: (selectedDay, focusedDay) {
                          ref
                              .read(calendarStateProvider.notifier)
                              .selectDay(selectedDay);
                          _showDayDetailsBottomSheet(context, ref);
                        },
                        calendarBuilders: calendar.CalendarBuilders(
                          defaultBuilder: (context, day, focusedDay) {
                            return _buildCalendarDayCell(
                                context, day, false, false, ref);
                          },
                          selectedBuilder: (context, day, focusedDay) {
                            return _buildCalendarDayCell(
                                context, day, true, false, ref);
                          },
                          todayBuilder: (context, day, focusedDay) {
                            return _buildCalendarDayCell(
                                context, day, false, true, ref);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(duration: 400.ms).scale(
                    begin: const Offset(0.95, 0.95),
                    end: const Offset(1, 1),
                  ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddEventDialog(
              selectedDate: calendarState.selectedDay,
            ),
          );
        },
        icon: const Icon(Icons.add_rounded),
        label: const Text('Thêm sự kiện'),
      ).animate().fadeIn(duration: 500.ms).slideY(begin: 1, end: 0),
    );
  }

  void _showDayDetailsBottomSheet(BuildContext context, WidgetRef ref) {
    final calendarState = ref.watch(calendarStateProvider);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DayDetailsBottomSheet(
        solarDate: calendarState.selectedDay,
        lunarDate: calendarState.lunarDate,
        jd: calendarState.lunarDate.jd,
        allHolidays: [
          ...VietnameseCalendarUtils.getHolidays(
            calendarState.lunarDate.day,
            calendarState.lunarDate.month,
            isLunar: true,
          ),
          ...VietnameseCalendarUtils.getHolidays(
            calendarState.selectedDay.day,
            calendarState.selectedDay.month,
          ),
        ],
        note: null, // TODO: Add note functionality
      ),
    );
  }

  Widget _buildCalendarDayCell(
    BuildContext context,
    DateTime day,
    bool isSelected,
    bool isToday,
    WidgetRef ref,
  ) {
    final theme = Theme.of(context);
    final lunarDate = LunarDate.fromDateTime(day);
    final isHoliday = ref.watch(holidayStateProvider.notifier).isHoliday(day);
    final hasEvents =
        ref.watch(eventStateProvider.notifier).getEventsForDay(day).isNotEmpty;
    final isWeekend =
        day.weekday == DateTime.saturday || day.weekday == DateTime.sunday;

    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isSelected
            ? theme.colorScheme.primary
            : isToday
                ? theme.colorScheme.primaryContainer
                : isWeekend
                    ? theme.colorScheme.surfaceVariant.withOpacity(0.5)
                    : null,
        border: !isSelected && !isToday
            ? Border.all(
                color: isHoliday
                    ? theme.colorScheme.error.withOpacity(0.3)
                    : theme.colorScheme.outline.withOpacity(0.1),
                width: 1,
              )
            : null,
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${day.day}',
                  style: GoogleFonts.montserrat(
                    textStyle: theme.textTheme.titleMedium?.copyWith(
                      color: isSelected
                          ? theme.colorScheme.onPrimary
                          : isToday
                              ? theme.colorScheme.onPrimaryContainer
                              : isHoliday
                                  ? theme.colorScheme.error
                                  : isWeekend
                                      ? theme.colorScheme.primary
                                      : null,
                      fontWeight: isSelected || isToday || isHoliday
                          ? FontWeight.bold
                          : null,
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 1,
                  ),
                  decoration: BoxDecoration(
                    color: (isSelected
                            ? theme.colorScheme.onPrimary
                            : theme.colorScheme.primary)
                        .withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${lunarDate.day}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 11,
                          color: isSelected
                              ? theme.colorScheme.onPrimary
                              : theme.colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (lunarDate.solarTerm.isNotEmpty)
                        Text(
                          lunarDate.solarTerm,
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 9,
                            color: isSelected
                                ? theme.colorScheme.onPrimary
                                : theme.colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (isHoliday || hasEvents)
            Positioned(
              bottom: 4,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isHoliday)
                    Container(
                      width: 5,
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected
                            ? theme.colorScheme.onPrimary
                            : theme.colorScheme.error,
                      ),
                    ),
                  if (hasEvents)
                    Container(
                      width: 5,
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected
                            ? theme.colorScheme.onPrimary
                            : theme.colorScheme.tertiary,
                      ),
                    ),
                ],
              ),
            ),
          if (lunarDate.isLeapMonth)
            Positioned(
              top: 4,
              right: 4,
              child: Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? theme.colorScheme.onPrimary
                      : theme.colorScheme.primary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
