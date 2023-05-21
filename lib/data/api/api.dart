import 'package:dio/dio.dart';

import 'package:dahae_mobile/common/constants.dart';
import 'package:dahae_mobile/common/util/dio_factory.dart';
import 'package:dahae_mobile/data/models/habit.dart';
import 'package:dahae_mobile/data/models/habit_record.dart';
import 'package:dahae_mobile/data/models/user.dart';
import 'habit_api.dart';
import 'account_api.dart';
import 'auth_api.dart';

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

// 사용자의 프로필 정보를 가져온다.
Future<User> getUserProfile() async {
  final dio = _createDio();
  final accountApi = AccountApi(dio);
  final accountResponse = await accountApi.getProfile();
  return accountResponse.userProfile!;
}

// 회원가입 정보를 서버로 보낸다
Future<int> userRegister(
    String email, String password, String name, String os) async {
  final dio = _createDio();
  final authApi = AuthApi(dio);
  final accountResponse = await authApi.register(email, password, name, os);
  return accountResponse;
}

// email 중복 체크
// true면 중복, false면 unique
Future<bool> isEmailDuplicate(String email) async {
  final dio = _createDio();
  final authApi = AuthApi(dio);
  final authResponse = await authApi.isEmailDuplicate(email);
  return authResponse;
}

// 닉네임 중복 체크
// true면 중복, false면 unique
Future<bool> isNameDuplicate(String name) async {
  final dio = _createDio();
  final authApi = AuthApi(dio);
  final authResponse = await authApi.isNameDuplicate(name);
  return authResponse;
}

// 이메일 인증 코드
// 6자리 string 숫자로 반환
Future<String> getEmailAuthCode(String email) async {
  final dio = _createDio();
  final authApi = AuthApi(dio);
  final authResponse = await authApi.getEmailAuthCode(email);
  return authResponse;
}

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
    Constants.baseUrl,
    //apiAuthInterceptor,
  );
  return dioFactory.create();
}
