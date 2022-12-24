// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Habit _$HabitFromJson(Map<String, dynamic> json) {
  return _Habit.fromJson(json);
}

/// @nodoc
mixin _$Habit {
  int? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  @TimeStringToTimeOfDayConverter()
  TimeOfDay get time => throw _privateConstructorUsedError;
  @DateStringToDateTimeConverter()
  DateTime get startDate => throw _privateConstructorUsedError;
  @DateStringToDateTimeConverter()
  DateTime get endDate => throw _privateConstructorUsedError;
  List<DayOfWeek> get days => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HabitCopyWith<Habit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitCopyWith<$Res> {
  factory $HabitCopyWith(Habit value, $Res Function(Habit) then) =
      _$HabitCopyWithImpl<$Res, Habit>;
  @useResult
  $Res call(
      {int? id,
      String title,
      String action,
      int value,
      String unit,
      @TimeStringToTimeOfDayConverter() TimeOfDay time,
      @DateStringToDateTimeConverter() DateTime startDate,
      @DateStringToDateTimeConverter() DateTime endDate,
      List<DayOfWeek> days});
}

/// @nodoc
class _$HabitCopyWithImpl<$Res, $Val extends Habit>
    implements $HabitCopyWith<$Res> {
  _$HabitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? action = null,
    Object? value = null,
    Object? unit = null,
    Object? time = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? days = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<DayOfWeek>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HabitCopyWith<$Res> implements $HabitCopyWith<$Res> {
  factory _$$_HabitCopyWith(_$_Habit value, $Res Function(_$_Habit) then) =
      __$$_HabitCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String title,
      String action,
      int value,
      String unit,
      @TimeStringToTimeOfDayConverter() TimeOfDay time,
      @DateStringToDateTimeConverter() DateTime startDate,
      @DateStringToDateTimeConverter() DateTime endDate,
      List<DayOfWeek> days});
}

/// @nodoc
class __$$_HabitCopyWithImpl<$Res> extends _$HabitCopyWithImpl<$Res, _$_Habit>
    implements _$$_HabitCopyWith<$Res> {
  __$$_HabitCopyWithImpl(_$_Habit _value, $Res Function(_$_Habit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? action = null,
    Object? value = null,
    Object? unit = null,
    Object? time = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? days = null,
  }) {
    return _then(_$_Habit(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<DayOfWeek>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Habit extends _Habit with DiagnosticableTreeMixin {
  const _$_Habit(
      {this.id,
      required this.title,
      required this.action,
      required this.value,
      required this.unit,
      @TimeStringToTimeOfDayConverter() required this.time,
      @DateStringToDateTimeConverter() required this.startDate,
      @DateStringToDateTimeConverter() required this.endDate,
      required final List<DayOfWeek> days})
      : _days = days,
        super._();

  factory _$_Habit.fromJson(Map<String, dynamic> json) =>
      _$$_HabitFromJson(json);

  @override
  final int? id;
  @override
  final String title;
  @override
  final String action;
  @override
  final int value;
  @override
  final String unit;
  @override
  @TimeStringToTimeOfDayConverter()
  final TimeOfDay time;
  @override
  @DateStringToDateTimeConverter()
  final DateTime startDate;
  @override
  @DateStringToDateTimeConverter()
  final DateTime endDate;
  final List<DayOfWeek> _days;
  @override
  List<DayOfWeek> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Habit(id: $id, title: $title, action: $action, value: $value, unit: $unit, time: $time, startDate: $startDate, endDate: $endDate, days: $days)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Habit'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('action', action))
      ..add(DiagnosticsProperty('value', value))
      ..add(DiagnosticsProperty('unit', unit))
      ..add(DiagnosticsProperty('time', time))
      ..add(DiagnosticsProperty('startDate', startDate))
      ..add(DiagnosticsProperty('endDate', endDate))
      ..add(DiagnosticsProperty('days', days));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Habit &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, action, value, unit,
      time, startDate, endDate, const DeepCollectionEquality().hash(_days));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HabitCopyWith<_$_Habit> get copyWith =>
      __$$_HabitCopyWithImpl<_$_Habit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HabitToJson(
      this,
    );
  }
}

abstract class _Habit extends Habit {
  const factory _Habit(
      {final int? id,
      required final String title,
      required final String action,
      required final int value,
      required final String unit,
      @TimeStringToTimeOfDayConverter() required final TimeOfDay time,
      @DateStringToDateTimeConverter() required final DateTime startDate,
      @DateStringToDateTimeConverter() required final DateTime endDate,
      required final List<DayOfWeek> days}) = _$_Habit;
  const _Habit._() : super._();

  factory _Habit.fromJson(Map<String, dynamic> json) = _$_Habit.fromJson;

  @override
  int? get id;
  @override
  String get title;
  @override
  String get action;
  @override
  int get value;
  @override
  String get unit;
  @override
  @TimeStringToTimeOfDayConverter()
  TimeOfDay get time;
  @override
  @DateStringToDateTimeConverter()
  DateTime get startDate;
  @override
  @DateStringToDateTimeConverter()
  DateTime get endDate;
  @override
  List<DayOfWeek> get days;
  @override
  @JsonKey(ignore: true)
  _$$_HabitCopyWith<_$_Habit> get copyWith =>
      throw _privateConstructorUsedError;
}
