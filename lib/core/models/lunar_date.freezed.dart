// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lunar_date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LunarDate _$LunarDateFromJson(Map<String, dynamic> json) {
  return _LunarDate.fromJson(json);
}

/// @nodoc
mixin _$LunarDate {
  int get lunarDay => throw _privateConstructorUsedError;
  int get lunarMonth => throw _privateConstructorUsedError;
  int get lunarYear => throw _privateConstructorUsedError;
  int get solarDay => throw _privateConstructorUsedError;
  int get solarMonth => throw _privateConstructorUsedError;
  int get solarYear => throw _privateConstructorUsedError;
  String get canChiDay => throw _privateConstructorUsedError;
  String get canChiMonth => throw _privateConstructorUsedError;
  String get canChiYear => throw _privateConstructorUsedError;
  String get tiet => throw _privateConstructorUsedError; // Tiết khí
  bool get isLeapMonth => throw _privateConstructorUsedError;
  String get jd => throw _privateConstructorUsedError; // Julian day
  List<String> get hoangDao =>
      throw _privateConstructorUsedError; // Giờ hoàng đạo
  String get dayMeaning => throw _privateConstructorUsedError;

  /// Serializes this LunarDate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LunarDate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LunarDateCopyWith<LunarDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LunarDateCopyWith<$Res> {
  factory $LunarDateCopyWith(LunarDate value, $Res Function(LunarDate) then) =
      _$LunarDateCopyWithImpl<$Res, LunarDate>;
  @useResult
  $Res call(
      {int lunarDay,
      int lunarMonth,
      int lunarYear,
      int solarDay,
      int solarMonth,
      int solarYear,
      String canChiDay,
      String canChiMonth,
      String canChiYear,
      String tiet,
      bool isLeapMonth,
      String jd,
      List<String> hoangDao,
      String dayMeaning});
}

/// @nodoc
class _$LunarDateCopyWithImpl<$Res, $Val extends LunarDate>
    implements $LunarDateCopyWith<$Res> {
  _$LunarDateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LunarDate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lunarDay = null,
    Object? lunarMonth = null,
    Object? lunarYear = null,
    Object? solarDay = null,
    Object? solarMonth = null,
    Object? solarYear = null,
    Object? canChiDay = null,
    Object? canChiMonth = null,
    Object? canChiYear = null,
    Object? tiet = null,
    Object? isLeapMonth = null,
    Object? jd = null,
    Object? hoangDao = null,
    Object? dayMeaning = null,
  }) {
    return _then(_value.copyWith(
      lunarDay: null == lunarDay
          ? _value.lunarDay
          : lunarDay // ignore: cast_nullable_to_non_nullable
              as int,
      lunarMonth: null == lunarMonth
          ? _value.lunarMonth
          : lunarMonth // ignore: cast_nullable_to_non_nullable
              as int,
      lunarYear: null == lunarYear
          ? _value.lunarYear
          : lunarYear // ignore: cast_nullable_to_non_nullable
              as int,
      solarDay: null == solarDay
          ? _value.solarDay
          : solarDay // ignore: cast_nullable_to_non_nullable
              as int,
      solarMonth: null == solarMonth
          ? _value.solarMonth
          : solarMonth // ignore: cast_nullable_to_non_nullable
              as int,
      solarYear: null == solarYear
          ? _value.solarYear
          : solarYear // ignore: cast_nullable_to_non_nullable
              as int,
      canChiDay: null == canChiDay
          ? _value.canChiDay
          : canChiDay // ignore: cast_nullable_to_non_nullable
              as String,
      canChiMonth: null == canChiMonth
          ? _value.canChiMonth
          : canChiMonth // ignore: cast_nullable_to_non_nullable
              as String,
      canChiYear: null == canChiYear
          ? _value.canChiYear
          : canChiYear // ignore: cast_nullable_to_non_nullable
              as String,
      tiet: null == tiet
          ? _value.tiet
          : tiet // ignore: cast_nullable_to_non_nullable
              as String,
      isLeapMonth: null == isLeapMonth
          ? _value.isLeapMonth
          : isLeapMonth // ignore: cast_nullable_to_non_nullable
              as bool,
      jd: null == jd
          ? _value.jd
          : jd // ignore: cast_nullable_to_non_nullable
              as String,
      hoangDao: null == hoangDao
          ? _value.hoangDao
          : hoangDao // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dayMeaning: null == dayMeaning
          ? _value.dayMeaning
          : dayMeaning // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LunarDateImplCopyWith<$Res>
    implements $LunarDateCopyWith<$Res> {
  factory _$$LunarDateImplCopyWith(
          _$LunarDateImpl value, $Res Function(_$LunarDateImpl) then) =
      __$$LunarDateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int lunarDay,
      int lunarMonth,
      int lunarYear,
      int solarDay,
      int solarMonth,
      int solarYear,
      String canChiDay,
      String canChiMonth,
      String canChiYear,
      String tiet,
      bool isLeapMonth,
      String jd,
      List<String> hoangDao,
      String dayMeaning});
}

/// @nodoc
class __$$LunarDateImplCopyWithImpl<$Res>
    extends _$LunarDateCopyWithImpl<$Res, _$LunarDateImpl>
    implements _$$LunarDateImplCopyWith<$Res> {
  __$$LunarDateImplCopyWithImpl(
      _$LunarDateImpl _value, $Res Function(_$LunarDateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LunarDate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lunarDay = null,
    Object? lunarMonth = null,
    Object? lunarYear = null,
    Object? solarDay = null,
    Object? solarMonth = null,
    Object? solarYear = null,
    Object? canChiDay = null,
    Object? canChiMonth = null,
    Object? canChiYear = null,
    Object? tiet = null,
    Object? isLeapMonth = null,
    Object? jd = null,
    Object? hoangDao = null,
    Object? dayMeaning = null,
  }) {
    return _then(_$LunarDateImpl(
      lunarDay: null == lunarDay
          ? _value.lunarDay
          : lunarDay // ignore: cast_nullable_to_non_nullable
              as int,
      lunarMonth: null == lunarMonth
          ? _value.lunarMonth
          : lunarMonth // ignore: cast_nullable_to_non_nullable
              as int,
      lunarYear: null == lunarYear
          ? _value.lunarYear
          : lunarYear // ignore: cast_nullable_to_non_nullable
              as int,
      solarDay: null == solarDay
          ? _value.solarDay
          : solarDay // ignore: cast_nullable_to_non_nullable
              as int,
      solarMonth: null == solarMonth
          ? _value.solarMonth
          : solarMonth // ignore: cast_nullable_to_non_nullable
              as int,
      solarYear: null == solarYear
          ? _value.solarYear
          : solarYear // ignore: cast_nullable_to_non_nullable
              as int,
      canChiDay: null == canChiDay
          ? _value.canChiDay
          : canChiDay // ignore: cast_nullable_to_non_nullable
              as String,
      canChiMonth: null == canChiMonth
          ? _value.canChiMonth
          : canChiMonth // ignore: cast_nullable_to_non_nullable
              as String,
      canChiYear: null == canChiYear
          ? _value.canChiYear
          : canChiYear // ignore: cast_nullable_to_non_nullable
              as String,
      tiet: null == tiet
          ? _value.tiet
          : tiet // ignore: cast_nullable_to_non_nullable
              as String,
      isLeapMonth: null == isLeapMonth
          ? _value.isLeapMonth
          : isLeapMonth // ignore: cast_nullable_to_non_nullable
              as bool,
      jd: null == jd
          ? _value.jd
          : jd // ignore: cast_nullable_to_non_nullable
              as String,
      hoangDao: null == hoangDao
          ? _value._hoangDao
          : hoangDao // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dayMeaning: null == dayMeaning
          ? _value.dayMeaning
          : dayMeaning // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LunarDateImpl extends _LunarDate {
  const _$LunarDateImpl(
      {required this.lunarDay,
      required this.lunarMonth,
      required this.lunarYear,
      required this.solarDay,
      required this.solarMonth,
      required this.solarYear,
      required this.canChiDay,
      required this.canChiMonth,
      required this.canChiYear,
      required this.tiet,
      required this.isLeapMonth,
      required this.jd,
      required final List<String> hoangDao,
      required this.dayMeaning})
      : _hoangDao = hoangDao,
        super._();

  factory _$LunarDateImpl.fromJson(Map<String, dynamic> json) =>
      _$$LunarDateImplFromJson(json);

  @override
  final int lunarDay;
  @override
  final int lunarMonth;
  @override
  final int lunarYear;
  @override
  final int solarDay;
  @override
  final int solarMonth;
  @override
  final int solarYear;
  @override
  final String canChiDay;
  @override
  final String canChiMonth;
  @override
  final String canChiYear;
  @override
  final String tiet;
// Tiết khí
  @override
  final bool isLeapMonth;
  @override
  final String jd;
// Julian day
  final List<String> _hoangDao;
// Julian day
  @override
  List<String> get hoangDao {
    if (_hoangDao is EqualUnmodifiableListView) return _hoangDao;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hoangDao);
  }

// Giờ hoàng đạo
  @override
  final String dayMeaning;

  @override
  String toString() {
    return 'LunarDate(lunarDay: $lunarDay, lunarMonth: $lunarMonth, lunarYear: $lunarYear, solarDay: $solarDay, solarMonth: $solarMonth, solarYear: $solarYear, canChiDay: $canChiDay, canChiMonth: $canChiMonth, canChiYear: $canChiYear, tiet: $tiet, isLeapMonth: $isLeapMonth, jd: $jd, hoangDao: $hoangDao, dayMeaning: $dayMeaning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LunarDateImpl &&
            (identical(other.lunarDay, lunarDay) ||
                other.lunarDay == lunarDay) &&
            (identical(other.lunarMonth, lunarMonth) ||
                other.lunarMonth == lunarMonth) &&
            (identical(other.lunarYear, lunarYear) ||
                other.lunarYear == lunarYear) &&
            (identical(other.solarDay, solarDay) ||
                other.solarDay == solarDay) &&
            (identical(other.solarMonth, solarMonth) ||
                other.solarMonth == solarMonth) &&
            (identical(other.solarYear, solarYear) ||
                other.solarYear == solarYear) &&
            (identical(other.canChiDay, canChiDay) ||
                other.canChiDay == canChiDay) &&
            (identical(other.canChiMonth, canChiMonth) ||
                other.canChiMonth == canChiMonth) &&
            (identical(other.canChiYear, canChiYear) ||
                other.canChiYear == canChiYear) &&
            (identical(other.tiet, tiet) || other.tiet == tiet) &&
            (identical(other.isLeapMonth, isLeapMonth) ||
                other.isLeapMonth == isLeapMonth) &&
            (identical(other.jd, jd) || other.jd == jd) &&
            const DeepCollectionEquality().equals(other._hoangDao, _hoangDao) &&
            (identical(other.dayMeaning, dayMeaning) ||
                other.dayMeaning == dayMeaning));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      lunarDay,
      lunarMonth,
      lunarYear,
      solarDay,
      solarMonth,
      solarYear,
      canChiDay,
      canChiMonth,
      canChiYear,
      tiet,
      isLeapMonth,
      jd,
      const DeepCollectionEquality().hash(_hoangDao),
      dayMeaning);

  /// Create a copy of LunarDate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LunarDateImplCopyWith<_$LunarDateImpl> get copyWith =>
      __$$LunarDateImplCopyWithImpl<_$LunarDateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LunarDateImplToJson(
      this,
    );
  }
}

abstract class _LunarDate extends LunarDate {
  const factory _LunarDate(
      {required final int lunarDay,
      required final int lunarMonth,
      required final int lunarYear,
      required final int solarDay,
      required final int solarMonth,
      required final int solarYear,
      required final String canChiDay,
      required final String canChiMonth,
      required final String canChiYear,
      required final String tiet,
      required final bool isLeapMonth,
      required final String jd,
      required final List<String> hoangDao,
      required final String dayMeaning}) = _$LunarDateImpl;
  const _LunarDate._() : super._();

  factory _LunarDate.fromJson(Map<String, dynamic> json) =
      _$LunarDateImpl.fromJson;

  @override
  int get lunarDay;
  @override
  int get lunarMonth;
  @override
  int get lunarYear;
  @override
  int get solarDay;
  @override
  int get solarMonth;
  @override
  int get solarYear;
  @override
  String get canChiDay;
  @override
  String get canChiMonth;
  @override
  String get canChiYear;
  @override
  String get tiet; // Tiết khí
  @override
  bool get isLeapMonth;
  @override
  String get jd; // Julian day
  @override
  List<String> get hoangDao; // Giờ hoàng đạo
  @override
  String get dayMeaning;

  /// Create a copy of LunarDate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LunarDateImplCopyWith<_$LunarDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
