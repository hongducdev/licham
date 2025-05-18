// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lunar_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LunarDateImpl _$$LunarDateImplFromJson(Map<String, dynamic> json) =>
    _$LunarDateImpl(
      lunarDay: (json['lunarDay'] as num).toInt(),
      lunarMonth: (json['lunarMonth'] as num).toInt(),
      lunarYear: (json['lunarYear'] as num).toInt(),
      solarDay: (json['solarDay'] as num).toInt(),
      solarMonth: (json['solarMonth'] as num).toInt(),
      solarYear: (json['solarYear'] as num).toInt(),
      canChiDay: json['canChiDay'] as String,
      canChiMonth: json['canChiMonth'] as String,
      canChiYear: json['canChiYear'] as String,
      tiet: json['tiet'] as String,
      isLeapMonth: json['isLeapMonth'] as bool,
      jd: json['jd'] as String,
      hoangDao:
          (json['hoangDao'] as List<dynamic>).map((e) => e as String).toList(),
      dayMeaning: json['dayMeaning'] as String,
    );

Map<String, dynamic> _$$LunarDateImplToJson(_$LunarDateImpl instance) =>
    <String, dynamic>{
      'lunarDay': instance.lunarDay,
      'lunarMonth': instance.lunarMonth,
      'lunarYear': instance.lunarYear,
      'solarDay': instance.solarDay,
      'solarMonth': instance.solarMonth,
      'solarYear': instance.solarYear,
      'canChiDay': instance.canChiDay,
      'canChiMonth': instance.canChiMonth,
      'canChiYear': instance.canChiYear,
      'tiet': instance.tiet,
      'isLeapMonth': instance.isLeapMonth,
      'jd': instance.jd,
      'hoangDao': instance.hoangDao,
      'dayMeaning': instance.dayMeaning,
    };
