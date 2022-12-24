import 'package:dahae_mobile/api/models/habit_response.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class HabitApi {
  const HabitApi(this._dio);

  final Dio _dio;

  Future<HabitResponse> getHabits() async {
    final response = await _dio.get<Map<String, dynamic>>('/habit');
    final json = response.data!;
    return HabitResponse.fromJson(json);
  }

  Future<HabitResponse> getHabitRecords(DateTime dateTime) async {
    final response = await _dio.get<Map<String, dynamic>>('/habit/record',
        queryParameters: {'date': DateFormat('yyyy-MM-dd').format(dateTime)});
    final json = response.data!;
    return HabitResponse.fromJson(json);
  }
}
