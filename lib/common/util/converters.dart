import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

// 날짜가 yyyy-MM-dd 형식으로 들어오기 떄문에 이를 적절하게 DateTime 객체로 변환하여
// 사용이 가능하도록 convert하는 데에 사용한다.
class DateStringToDateTimeConverter implements JsonConverter<DateTime, String> {
  const DateStringToDateTimeConverter();

  @override
  DateTime fromJson(String date) => DateTime.parse(date);

  @override
  String toJson(DateTime dateTime) => DateFormat('yyyy-MM-dd').format(dateTime);
}

// 날짜가 hh:mm 형식으로 들어오기 떄문에 이를 적절하게 TimeOfDay 객체로 변환하여
// 사용이 가능하도록 convert하는 데에 사용한다.
class TimeStringToTimeOfDayConverter
    implements JsonConverter<TimeOfDay, String> {
  const TimeStringToTimeOfDayConverter();

  @override
  TimeOfDay fromJson(String date) =>
      TimeOfDay.fromDateTime(DateTime.parse('0000-00-00 $date'));

  @override
  String toJson(TimeOfDay timeOfDay) => '${timeOfDay.hour}:${timeOfDay.minute}';
}
