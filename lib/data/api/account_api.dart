import 'package:dio/dio.dart';

import 'package:dahae_mobile/data/models/api_models/account_response.dart';

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
  Future<int> updateProfile(String name, String photo) async {
    final response = await _dio.patch<Map<String, dynamic>>(
      '/users/profile',
      data: {'name': name, 'photo': photo},
    );
    final json = response.statusCode!;
    return json;
  }

  // 사용자 계정 삭제 메커니즘을 정의한다.
  Future<int> deleteProfile() async {
    final response = await _dio.delete<Map<String, dynamic>>('/users');
    final json = response.statusCode!;
    return json;
  }
}
