import 'package:dahae_mobile/api/models/auth_response.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import 'models/auth_response.dart';

class AuthApi {
  const AuthApi(this._dio);

  final Dio _dio;
  // 로그인 메커니즘을 정의한다.
  // X
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/auth/login',
      data: {'email': email, 'password': password},
    );
    final json = response.data!;
    return json;
  }

  // 회원가입 메커니즘을 정의한다.
  Future<int> register(
      String email, String password, String name, String os) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/auth/register',
      data: {'email': email, 'password': password, 'name': name, 'os': os},
    );
    final json = response.statusCode!;
    return json;
  }

  // 이메일 중복검사하는 메커니즘을 정의한다.
  Future<bool> isEmailDuplicate(String email) async {
    final response = await _dio.get<String>(
      '/auth/email/duplicate',
      queryParameters: {'email': email},
    );
    final json = response.data!;
    return json.toLowerCase() == 'true';
  }

  // 닉네임 중복검사하는 메커니즘을 정의한다.
  Future<bool> isNameDuplicate(String name) async {
    final response = await _dio.get<String>(
      '/auth/name/duplicate',
      queryParameters: {'name': name},
    );
    final json = response.data!;
    return json.toLowerCase() == 'true';
  }

  // 인증번호 메일을 보내는 메커니즘을 정의한다.
  Future<String> getEmailAuthCode(String email) async {
    final response = await _dio.post<String>(
      '/auth/authenticate-email',
      data: {'email': email},
    );
    final json = response.data!;
    return json;
  }

  // 비밀번호를 변경하는 메커니즘을 정의한다.
  // X
  Future<int> changePassword(
      String currentPassword, String targetPassword) async {
    final response = await _dio.put<String>(
      '/auth/password',
      data: {
        'currentPassword': currentPassword,
        'targetPassword': targetPassword
      },
    );
    final json = response.statusCode!;
    return json;
  }
}
