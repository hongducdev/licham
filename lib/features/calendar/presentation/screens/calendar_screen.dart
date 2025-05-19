import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:licham/features/calendar/providers/lunar_calendar_provider.dart';
import 'package:licham/features/reminder/models/reminder.dart';
import 'package:licham/features/reminder/providers/reminder_provider.dart';
import 'package:licham/features/reminder/presentation/dialogs/reminder_dialog.dart';
import 'package:licham/core/providers/holiday_provider.dart';
import 'package:licham/features/calendar/domain/vietnamese_calendar_utils.dart';

class CalendarScreen extends ConsumerStatefulWidget {
  const CalendarScreen({super.key});

  @override
  ConsumerState<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends ConsumerState<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(lunarCalendarProvider.notifier).selectDate(_focusedDay);
    });
  }

  void _showReminderDialog([Reminder? reminder]) {
    final lunarDate = ref.read(lunarCalendarProvider);
    if (lunarDate == null) return;

    showDialog<void>(
      context: context,
      builder: (context) => ReminderDialog(
        reminder: reminder,
        lunarDay: lunarDate.lunarDay,
        lunarMonth: lunarDate.lunarMonth,
        lunarYear: lunarDate.lunarYear,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lunarDate = ref.watch(lunarCalendarProvider);
    final theme = Theme.of(context);
    final remindersAsync = ref.watch(reminderListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lịch Âm Việt Nam'),
        actions: [
          IconButton(
            icon: const Icon(Icons.today),
            tooltip: 'Về ngày hôm nay',
            onPressed: () {
              setState(() {
                _focusedDay = DateTime.now();
                _selectedDay = _focusedDay;
              });
              ref.read(lunarCalendarProvider.notifier).selectDate(_focusedDay);
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Card(
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: TableCalendar(
                locale: 'vi_VN',
                firstDay: DateTime(1900),
                lastDay: DateTime(2100),
                focusedDay: _focusedDay,
                currentDay: DateTime.now(),
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                  ref
                      .read(lunarCalendarProvider.notifier)
                      .selectDate(selectedDay);
                },
                onPageChanged: (focusedDay) {
                  setState(() {
                    _focusedDay = focusedDay;
                  });
                },
                headerStyle: HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                  titleTextStyle: theme.textTheme.titleMedium!,
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: theme.colorScheme.primary,
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: theme.colorScheme.primary,
                  ),
                  headerPadding: const EdgeInsets.symmetric(vertical: 0),
                  titleTextFormatter: (date, locale) {
                    return 'Tháng ${date.month}';
                  },
                  leftChevronPadding: const EdgeInsets.all(8),
                  rightChevronPadding: const EdgeInsets.all(8),
                ),
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: theme.colorScheme.secondary.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  weekendTextStyle: TextStyle(
                    color: theme.colorScheme.primary,
                  ),
                  outsideTextStyle: TextStyle(
                    color: theme.colorScheme.onSurface.withOpacity(0.4),
                  ),
                  markerDecoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) {
                    final isHoliday =
                        ref.watch(holidayListProvider.notifier).isHoliday(day);
                    if (!isHoliday) return null;

                    return Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                  selectedBuilder: (context, day, focusedDay) {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style: TextStyle(
                            color: theme.colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                  todayBuilder: (context, day, focusedDay) {
                    final isHoliday =
                        ref.watch(holidayListProvider.notifier).isHoliday(day);
                    return Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: isHoliday
                            ? theme.colorScheme.primary.withOpacity(0.2)
                            : theme.colorScheme.secondary.withOpacity(0.2),
                        border: Border.all(
                          color: theme.colorScheme.primary,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _focusedDay = DateTime(
                        _focusedDay.year - 1,
                        _focusedDay.month,
                        _focusedDay.day,
                      );
                    });
                  },
                  icon: Icon(
                    Icons.keyboard_double_arrow_left,
                    color: theme.colorScheme.primary,
                  ),
                  tooltip: 'Năm trước',
                ),
                DropdownButton<int>(
                  value: _focusedDay.year,
                  items: List.generate(
                    201,
                    (index) => DropdownMenuItem(
                      value: 1900 + index,
                      child: Text(
                        '${1900 + index}',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                  onChanged: (year) {
                    if (year != null) {
                      setState(() {
                        _focusedDay = DateTime(
                          year,
                          _focusedDay.month,
                          _focusedDay.day,
                        );
                      });
                    }
                  },
                  dropdownColor: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  elevation: 4,
                  underline: Container(
                    height: 2,
                    color: theme.colorScheme.primary,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _focusedDay = DateTime(
                        _focusedDay.year + 1,
                        _focusedDay.month,
                        _focusedDay.day,
                      );
                    });
                  },
                  icon: Icon(
                    Icons.keyboard_double_arrow_right,
                    color: theme.colorScheme.primary,
                  ),
                  tooltip: 'Năm sau',
                ),
              ],
            ),
          ),
          if (_selectedDay != null && lunarDate != null) ...[
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Solar Date Header
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Text(
                                '${_selectedDay!.day}',
                                style: GoogleFonts.montserrat(
                                  textStyle:
                                      theme.textTheme.headlineMedium?.copyWith(
                                    color: theme.colorScheme.onPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                'Tháng ${_selectedDay!.month}',
                                style: GoogleFonts.montserrat(
                                  textStyle:
                                      theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.colorScheme.onPrimary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                VietnameseCalendarUtils.getWeekdayName(
                                    int.parse(lunarDate.jd.toString())),
                                style: GoogleFonts.montserrat(
                                  textStyle:
                                      theme.textTheme.titleLarge?.copyWith(
                                    color: theme.colorScheme.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text(
                                '${_selectedDay!.year}',
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Holidays Section
                    Consumer(
                      builder: (context, ref, child) {
                        final holidays = ref
                            .watch(holidayListProvider.notifier)
                            .getHolidaysForDate(_selectedDay!);
                        if (holidays.isEmpty) return const SizedBox.shrink();

                        return Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.errorContainer
                                .withOpacity(0.3),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.celebration_outlined,
                                    color: theme.colorScheme.error,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Ngày lễ',
                                    style:
                                        theme.textTheme.titleMedium?.copyWith(
                                      color: theme.colorScheme.error,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              ...holidays.map(
                                (holiday) => Padding(
                                  padding: const EdgeInsets.only(
                                      left: 28, bottom: 4),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '• ${holiday.name}',
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                            color: theme
                                                .colorScheme.onErrorContainer,
                                          ),
                                        ),
                                      ),
                                      if (holiday.isLunar)
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: theme.colorScheme.error
                                                .withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            'Âm lịch',
                                            style: theme.textTheme.bodySmall
                                                ?.copyWith(
                                              color: theme.colorScheme.error,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),

                    // Lunar Date Info
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color:
                            theme.colorScheme.primaryContainer.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.brightness_4,
                                color: theme.colorScheme.primary,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Âm lịch',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(left: 28),
                            child: Text(
                              'Ngày ${lunarDate.lunarDay} tháng ${lunarDate.lunarMonth} '
                              'năm ${lunarDate.lunarYear} ${lunarDate.isLeapMonth ? '(Nhuận)' : ''}',
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: theme.colorScheme.onPrimaryContainer,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(left: 28),
                            child: Text(
                              lunarDate.fullCanChi,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onPrimaryContainer,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Additional Info Section
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.secondaryContainer
                            .withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: theme.colorScheme.secondary,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Thông tin thêm',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: theme.colorScheme.secondary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          _buildInfoRow(
                            theme,
                            Icons.wb_sunny,
                            'Tiết khí',
                            lunarDate.tiet,
                          ),
                          const SizedBox(height: 8),
                          _buildInfoRow(
                            theme,
                            Icons.schedule,
                            'Giờ Hoàng Đạo',
                            lunarDate.hoangDaoString,
                          ),
                          const SizedBox(height: 8),
                          _buildInfoRow(
                            theme,
                            lunarDate.isHoangDao
                                ? Icons.sentiment_very_satisfied
                                : Icons.sentiment_very_dissatisfied,
                            'Ý nghĩa',
                            lunarDate.dayMeaning,
                            textColor: lunarDate.isHoangDao
                                ? theme.colorScheme.tertiary
                                : theme.colorScheme.error,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            remindersAsync.when(
              data: (reminders) {
                final dayReminders = ref
                    .read(reminderListProvider.notifier)
                    .getRemindersForLunarDate(
                      lunarDate.lunarDay,
                      lunarDate.lunarMonth,
                      lunarDate.lunarYear,
                    );

                if (dayReminders.isEmpty) {
                  return const SizedBox.shrink();
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Text(
                        'Nhắc nhở',
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    ...dayReminders.map(
                      (reminder) => Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        child: ListTile(
                          title: Text(reminder.title),
                          subtitle: Text(reminder.description),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (reminder.isMonthlyRecurring)
                                const Tooltip(
                                  message: 'Lặp lại hàng tháng',
                                  child: Icon(Icons.repeat),
                                )
                              else if (reminder.isYearlyRecurring)
                                const Tooltip(
                                  message: 'Lặp lại hàng năm',
                                  child: Icon(Icons.event_repeat),
                                ),
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () => _showReminderDialog(reminder),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () async {
                                  await ref
                                      .read(reminderListProvider.notifier)
                                      .deleteReminder(reminder.id);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              error: (error, stackTrace) => Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    'Đã xảy ra lỗi khi tải nhắc nhở: $error',
                    style: TextStyle(color: theme.colorScheme.error),
                  ),
                ),
              ),
              loading: () => const Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ],
      ),
      floatingActionButton: lunarDate == null
          ? null
          : FloatingActionButton(
              onPressed: _showReminderDialog,
              child: const Icon(Icons.add),
            ),
    );
  }

  Widget _buildInfoRow(
    ThemeData theme,
    IconData icon,
    String label,
    String value, {
    Color? textColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: theme.colorScheme.secondary,
          size: 18,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
