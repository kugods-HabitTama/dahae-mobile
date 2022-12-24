import 'package:dahae_mobile/models/converters.dart';
import 'package:dahae_mobile/models/day_of_week.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit.freezed.dart';
part 'habit.g.dart';

@freezed
class Habit with _$Habit {
  const Habit._();

  const factory Habit({
    int? id,
    required String title,
    required String action,
    required int value,
    @Default(0) int progress,
    required String unit,
    @TimeStringToTimeOfDayConverter() required TimeOfDay time,
    @DateStringToDateTimeConverter() required DateTime startDate,
    @DateStringToDateTimeConverter() required DateTime endDate,
    required List<DayOfWeek> days,
  }) = _Habit;

  factory Habit.fromJson(Map<String, Object?> json) => _$HabitFromJson(json);

  String get daysToString => days.map((e) => e.korean).join(', ');
  double get progressPercent => progress / value;
}
