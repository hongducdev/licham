// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReminderImpl _$$ReminderImplFromJson(Map<String, dynamic> json) =>
    _$ReminderImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      lunarDay: (json['lunarDay'] as num).toInt(),
      lunarMonth: (json['lunarMonth'] as num).toInt(),
      lunarYear: (json['lunarYear'] as num).toInt(),
      isYearlyRecurring: json['isYearlyRecurring'] as bool,
      isMonthlyRecurring: json['isMonthlyRecurring'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      isDeleted: json['isDeleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$ReminderImplToJson(_$ReminderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'lunarDay': instance.lunarDay,
      'lunarMonth': instance.lunarMonth,
      'lunarYear': instance.lunarYear,
      'isYearlyRecurring': instance.isYearlyRecurring,
      'isMonthlyRecurring': instance.isMonthlyRecurring,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'isDeleted': instance.isDeleted,
    };
