// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vietnamese_holiday.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VietnameseHoliday _$VietnameseHolidayFromJson(Map<String, dynamic> json) {
  return _VietnameseHoliday.fromJson(json);
}

/// @nodoc
mixin _$VietnameseHoliday {
  String get name => throw _privateConstructorUsedError;
  int get day => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  bool get isLunar => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get isOfficial => throw _privateConstructorUsedError;

  /// Serializes this VietnameseHoliday to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VietnameseHoliday
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VietnameseHolidayCopyWith<VietnameseHoliday> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VietnameseHolidayCopyWith<$Res> {
  factory $VietnameseHolidayCopyWith(
          VietnameseHoliday value, $Res Function(VietnameseHoliday) then) =
      _$VietnameseHolidayCopyWithImpl<$Res, VietnameseHoliday>;
  @useResult
  $Res call(
      {String name,
      int day,
      int month,
      bool isLunar,
      String? description,
      bool isOfficial});
}

/// @nodoc
class _$VietnameseHolidayCopyWithImpl<$Res, $Val extends VietnameseHoliday>
    implements $VietnameseHolidayCopyWith<$Res> {
  _$VietnameseHolidayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VietnameseHoliday
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? day = null,
    Object? month = null,
    Object? isLunar = null,
    Object? description = freezed,
    Object? isOfficial = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      isLunar: null == isLunar
          ? _value.isLunar
          : isLunar // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isOfficial: null == isOfficial
          ? _value.isOfficial
          : isOfficial // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VietnameseHolidayImplCopyWith<$Res>
    implements $VietnameseHolidayCopyWith<$Res> {
  factory _$$VietnameseHolidayImplCopyWith(_$VietnameseHolidayImpl value,
          $Res Function(_$VietnameseHolidayImpl) then) =
      __$$VietnameseHolidayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int day,
      int month,
      bool isLunar,
      String? description,
      bool isOfficial});
}

/// @nodoc
class __$$VietnameseHolidayImplCopyWithImpl<$Res>
    extends _$VietnameseHolidayCopyWithImpl<$Res, _$VietnameseHolidayImpl>
    implements _$$VietnameseHolidayImplCopyWith<$Res> {
  __$$VietnameseHolidayImplCopyWithImpl(_$VietnameseHolidayImpl _value,
      $Res Function(_$VietnameseHolidayImpl) _then)
      : super(_value, _then);

  /// Create a copy of VietnameseHoliday
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? day = null,
    Object? month = null,
    Object? isLunar = null,
    Object? description = freezed,
    Object? isOfficial = null,
  }) {
    return _then(_$VietnameseHolidayImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      isLunar: null == isLunar
          ? _value.isLunar
          : isLunar // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isOfficial: null == isOfficial
          ? _value.isOfficial
          : isOfficial // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VietnameseHolidayImpl implements _VietnameseHoliday {
  const _$VietnameseHolidayImpl(
      {required this.name,
      required this.day,
      required this.month,
      required this.isLunar,
      this.description,
      this.isOfficial = false});

  factory _$VietnameseHolidayImpl.fromJson(Map<String, dynamic> json) =>
      _$$VietnameseHolidayImplFromJson(json);

  @override
  final String name;
  @override
  final int day;
  @override
  final int month;
  @override
  final bool isLunar;
  @override
  final String? description;
  @override
  @JsonKey()
  final bool isOfficial;

  @override
  String toString() {
    return 'VietnameseHoliday(name: $name, day: $day, month: $month, isLunar: $isLunar, description: $description, isOfficial: $isOfficial)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VietnameseHolidayImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.isLunar, isLunar) || other.isLunar == isLunar) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isOfficial, isOfficial) ||
                other.isOfficial == isOfficial));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, day, month, isLunar, description, isOfficial);

  /// Create a copy of VietnameseHoliday
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VietnameseHolidayImplCopyWith<_$VietnameseHolidayImpl> get copyWith =>
      __$$VietnameseHolidayImplCopyWithImpl<_$VietnameseHolidayImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VietnameseHolidayImplToJson(
      this,
    );
  }
}

abstract class _VietnameseHoliday implements VietnameseHoliday {
  const factory _VietnameseHoliday(
      {required final String name,
      required final int day,
      required final int month,
      required final bool isLunar,
      final String? description,
      final bool isOfficial}) = _$VietnameseHolidayImpl;

  factory _VietnameseHoliday.fromJson(Map<String, dynamic> json) =
      _$VietnameseHolidayImpl.fromJson;

  @override
  String get name;
  @override
  int get day;
  @override
  int get month;
  @override
  bool get isLunar;
  @override
  String? get description;
  @override
  bool get isOfficial;

  /// Create a copy of VietnameseHoliday
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VietnameseHolidayImplCopyWith<_$VietnameseHolidayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
