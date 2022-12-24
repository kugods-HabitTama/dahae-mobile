// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HabitResponse _$HabitResponseFromJson(Map<String, dynamic> json) {
  return _HabitResponse.fromJson(json);
}

/// @nodoc
mixin _$HabitResponse {
  List<HabitRecord>? get habitRecords =>
      throw _privateConstructorUsedError; // get /habit/record
  List<Habit>? get habits => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HabitResponseCopyWith<HabitResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitResponseCopyWith<$Res> {
  factory $HabitResponseCopyWith(
          HabitResponse value, $Res Function(HabitResponse) then) =
      _$HabitResponseCopyWithImpl<$Res, HabitResponse>;
  @useResult
  $Res call({List<HabitRecord>? habitRecords, List<Habit>? habits});
}

/// @nodoc
class _$HabitResponseCopyWithImpl<$Res, $Val extends HabitResponse>
    implements $HabitResponseCopyWith<$Res> {
  _$HabitResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitRecords = freezed,
    Object? habits = freezed,
  }) {
    return _then(_value.copyWith(
      habitRecords: freezed == habitRecords
          ? _value.habitRecords
          : habitRecords // ignore: cast_nullable_to_non_nullable
              as List<HabitRecord>?,
      habits: freezed == habits
          ? _value.habits
          : habits // ignore: cast_nullable_to_non_nullable
              as List<Habit>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HabitResponseCopyWith<$Res>
    implements $HabitResponseCopyWith<$Res> {
  factory _$$_HabitResponseCopyWith(
          _$_HabitResponse value, $Res Function(_$_HabitResponse) then) =
      __$$_HabitResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<HabitRecord>? habitRecords, List<Habit>? habits});
}

/// @nodoc
class __$$_HabitResponseCopyWithImpl<$Res>
    extends _$HabitResponseCopyWithImpl<$Res, _$_HabitResponse>
    implements _$$_HabitResponseCopyWith<$Res> {
  __$$_HabitResponseCopyWithImpl(
      _$_HabitResponse _value, $Res Function(_$_HabitResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitRecords = freezed,
    Object? habits = freezed,
  }) {
    return _then(_$_HabitResponse(
      habitRecords: freezed == habitRecords
          ? _value._habitRecords
          : habitRecords // ignore: cast_nullable_to_non_nullable
              as List<HabitRecord>?,
      habits: freezed == habits
          ? _value._habits
          : habits // ignore: cast_nullable_to_non_nullable
              as List<Habit>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HabitResponse with DiagnosticableTreeMixin implements _HabitResponse {
  const _$_HabitResponse(
      {final List<HabitRecord>? habitRecords, final List<Habit>? habits})
      : _habitRecords = habitRecords,
        _habits = habits;

  factory _$_HabitResponse.fromJson(Map<String, dynamic> json) =>
      _$$_HabitResponseFromJson(json);

  final List<HabitRecord>? _habitRecords;
  @override
  List<HabitRecord>? get habitRecords {
    final value = _habitRecords;
    if (value == null) return null;
    if (_habitRecords is EqualUnmodifiableListView) return _habitRecords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// get /habit/record
  final List<Habit>? _habits;
// get /habit/record
  @override
  List<Habit>? get habits {
    final value = _habits;
    if (value == null) return null;
    if (_habits is EqualUnmodifiableListView) return _habits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HabitResponse(habitRecords: $habitRecords, habits: $habits)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HabitResponse'))
      ..add(DiagnosticsProperty('habitRecords', habitRecords))
      ..add(DiagnosticsProperty('habits', habits));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HabitResponse &&
            const DeepCollectionEquality()
                .equals(other._habitRecords, _habitRecords) &&
            const DeepCollectionEquality().equals(other._habits, _habits));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_habitRecords),
      const DeepCollectionEquality().hash(_habits));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HabitResponseCopyWith<_$_HabitResponse> get copyWith =>
      __$$_HabitResponseCopyWithImpl<_$_HabitResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HabitResponseToJson(
      this,
    );
  }
}

abstract class _HabitResponse implements HabitResponse {
  const factory _HabitResponse(
      {final List<HabitRecord>? habitRecords,
      final List<Habit>? habits}) = _$_HabitResponse;

  factory _HabitResponse.fromJson(Map<String, dynamic> json) =
      _$_HabitResponse.fromJson;

  @override
  List<HabitRecord>? get habitRecords;
  @override // get /habit/record
  List<Habit>? get habits;
  @override
  @JsonKey(ignore: true)
  _$$_HabitResponseCopyWith<_$_HabitResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
