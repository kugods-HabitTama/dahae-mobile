import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();

  const factory User({
    // id는 처음에 생성할 때는 없으니까 nullable로 처리
    //int? id,

    // 나머지 값들은 백엔드에서 넘겨주는 그대로 작성
    required String id,
    required String email,
    required String name,
    required String photo,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
