import 'package:dahae_mobile/models/habit_record.dart';

import 'habit_api.dart';
import 'api_consts.dart';
import 'dio/dio_factory.dart';
import '../models/habit.dart';

import 'package:dio/dio.dart';

Future<List<Habit>> getHabits() async {
  final dio = _createDio();
  final habitsApi = HabitApi(dio);
  final habitResponse = await habitsApi.getHabits();
  return habitResponse.habits!;
}

Future<List<HabitRecord>> getHabitRecords(DateTime dateTime) async {
  final dio = _createDio();
  final habitsApi = HabitApi(dio);
  final habitResponse = await habitsApi.getHabitRecords(dateTime);
  return habitResponse.habitRecords!;
}

Dio _createDio() {
  // final apiAuthInterceptor = ApiAuthInterceptor(
  //   ApiConsts.publicKey,
  //   const ApiKeyService(),
  // );
  final dioFactory = DioFactory(
    ApiConsts.baseUrl,
    // apiAuthInterceptor,
  );
  return dioFactory.create();
}
