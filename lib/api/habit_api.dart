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
  //

  // 새로운 해빗을 입력하는 메커니즘을 정의한다.
  //

  // 해빗을 수정하는 메커니즘을 정의한다.
  //

  // 해빗을 삭제하는 메커니즘을 정의한다.
  //

}
