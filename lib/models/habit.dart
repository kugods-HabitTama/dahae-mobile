import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit.freezed.dart';
part 'habit.g.dart';

@freezed
class Habit with _$Habit {
  const Habit._();

  const factory Habit({
    required int id,
    required String title,
    required String action,
    required int value,
    required String unit,
    @TimeStringToTimeOfDayConverter() required TimeOfDay time,
    @DateStringToDateTimeConverter() required DateTime startDate,
    @DateStringToDateTimeConverter() required DateTime endDate,
    required List<DayOfWeek> days,
  }) = _Habit;

  factory Habit.fromJson(Map<String, Object?> json) => _$HabitFromJson(json);

  String get daysToString => days.map((e) => e.korean).join(', ');
}

@JsonEnum()
enum DayOfWeek {
  @JsonValue('Mon')
  mon,
  @JsonValue('Tue')
  tue,
  @JsonValue('Web')
  wed,
  @JsonValue('Tue')
  thu,
  @JsonValue('Fri')
  fri,
  @JsonValue('Sat')
  sat,
  @JsonValue('Sun')
  sun;

  static final List<String> _korean = ['월', '화', '수', '목', '금', '토', '일']; 

  int get day => index + 1; // 월요일 1 ~ 일요일 7 (DateTime 기준)
  String get korean => _korean[index];
}

class DateStringToDateTimeConverter implements JsonConverter<DateTime, String> {
  const DateStringToDateTimeConverter();

  @override
  DateTime fromJson(String date) => DateTime.parse(date);

  @override
  String toJson(DateTime dateTime) =>
      '${dateTime.year}-${dateTime.month}-${dateTime.day}';
}

class TimeStringToTimeOfDayConverter
    implements JsonConverter<TimeOfDay, String> {
  const TimeStringToTimeOfDayConverter();

  @override
  TimeOfDay fromJson(String date) =>
      TimeOfDay.fromDateTime(DateTime.parse('0000-00-00 $date'));

  @override
  String toJson(TimeOfDay timeOfDay) => '${timeOfDay.hour}:${timeOfDay.minute}';
}
