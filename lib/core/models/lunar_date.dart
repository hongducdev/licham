import 'package:freezed_annotation/freezed_annotation.dart';

part 'lunar_date.freezed.dart';
part 'lunar_date.g.dart';

@freezed
class LunarDate with _$LunarDate {
  const factory LunarDate({
    required int lunarDay,
    required int lunarMonth,
    required int lunarYear,
    required int solarDay,
    required int solarMonth,
    required int solarYear,
    required String canChiDay,
    required String canChiMonth,
    required String canChiYear,
    required String tiet, // Tiết khí
    required bool isLeapMonth,
    required String jd, // Julian day
    required List<String> hoangDao, // Giờ hoàng đạo
    required String dayMeaning, // Ý nghĩa ngày (tốt/xấu)
  }) = _LunarDate;

  factory LunarDate.fromJson(Map<String, dynamic> json) =>
      _$LunarDateFromJson(json);

  const LunarDate._();

  String get lunarDateString =>
      '$lunarDay/${isLeapMonth ? 'N$lunarMonth' : lunarMonth}/$lunarYear';

  String get solarDateString => '$solarDay/$solarMonth/$solarYear';

  String get fullCanChi => 'Ngày $canChiDay tháng $canChiMonth năm $canChiYear';

  String get hoangDaoString => hoangDao.join(', ');

  bool get isHoangDao => dayMeaning.contains('Hoàng đạo');
}
