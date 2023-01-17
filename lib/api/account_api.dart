import 'package:dahae_mobile/api/models/auth_response.dart';
import 'package:dahae_mobile/api/models/habit_response.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import 'models/account_response.dart';

class AccountApi {
  const AccountApi(this._dio);

  final Dio _dio;

  // 사용자의 프로필 정보를 가져오는 메커니즘을 정의한다.
  Future<AccountResponse> getProfile() async {
    final response = await _dio.get<Map<String, dynamic>>('/users/profile');
    final json = response.data!;
    return AccountResponse.fromJson(json);
  }

  // 사용자의 이름, 사진을 수정하는 메커니즘을 정의한다.

  // 사용자 계정 삭제 메커니즘을 정의한다.
}
