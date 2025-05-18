// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vietnamese_holiday.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VietnameseHolidayImpl _$$VietnameseHolidayImplFromJson(
        Map<String, dynamic> json) =>
    _$VietnameseHolidayImpl(
      name: json['name'] as String,
      day: (json['day'] as num).toInt(),
      month: (json['month'] as num).toInt(),
      isLunar: json['isLunar'] as bool,
      description: json['description'] as String?,
      isOfficial: json['isOfficial'] as bool? ?? false,
    );

Map<String, dynamic> _$$VietnameseHolidayImplToJson(
        _$VietnameseHolidayImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'day': instance.day,
      'month': instance.month,
      'isLunar': instance.isLunar,
      'description': instance.description,
      'isOfficial': instance.isOfficial,
    };
