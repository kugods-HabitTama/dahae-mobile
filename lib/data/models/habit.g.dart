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
      unit: json['unit'] as String,
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

Map<String, dynamic> _$$_HabitToJson(_$_Habit instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['title'] = instance.title;
  val['action'] = instance.action;
  val['value'] = instance.value;
  val['unit'] = instance.unit;
  val['time'] = const TimeStringToTimeOfDayConverter().toJson(instance.time);
  val['startDate'] =
      const DateStringToDateTimeConverter().toJson(instance.startDate);
  val['endDate'] =
      const DateStringToDateTimeConverter().toJson(instance.endDate);
  val['days'] = instance.days.map((e) => _$DayOfWeekEnumMap[e]!).toList();
  return val;
}

const _$DayOfWeekEnumMap = {
  DayOfWeek.mon: 'Mon',
  DayOfWeek.tue: 'Tue',
  DayOfWeek.wed: 'Wed',
  DayOfWeek.thu: 'Tue',
  DayOfWeek.fri: 'Fri',
  DayOfWeek.sat: 'Sat',
  DayOfWeek.sun: 'Sun',
};
