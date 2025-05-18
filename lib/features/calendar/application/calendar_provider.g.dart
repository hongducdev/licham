// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$calendarStateHash() => r'8c3941ffb6853335705bb0fca3e757bb521576e7';

/// See also [CalendarState].
@ProviderFor(CalendarState)
final calendarStateProvider = AutoDisposeNotifierProvider<
    CalendarState,
    ({
      DateTime selectedDay,
      DateTime focusedDay,
      LunarDate lunarDate
    })>.internal(
  CalendarState.new,
  name: r'calendarStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$calendarStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CalendarState = AutoDisposeNotifier<
    ({DateTime selectedDay, DateTime focusedDay, LunarDate lunarDate})>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
