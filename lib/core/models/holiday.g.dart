// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holiday.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HolidayImpl _$$HolidayImplFromJson(Map<String, dynamic> json) =>
    _$HolidayImpl(
      day: (json['day'] as num).toInt(),
      month: (json['month'] as num).toInt(),
      name: json['name'] as String,
      isLunar: json['isLunar'] as bool? ?? false,
    );

Map<String, dynamic> _$$HolidayImplToJson(_$HolidayImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'month': instance.month,
      'name': instance.name,
      'isLunar': instance.isLunar,
    };
