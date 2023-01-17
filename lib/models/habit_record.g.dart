// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HabitRecord _$$_HabitRecordFromJson(Map<String, dynamic> json) =>
    _$_HabitRecord(
      habit: Habit.fromJson(json['habit'] as Map<String, dynamic>),
      progress: json['progress'] as int,
    );

Map<String, dynamic> _$$_HabitRecordToJson(_$_HabitRecord instance) =>
    <String, dynamic>{
      'habit': instance.habit.toJson(),
      'progress': instance.progress,
    };
