import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class HabitApi {
  const HabitApi(this._dio);

  final Dio _dio;

  Future<String> getHabits() async {
    final response = await _dio.get<String>(
      '/habit',
      queryParameters: <String, dynamic>{'parameter2': 'value2'},
      options: Options(
        headers: <String, dynamic>{'header2': 'value2'},
      ),
    );  
    return response.data!;
  }

  Future<String> getHabitRecords(DateTime dateTime) async {
    final response = await _dio.get<String>(
      '/habit/record',
      queryParameters: {'date': DateFormat('yyyy-MM-dd').format(dateTime)}
    );
    return response.data!;
  }
}