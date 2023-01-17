// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountResponse _$$_AccountResponseFromJson(Map<String, dynamic> json) =>
    _$_AccountResponse(
      userProfile: json['userProfile'] == null
          ? null
          : User.fromJson(json['userProfile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AccountResponseToJson(_$_AccountResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userProfile', instance.userProfile?.toJson());
  return val;
}
