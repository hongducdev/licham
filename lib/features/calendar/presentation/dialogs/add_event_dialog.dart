import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:licham/features/calendar/application/event_provider.dart';
import 'package:licham/features/calendar/domain/calendar_event.dart';
import 'package:uuid/uuid.dart';

class AddEventDialog extends ConsumerStatefulWidget {
  final DateTime selectedDate;

  const AddEventDialog({
    super.key,
    required this.selectedDate,
  });

  @override
  ConsumerState<AddEventDialog> createState() => _AddEventDialogState();
}

class _AddEventDialogState extends ConsumerState<AddEventDialog> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  bool _isLunarDate = false;
  bool _isRecurring = false;
  RecurrenceType _recurrenceType = RecurrenceType.none;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveEvent() {
    if (!_formKey.currentState!.validate()) return;

    final event = CalendarEvent(
      id: const Uuid().v4(),
      title: _titleController.text,
      description: _descriptionController.text,
      date: widget.selectedDate,
      isLunarDate: _isLunarDate,
      isRecurring: _isRecurring,
      recurrenceType: _recurrenceType,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    ref.read(eventStateProvider.notifier).addEvent(event);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      title: const Text('Thêm sự kiện'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Tiêu đề',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tiêu đề';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Mô tả',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Ngày âm lịch'),
                value: _isLunarDate,
                onChanged: (value) => setState(() => _isLunarDate = value),
              ),
              SwitchListTile(
                title: const Text('Lặp lại'),
                value: _isRecurring,
                onChanged: (value) {
                  setState(() {
                    _isRecurring = value;
                    if (!value) {
                      _recurrenceType = RecurrenceType.none;
                    }
                  });
                },
              ),
              if (_isRecurring) ...[
                const SizedBox(height: 8),
                DropdownButtonFormField<RecurrenceType>(
                  value: _recurrenceType,
                  decoration: const InputDecoration(
                    labelText: 'Kiểu lặp lại',
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    const DropdownMenuItem(
                      value: RecurrenceType.daily,
                      child: Text('Hàng ngày'),
                    ),
                    const DropdownMenuItem(
                      value: RecurrenceType.weekly,
                      child: Text('Hàng tuần'),
                    ),
                    const DropdownMenuItem(
                      value: RecurrenceType.monthly,
                      child: Text('Hàng tháng'),
                    ),
                    const DropdownMenuItem(
                      value: RecurrenceType.yearly,
                      child: Text('Hàng năm'),
                    ),
                    if (_isLunarDate) ...[
                      const DropdownMenuItem(
                        value: RecurrenceType.lunarMonthly,
                        child: Text('Hàng tháng âm lịch'),
                      ),
                      const DropdownMenuItem(
                        value: RecurrenceType.lunarYearly,
                        child: Text('Hàng năm âm lịch'),
                      ),
                    ],
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _recurrenceType = value);
                    }
                  },
                ),
              ],
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Hủy'),
        ),
        FilledButton(
          onPressed: _saveEvent,
          child: const Text('Lưu'),
        ),
      ],
    );
  }
}
