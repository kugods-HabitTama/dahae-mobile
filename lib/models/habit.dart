import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit.freezed.dart';
part 'habit.g.dart';

@freezed
class Habit with _$Habit {
  const factory Habit({
    required int id,
    required String title,
    required String action,
    required int value,
    required String unit,
    @TimeStringToTimeOfDayConverter() required TimeOfDay time,
    @DateStringToDateTimeConverter() required DateTime startDate,
    @DateStringToDateTimeConverter() required DateTime endDate,
    @DayStringToIntConverter() required List<int> days,
  }) = _Habit;

  factory Habit.fromJson(Map<String, Object?> json) => _$HabitFromJson(json);
}

final Map<String, int> dayToIdx = {
  'Mon': 1,
  'Tue': 2,
  'Wed': 3,
  'Thu': 4,
  'Fri': 5,
  'Sat': 6,
  'Sun': 7
};

final Map<int, String> idxToDay = {
  1: 'Mon',
  2: 'Tue',
  3: 'Wed',
  4: 'Thu',
  5: 'Fri',
  6: 'Sat',
  7: 'Sun'
};

class DayStringToIntConverter implements JsonConverter<int, String> {
  const DayStringToIntConverter();

  @override
  int fromJson(String day) => dayToIdx[day]!;

  @override
  String toJson(int idx) => idxToDay[idx]!;
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
