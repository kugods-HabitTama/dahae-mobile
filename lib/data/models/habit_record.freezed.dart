// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HabitRecord _$HabitRecordFromJson(Map<String, dynamic> json) {
  return _HabitRecord.fromJson(json);
}

/// @nodoc
mixin _$HabitRecord {
  Habit get habit => throw _privateConstructorUsedError;
  int get progress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HabitRecordCopyWith<HabitRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitRecordCopyWith<$Res> {
  factory $HabitRecordCopyWith(
          HabitRecord value, $Res Function(HabitRecord) then) =
      _$HabitRecordCopyWithImpl<$Res, HabitRecord>;
  @useResult
  $Res call({Habit habit, int progress});

  $HabitCopyWith<$Res> get habit;
}

/// @nodoc
class _$HabitRecordCopyWithImpl<$Res, $Val extends HabitRecord>
    implements $HabitRecordCopyWith<$Res> {
  _$HabitRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habit = null,
    Object? progress = null,
  }) {
    return _then(_value.copyWith(
      habit: null == habit
          ? _value.habit
          : habit // ignore: cast_nullable_to_non_nullable
              as Habit,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HabitCopyWith<$Res> get habit {
    return $HabitCopyWith<$Res>(_value.habit, (value) {
      return _then(_value.copyWith(habit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_HabitRecordCopyWith<$Res>
    implements $HabitRecordCopyWith<$Res> {
  factory _$$_HabitRecordCopyWith(
          _$_HabitRecord value, $Res Function(_$_HabitRecord) then) =
      __$$_HabitRecordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Habit habit, int progress});

  @override
  $HabitCopyWith<$Res> get habit;
}

/// @nodoc
class __$$_HabitRecordCopyWithImpl<$Res>
    extends _$HabitRecordCopyWithImpl<$Res, _$_HabitRecord>
    implements _$$_HabitRecordCopyWith<$Res> {
  __$$_HabitRecordCopyWithImpl(
      _$_HabitRecord _value, $Res Function(_$_HabitRecord) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habit = null,
    Object? progress = null,
  }) {
    return _then(_$_HabitRecord(
      habit: null == habit
          ? _value.habit
          : habit // ignore: cast_nullable_to_non_nullable
              as Habit,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HabitRecord extends _HabitRecord with DiagnosticableTreeMixin {
  const _$_HabitRecord({required this.habit, required this.progress})
      : super._();

  factory _$_HabitRecord.fromJson(Map<String, dynamic> json) =>
      _$$_HabitRecordFromJson(json);

  @override
  final Habit habit;
  @override
  final int progress;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HabitRecord(habit: $habit, progress: $progress)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HabitRecord'))
      ..add(DiagnosticsProperty('habit', habit))
      ..add(DiagnosticsProperty('progress', progress));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HabitRecord &&
            (identical(other.habit, habit) || other.habit == habit) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, habit, progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HabitRecordCopyWith<_$_HabitRecord> get copyWith =>
      __$$_HabitRecordCopyWithImpl<_$_HabitRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HabitRecordToJson(
      this,
    );
  }
}

abstract class _HabitRecord extends HabitRecord {
  const factory _HabitRecord(
      {required final Habit habit,
      required final int progress}) = _$_HabitRecord;
  const _HabitRecord._() : super._();

  factory _HabitRecord.fromJson(Map<String, dynamic> json) =
      _$_HabitRecord.fromJson;

  @override
  Habit get habit;
  @override
  int get progress;
  @override
  @JsonKey(ignore: true)
  _$$_HabitRecordCopyWith<_$_HabitRecord> get copyWith =>
      throw _privateConstructorUsedError;
}
