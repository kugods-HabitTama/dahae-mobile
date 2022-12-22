// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Habit _$$_HabitFromJson(Map<String, dynamic> json) => _$_Habit(
      id: json['id'] as int?,
      title: json['title'] as String,
      action: json['action'] as String,
      value: json['value'] as int,
      progress: json['progress'] as int? ?? 0,
      unit: json['unit'] as String?,
      time: const TimeStringToTimeOfDayConverter()
          .fromJson(json['time'] as String),
      startDate: const DateStringToDateTimeConverter()
          .fromJson(json['startDate'] as String),
      endDate: const DateStringToDateTimeConverter()
          .fromJson(json['endDate'] as String),
      days: (json['days'] as List<dynamic>)
          .map((e) => $enumDecode(_$DayOfWeekEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$_HabitToJson(_$_Habit instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'action': instance.action,
      'value': instance.value,
      'progress': instance.progress,
      'unit': instance.unit,
      'time': const TimeStringToTimeOfDayConverter().toJson(instance.time),
      'startDate':
          const DateStringToDateTimeConverter().toJson(instance.startDate),
      'endDate': const DateStringToDateTimeConverter().toJson(instance.endDate),
      'days': instance.days.map((e) => _$DayOfWeekEnumMap[e]!).toList(),
    };

const _$DayOfWeekEnumMap = {
  DayOfWeek.mon: 'Mon',
  DayOfWeek.tue: 'Tue',
  DayOfWeek.wed: 'Web',
  DayOfWeek.thu: 'Tue',
  DayOfWeek.fri: 'Fri',
  DayOfWeek.sat: 'Sat',
  DayOfWeek.sun: 'Sun',
};
