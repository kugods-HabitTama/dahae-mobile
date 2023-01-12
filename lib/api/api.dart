import 'package:dahae_mobile/models/habit_record.dart';
import 'package:dio/dio.dart';

import '../models/habit.dart';
import 'api_consts.dart';
import 'dio/dio_factory.dart';
import 'habit_api.dart';
import 'account_api.dart';

// 사용자의 모든 해빗을 가져오는 함수
Future<List<Habit>> getHabits() async {
  final dio = _createDio();
  final habitsApi = HabitApi(dio);
  final habitResponse = await habitsApi.getHabits();
  return habitResponse.habits!;
}

// 사용자의 해빗들 중 date와 같은 요일의 해빗을 가져온다.
Future<List<HabitRecord>> getHabitRecords(DateTime date) async {
  final dio = _createDio();
  final habitsApi = HabitApi(dio);
  final habitResponse = await habitsApi.getHabitRecords(date);
  return habitResponse.habitRecords!;
}

// // email 중복 체크
// Future<List<HabitRecord>> isEmailDuplicate(DateTime date) async {
//   final dio = _createDio();
//   final accountApi = AccountApi(dio);
//   final accountResponse = await accountApi.isEmailDuplicate(date);
//   return accountResponse; //.habitRecords!;
// }

// // 닉네임 중복 체크
// Future<List<HabitRecord>> isNameDuplicate(DateTime date) async {
//   final dio = _createDio();
//   final accountApi = AccountApi(dio);
//   final accountResponse = await accountApi.isNameDuplicate(date);
//   return accountResponse; //.habitRecords!;
// }

Dio _createDio() {
  // 나중에 인증 기능 추가할 때 사용함.
  // lib/api/services/api_auth_api.dart 파일로 사용하며
  // flutter secure storage를 통해 암호화한 키를 보관한다.
  //
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
