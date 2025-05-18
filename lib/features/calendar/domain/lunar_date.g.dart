// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lunar_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LunarDateImpl _$$LunarDateImplFromJson(Map<String, dynamic> json) =>
    _$LunarDateImpl(
      day: (json['day'] as num).toInt(),
      month: (json['month'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      solarTerm: json['solarTerm'] as String,
      isLeapMonth: json['isLeapMonth'] as bool,
      jd: (json['jd'] as num).toInt(),
      dayName: json['dayName'] as String,
      monthName: json['monthName'] as String,
      yearName: json['yearName'] as String,
      tietKhi: json['tietKhi'] as String,
      ngayHoangDao: json['ngayHoangDao'] as String,
    );

Map<String, dynamic> _$$LunarDateImplToJson(_$LunarDateImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'month': instance.month,
      'year': instance.year,
      'solarTerm': instance.solarTerm,
      'isLeapMonth': instance.isLeapMonth,
      'jd': instance.jd,
      'dayName': instance.dayName,
      'monthName': instance.monthName,
      'yearName': instance.yearName,
      'tietKhi': instance.tietKhi,
      'ngayHoangDao': instance.ngayHoangDao,
    };
