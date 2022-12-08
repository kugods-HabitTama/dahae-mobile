

// import 'package:flutter/material.dart';

// class HabitRepo {
//   final List<Habit> habits = [];
//   // final List<HabitRecord> habitRecords = [];

//   void addHabit({
//     required name,
//     required 
//   }) {

//   }
// }

// class Habit {
//   final int id;
//   final int target;
//   final String title;
//   final List<int> days;
//   // final List<int> habitRecordIdxs;
//   final DateTime? startDate, endDate;
//   final TimeOfDay? startTime;

//   Habit.fromJson(Map<String, dynamic> json)
//       : id = json['id'] as int,
//         target = json['target'] as int,
//         title = json['title'] as String,
//         days = json['days'] as List<int>,
//         dateTimeRange = json['start_date'] != null && json['end_date'] != null
//             ? DateTimeRange(start: json['start_date'], end: json['end_date'])
//             : null,
//         startTime = json['start_time'] != null ? ;

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'title': title,
//         'days': days,
//         'start_date': dateTimeRange?.start,
//         'end_date': dateTimeRange?.end,
//         'start_time': startTime,
//       };
// }

// class HabitRecord {
//   // final int id;
//   // final int habitIdx;
//   final String title;
//   final TimeOfDay? startTime;

//   Habit.fromJson(Map<String, dynamic> json) : 
//     title = json['title'],
//     startTime = ;
// }
