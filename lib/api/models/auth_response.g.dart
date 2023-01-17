// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthResponse _$$_AuthResponseFromJson(Map<String, dynamic> json) =>
    _$_AuthResponse(
      emailAuthCode: json['emailAuthCode'] as int?,
      userAuth: json['userAuth'] == null
          ? null
          : Auth.fromJson(json['userAuth'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AuthResponseToJson(_$_AuthResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('emailAuthCode', instance.emailAuthCode);
  writeNotNull('userAuth', instance.userAuth?.toJson());
  return val;
}
