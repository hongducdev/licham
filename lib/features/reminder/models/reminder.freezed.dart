// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Reminder _$ReminderFromJson(Map<String, dynamic> json) {
  return _Reminder.fromJson(json);
}

/// @nodoc
mixin _$Reminder {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get lunarDay => throw _privateConstructorUsedError;
  int get lunarMonth => throw _privateConstructorUsedError;
  int get lunarYear => throw _privateConstructorUsedError;
  bool get isYearlyRecurring => throw _privateConstructorUsedError;
  bool get isMonthlyRecurring => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;

  /// Serializes this Reminder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReminderCopyWith<Reminder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderCopyWith<$Res> {
  factory $ReminderCopyWith(Reminder value, $Res Function(Reminder) then) =
      _$ReminderCopyWithImpl<$Res, Reminder>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      int lunarDay,
      int lunarMonth,
      int lunarYear,
      bool isYearlyRecurring,
      bool isMonthlyRecurring,
      DateTime createdAt,
      DateTime? updatedAt,
      bool isDeleted});
}

/// @nodoc
class _$ReminderCopyWithImpl<$Res, $Val extends Reminder>
    implements $ReminderCopyWith<$Res> {
  _$ReminderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? lunarDay = null,
    Object? lunarMonth = null,
    Object? lunarYear = null,
    Object? isYearlyRecurring = null,
    Object? isMonthlyRecurring = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? isDeleted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
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
      isYearlyRecurring: null == isYearlyRecurring
          ? _value.isYearlyRecurring
          : isYearlyRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      isMonthlyRecurring: null == isMonthlyRecurring
          ? _value.isMonthlyRecurring
          : isMonthlyRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReminderImplCopyWith<$Res>
    implements $ReminderCopyWith<$Res> {
  factory _$$ReminderImplCopyWith(
          _$ReminderImpl value, $Res Function(_$ReminderImpl) then) =
      __$$ReminderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      int lunarDay,
      int lunarMonth,
      int lunarYear,
      bool isYearlyRecurring,
      bool isMonthlyRecurring,
      DateTime createdAt,
      DateTime? updatedAt,
      bool isDeleted});
}

/// @nodoc
class __$$ReminderImplCopyWithImpl<$Res>
    extends _$ReminderCopyWithImpl<$Res, _$ReminderImpl>
    implements _$$ReminderImplCopyWith<$Res> {
  __$$ReminderImplCopyWithImpl(
      _$ReminderImpl _value, $Res Function(_$ReminderImpl) _then)
      : super(_value, _then);

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? lunarDay = null,
    Object? lunarMonth = null,
    Object? lunarYear = null,
    Object? isYearlyRecurring = null,
    Object? isMonthlyRecurring = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? isDeleted = null,
  }) {
    return _then(_$ReminderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
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
      isYearlyRecurring: null == isYearlyRecurring
          ? _value.isYearlyRecurring
          : isYearlyRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      isMonthlyRecurring: null == isMonthlyRecurring
          ? _value.isMonthlyRecurring
          : isMonthlyRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReminderImpl extends _Reminder {
  const _$ReminderImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.lunarDay,
      required this.lunarMonth,
      required this.lunarYear,
      required this.isYearlyRecurring,
      required this.isMonthlyRecurring,
      required this.createdAt,
      this.updatedAt,
      this.isDeleted = false})
      : super._();

  factory _$ReminderImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReminderImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final int lunarDay;
  @override
  final int lunarMonth;
  @override
  final int lunarYear;
  @override
  final bool isYearlyRecurring;
  @override
  final bool isMonthlyRecurring;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;
  @override
  @JsonKey()
  final bool isDeleted;

  @override
  String toString() {
    return 'Reminder(id: $id, title: $title, description: $description, lunarDay: $lunarDay, lunarMonth: $lunarMonth, lunarYear: $lunarYear, isYearlyRecurring: $isYearlyRecurring, isMonthlyRecurring: $isMonthlyRecurring, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReminderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.lunarDay, lunarDay) ||
                other.lunarDay == lunarDay) &&
            (identical(other.lunarMonth, lunarMonth) ||
                other.lunarMonth == lunarMonth) &&
            (identical(other.lunarYear, lunarYear) ||
                other.lunarYear == lunarYear) &&
            (identical(other.isYearlyRecurring, isYearlyRecurring) ||
                other.isYearlyRecurring == isYearlyRecurring) &&
            (identical(other.isMonthlyRecurring, isMonthlyRecurring) ||
                other.isMonthlyRecurring == isMonthlyRecurring) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      lunarDay,
      lunarMonth,
      lunarYear,
      isYearlyRecurring,
      isMonthlyRecurring,
      createdAt,
      updatedAt,
      isDeleted);

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderImplCopyWith<_$ReminderImpl> get copyWith =>
      __$$ReminderImplCopyWithImpl<_$ReminderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReminderImplToJson(
      this,
    );
  }
}

abstract class _Reminder extends Reminder {
  const factory _Reminder(
      {required final String id,
      required final String title,
      required final String description,
      required final int lunarDay,
      required final int lunarMonth,
      required final int lunarYear,
      required final bool isYearlyRecurring,
      required final bool isMonthlyRecurring,
      required final DateTime createdAt,
      final DateTime? updatedAt,
      final bool isDeleted}) = _$ReminderImpl;
  const _Reminder._() : super._();

  factory _Reminder.fromJson(Map<String, dynamic> json) =
      _$ReminderImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  int get lunarDay;
  @override
  int get lunarMonth;
  @override
  int get lunarYear;
  @override
  bool get isYearlyRecurring;
  @override
  bool get isMonthlyRecurring;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  bool get isDeleted;

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReminderImplCopyWith<_$ReminderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
