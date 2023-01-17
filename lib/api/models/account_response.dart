import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/user.dart';

part 'account_response.freezed.dart';
part 'account_response.g.dart';

// Api 요청에서 response 데이터들을 감싸는 클래스
// 모든 요청을 우선 아래 클래스로 받은 뒤 나중에 유의미한 값을 가져가는 방식으로 처리
@freezed
class AccountResponse with _$AccountResponse {
  const factory AccountResponse({
    User? userProfile,
  }) = _AccountResponse;

  factory AccountResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountResponseFromJson(json);
}
