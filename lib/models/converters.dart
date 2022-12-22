import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

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
