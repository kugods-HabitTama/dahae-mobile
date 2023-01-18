import 'package:dahae_mobile/models/habit.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import 'models/habit_response.dart';

class HabitApi {
  const HabitApi(this._dio);

  final Dio _dio;

  // 해빗들을 가져오는 메커니즘을 정의한다.
  // HabitResponse 중 habits 칸에 값이 들어간다.
  Future<HabitResponse> getHabits() async {
    final response = await _dio.get<Map<String, dynamic>>('/habit');
    final json = response.data!;
    return HabitResponse.fromJson(json);
  }

  // 해빗 레코드들을 가져오는 메커니즘을 정의한다.
  // HabitResponse 중 habitRecords 칸에 값이 들어간다.
  Future<HabitResponse> getHabitRecords(DateTime dateTime) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/habit/record',
      queryParameters: {'date': DateFormat('yyyy-MM-dd').format(dateTime)},
    );
    final json = response.data!;
    return HabitResponse.fromJson(json);
  }

  // 해빗 진행정도를 입력하는 메커니즘을 정의한다.
  // HabitResponse 중 progress 칸에 값이 들어간다.
  // X
  Future<HabitResponse> changeHabitProgress(
      int habitId, DateTime dateTime, int progress) async {
    final response = await _dio.put<Map<String, dynamic>>(
      '/habit',
      data: {
        'habitId': habitId,
        'date': DateFormat('yyyy-MM-dd').format(dateTime),
        'progress': progress
      },
    );
    final json = response.data!;
    return HabitResponse.fromJson(json);
  }

  // 새로운 해빗을 입력하는 메커니즘을 정의한다.
  // X
  Future<int> createHabit(Habit habit) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/habit',
      data: {
        'title': habit.title,
        'action': habit.action,
        'value': habit.value,
        'unit': habit.unit,
        'time': habit.time,
        'startDate': DateFormat('yyyy-MM-dd').format(habit.startDate),
        'endDate': DateFormat('yyyy-MM-dd').format(habit.endDate),
        'days': habit.days
      },
    );
    final json = response.statusCode!;
    return json;
  }

  // 해빗을 수정하는 메커니즘을 정의한다.
  // X
  // habit을 수정하면 기존에 있던 것들은 어떻게되나?
  Future<int> updateHabit(Habit habit, int habitId) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/habit/{$habitId}',
      data: {
        'title': habit.title,
        'action': habit.action,
        'value': habit.value,
        'unit': habit.unit,
        'time': habit.time,
        'startDate': DateFormat('yyyy-MM-dd').format(habit.startDate),
        'endDate': DateFormat('yyyy-MM-dd').format(habit.endDate),
        'days': habit.days
      },
    );
    final json = response.statusCode!;
    return json;
  }

  // 해빗을 삭제하는 메커니즘을 정의한다.
  // X
  // habit을 지우면 기존에 있던 것도 다 사라지나?
  Future<int> deleteHabit(int habitId) async {
    final response = await _dio.put<Map<String, dynamic>>(
      '/habit/{$habitId}',
    );
    final json = response.statusCode!;
    return json;
  }
}
