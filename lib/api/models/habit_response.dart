import '../../models/habit.dart';
import '../../models/habit_record.dart';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit_response.freezed.dart';
part 'habit_response.g.dart';

@freezed
class HabitResponse with _$HabitResponse {
  const factory HabitResponse({
    List<HabitRecord>? habitRecords, // get /habit/record
    List<Habit>? habits, // get /habit
  }) = _HabitResponse;

  factory HabitResponse.fromJson(Map<String, dynamic> json) =>
      _$HabitResponseFromJson(json);
}
