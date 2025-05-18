import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:licham/features/reminder/models/reminder.dart';
import 'package:licham/features/reminder/providers/reminder_provider.dart';

class ReminderDialog extends ConsumerStatefulWidget {
  final Reminder? reminder;
  final int lunarDay;
  final int lunarMonth;
  final int lunarYear;

  const ReminderDialog({
    super.key,
    this.reminder,
    required this.lunarDay,
    required this.lunarMonth,
    required this.lunarYear,
  });

  @override
  ConsumerState<ReminderDialog> createState() => _ReminderDialogState();
}

class _ReminderDialogState extends ConsumerState<ReminderDialog> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late bool _isYearlyRecurring;
  late bool _isMonthlyRecurring;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.reminder?.title);
    _descriptionController =
        TextEditingController(text: widget.reminder?.description);
    _isYearlyRecurring = widget.reminder?.isYearlyRecurring ?? false;
    _isMonthlyRecurring = widget.reminder?.isMonthlyRecurring ?? false;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _handleSave() {
    if (_titleController.text.trim().isEmpty) {
      return;
    }

    final reminder = widget.reminder == null
        ? Reminder.create(
            title: _titleController.text.trim(),
            description: _descriptionController.text.trim(),
            lunarDay: widget.lunarDay,
            lunarMonth: widget.lunarMonth,
            lunarYear: widget.lunarYear,
            isYearlyRecurring: _isYearlyRecurring,
            isMonthlyRecurring: _isMonthlyRecurring,
          )
        : widget.reminder!.copyWith(
            title: _titleController.text.trim(),
            description: _descriptionController.text.trim(),
            isYearlyRecurring: _isYearlyRecurring,
            isMonthlyRecurring: _isMonthlyRecurring,
            updatedAt: DateTime.now(),
          );

    if (widget.reminder == null) {
      ref.read(reminderListProvider.notifier).addReminder(reminder);
    } else {
      ref.read(reminderListProvider.notifier).updateReminder(reminder);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.notifications_active,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    widget.reminder == null ? 'Thêm nhắc nhở' : 'Sửa nhắc nhở',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: theme.colorScheme.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Ngày ${widget.lunarDay} tháng ${widget.lunarMonth} năm ${widget.lunarYear} (Âm lịch)',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Tiêu đề',
                  prefixIcon: Icon(
                    Icons.title,
                    color: theme.colorScheme.primary,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: theme.colorScheme.outline,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: theme.colorScheme.primary,
                      width: 2,
                    ),
                  ),
                ),
                textCapitalization: TextCapitalization.sentences,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Mô tả',
                  prefixIcon: Icon(
                    Icons.description,
                    color: theme.colorScheme.primary,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: theme.colorScheme.outline,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: theme.colorScheme.primary,
                      width: 2,
                    ),
                  ),
                ),
                maxLines: 3,
                textCapitalization: TextCapitalization.sentences,
              ),
              const SizedBox(height: 24),
              Text(
                'Lặp lại',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: theme.colorScheme.outline,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _buildRecurringOption(
                      theme,
                      'Hàng tháng',
                      Icons.calendar_view_month,
                      _isMonthlyRecurring,
                      (value) {
                        if (value == true) {
                          setState(() {
                            _isMonthlyRecurring = true;
                            _isYearlyRecurring = false;
                          });
                        } else {
                          setState(() {
                            _isMonthlyRecurring = false;
                          });
                        }
                      },
                    ),
                    Divider(
                      height: 1,
                      color: theme.colorScheme.outline,
                    ),
                    _buildRecurringOption(
                      theme,
                      'Hàng năm',
                      Icons.calendar_today,
                      _isYearlyRecurring,
                      (value) {
                        if (value == true) {
                          setState(() {
                            _isYearlyRecurring = true;
                            _isMonthlyRecurring = false;
                          });
                        } else {
                          setState(() {
                            _isYearlyRecurring = false;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Hủy',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: _handleSave,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      widget.reminder == null ? 'Thêm' : 'Lưu',
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecurringOption(
    ThemeData theme,
    String label,
    IconData icon,
    bool value,
    ValueChanged<bool?> onChanged,
  ) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Icon(
              icon,
              color: theme.colorScheme.primary,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: theme.textTheme.bodyLarge,
              ),
            ),
            Checkbox(
              value: value,
              onChanged: onChanged,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
