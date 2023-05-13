import 'package:dahae_mobile/models/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

//import '../../models/auth.dart';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

// Api 요청에서 response 데이터들을 감싸는 클래스
// 모든 요청을 우선 아래 클래스로 받은 뒤 나중에 유의미한 값을 가져가는 방식으로 처리
@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    //String? emailAuthCode,
    Auth? userAuth,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}
