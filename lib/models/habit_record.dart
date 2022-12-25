import 'habit.dart';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit_record.freezed.dart';
part 'habit_record.g.dart';

@freezed
class HabitRecord with _$HabitRecord {
  const HabitRecord._();

  const factory HabitRecord({
    required Habit habit,
    @Default(0) int progress,
  }) = _HabitRecord;

  factory HabitRecord.fromJson(Map<String, dynamic> json) =>
      _$HabitRecordFromJson(json);

  // 분모가 0인 경우 나눗셈 방지
  double get progressPercent => habit.value == 0 ? 0 : progress / habit.value;
}
