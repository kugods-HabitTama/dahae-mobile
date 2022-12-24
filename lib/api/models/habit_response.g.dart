// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HabitResponse _$$_HabitResponseFromJson(Map<String, dynamic> json) =>
    _$_HabitResponse(
      habitRecords: (json['habitRecords'] as List<dynamic>?)
          ?.map((e) => HabitRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      habits: (json['habits'] as List<dynamic>?)
          ?.map((e) => Habit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_HabitResponseToJson(_$_HabitResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'habitRecords', instance.habitRecords?.map((e) => e.toJson()).toList());
  writeNotNull('habits', instance.habits?.map((e) => e.toJson()).toList());
  return val;
}
