import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters.dart';
import 'day_of_week.dart';

part 'habit.freezed.dart';
part 'habit.g.dart';

@freezed
class Habit with _$Habit {
  const Habit._();

  const factory Habit({
    // id는 처음에 생성할 때는 없으니까 nullable로 처리
    int? id,

    // 나머지 값들은 백엔드에서 넘겨주는 그대로 작성
    required String title,
    required String action,
    required int value,
    required String unit,
    @TimeStringToTimeOfDayConverter() required TimeOfDay time,
    @DateStringToDateTimeConverter() required DateTime startDate,
    @DateStringToDateTimeConverter() required DateTime endDate,
    required List<DayOfWeek> days,
  }) = _Habit;

  factory Habit.fromJson(Map<String, dynamic> json) => _$HabitFromJson(json);

  // [1, 2, 4] -> '월, 화, 목'
  String get daysToString => days.map((e) => e.korean).join(', ');
}
