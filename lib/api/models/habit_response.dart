import '../../models/habit.dart';
import '../../models/habit_record.dart';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit_response.freezed.dart';
part 'habit_response.g.dart';

// Api 요청에서 response 데이터들을 감싸는 클래스
// 모든 요청을 우선 아래 클래스로 받은 뒤 나중에 유의미한 값을 가져가는 방식으로 처리
@freezed
class HabitResponse with _$HabitResponse {
  const factory HabitResponse({
    List<HabitRecord>? habitRecords, // get /habit/record
    List<Habit>? habits, // get /habit
  }) = _HabitResponse;

  factory HabitResponse.fromJson(Map<String, dynamic> json) =>
      _$HabitResponseFromJson(json);
}
