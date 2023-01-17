// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountResponse _$AccountResponseFromJson(Map<String, dynamic> json) {
  return _AccountResponse.fromJson(json);
}

/// @nodoc
mixin _$AccountResponse {
  User? get userProfile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountResponseCopyWith<AccountResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountResponseCopyWith<$Res> {
  factory $AccountResponseCopyWith(
          AccountResponse value, $Res Function(AccountResponse) then) =
      _$AccountResponseCopyWithImpl<$Res, AccountResponse>;
  @useResult
  $Res call({User? userProfile});

  $UserCopyWith<$Res>? get userProfile;
}

/// @nodoc
class _$AccountResponseCopyWithImpl<$Res, $Val extends AccountResponse>
    implements $AccountResponseCopyWith<$Res> {
  _$AccountResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfile = freezed,
  }) {
    return _then(_value.copyWith(
      userProfile: freezed == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get userProfile {
    if (_value.userProfile == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.userProfile!, (value) {
      return _then(_value.copyWith(userProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AccountResponseCopyWith<$Res>
    implements $AccountResponseCopyWith<$Res> {
  factory _$$_AccountResponseCopyWith(
          _$_AccountResponse value, $Res Function(_$_AccountResponse) then) =
      __$$_AccountResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User? userProfile});

  @override
  $UserCopyWith<$Res>? get userProfile;
}

/// @nodoc
class __$$_AccountResponseCopyWithImpl<$Res>
    extends _$AccountResponseCopyWithImpl<$Res, _$_AccountResponse>
    implements _$$_AccountResponseCopyWith<$Res> {
  __$$_AccountResponseCopyWithImpl(
      _$_AccountResponse _value, $Res Function(_$_AccountResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfile = freezed,
  }) {
    return _then(_$_AccountResponse(
      userProfile: freezed == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountResponse
    with DiagnosticableTreeMixin
    implements _AccountResponse {
  const _$_AccountResponse({this.userProfile});

  factory _$_AccountResponse.fromJson(Map<String, dynamic> json) =>
      _$$_AccountResponseFromJson(json);

  @override
  final User? userProfile;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountResponse(userProfile: $userProfile)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountResponse'))
      ..add(DiagnosticsProperty('userProfile', userProfile));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountResponse &&
            (identical(other.userProfile, userProfile) ||
                other.userProfile == userProfile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userProfile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountResponseCopyWith<_$_AccountResponse> get copyWith =>
      __$$_AccountResponseCopyWithImpl<_$_AccountResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountResponseToJson(
      this,
    );
  }
}

abstract class _AccountResponse implements AccountResponse {
  const factory _AccountResponse({final User? userProfile}) =
      _$_AccountResponse;

  factory _AccountResponse.fromJson(Map<String, dynamic> json) =
      _$_AccountResponse.fromJson;

  @override
  User? get userProfile;
  @override
  @JsonKey(ignore: true)
  _$$_AccountResponseCopyWith<_$_AccountResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
