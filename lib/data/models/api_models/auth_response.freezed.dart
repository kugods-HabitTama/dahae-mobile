// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) {
  return _AuthResponse.fromJson(json);
}

/// @nodoc
mixin _$AuthResponse {
  int? get emailAuthCode => throw _privateConstructorUsedError;
  Auth? get userAuth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthResponseCopyWith<AuthResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResponseCopyWith<$Res> {
  factory $AuthResponseCopyWith(
          AuthResponse value, $Res Function(AuthResponse) then) =
      _$AuthResponseCopyWithImpl<$Res, AuthResponse>;
  @useResult
  $Res call({int? emailAuthCode, Auth? userAuth});

  $AuthCopyWith<$Res>? get userAuth;
}

/// @nodoc
class _$AuthResponseCopyWithImpl<$Res, $Val extends AuthResponse>
    implements $AuthResponseCopyWith<$Res> {
  _$AuthResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAuthCode = freezed,
    Object? userAuth = freezed,
  }) {
    return _then(_value.copyWith(
      emailAuthCode: freezed == emailAuthCode
          ? _value.emailAuthCode
          : emailAuthCode // ignore: cast_nullable_to_non_nullable
              as int?,
      userAuth: freezed == userAuth
          ? _value.userAuth
          : userAuth // ignore: cast_nullable_to_non_nullable
              as Auth?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthCopyWith<$Res>? get userAuth {
    if (_value.userAuth == null) {
      return null;
    }

    return $AuthCopyWith<$Res>(_value.userAuth!, (value) {
      return _then(_value.copyWith(userAuth: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AuthResponseCopyWith<$Res>
    implements $AuthResponseCopyWith<$Res> {
  factory _$$_AuthResponseCopyWith(
          _$_AuthResponse value, $Res Function(_$_AuthResponse) then) =
      __$$_AuthResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? emailAuthCode, Auth? userAuth});

  @override
  $AuthCopyWith<$Res>? get userAuth;
}

/// @nodoc
class __$$_AuthResponseCopyWithImpl<$Res>
    extends _$AuthResponseCopyWithImpl<$Res, _$_AuthResponse>
    implements _$$_AuthResponseCopyWith<$Res> {
  __$$_AuthResponseCopyWithImpl(
      _$_AuthResponse _value, $Res Function(_$_AuthResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAuthCode = freezed,
    Object? userAuth = freezed,
  }) {
    return _then(_$_AuthResponse(
      emailAuthCode: freezed == emailAuthCode
          ? _value.emailAuthCode
          : emailAuthCode // ignore: cast_nullable_to_non_nullable
              as int?,
      userAuth: freezed == userAuth
          ? _value.userAuth
          : userAuth // ignore: cast_nullable_to_non_nullable
              as Auth?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthResponse with DiagnosticableTreeMixin implements _AuthResponse {
  const _$_AuthResponse({this.emailAuthCode, this.userAuth});

  factory _$_AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$$_AuthResponseFromJson(json);

  @override
  final int? emailAuthCode;
  @override
  final Auth? userAuth;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthResponse(emailAuthCode: $emailAuthCode, userAuth: $userAuth)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthResponse'))
      ..add(DiagnosticsProperty('emailAuthCode', emailAuthCode))
      ..add(DiagnosticsProperty('userAuth', userAuth));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthResponse &&
            (identical(other.emailAuthCode, emailAuthCode) ||
                other.emailAuthCode == emailAuthCode) &&
            (identical(other.userAuth, userAuth) ||
                other.userAuth == userAuth));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, emailAuthCode, userAuth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthResponseCopyWith<_$_AuthResponse> get copyWith =>
      __$$_AuthResponseCopyWithImpl<_$_AuthResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthResponseToJson(
      this,
    );
  }
}

abstract class _AuthResponse implements AuthResponse {
  const factory _AuthResponse(
      {final int? emailAuthCode, final Auth? userAuth}) = _$_AuthResponse;

  factory _AuthResponse.fromJson(Map<String, dynamic> json) =
      _$_AuthResponse.fromJson;

  @override
  int? get emailAuthCode;
  @override
  Auth? get userAuth;
  @override
  @JsonKey(ignore: true)
  _$$_AuthResponseCopyWith<_$_AuthResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
