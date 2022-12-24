import 'package:dahae_mobile/api/api.dart';
import 'package:dahae_mobile/models/habit.dart';
import 'package:dahae_mobile/models/habit_record.dart';
import 'package:flutter/material.dart';

import 'all_habit_dropdown.dart';
import 'calender_header.dart';
import 'habit_record_tile.dart';

class HabitScreen extends StatefulWidget {
  final DateTime dateTime;

  const HabitScreen({super.key, required this.dateTime});

  @override
  State<HabitScreen> createState() => _HabitScreenState();
}

class _HabitScreenState extends State<HabitScreen> {
  // final _mockData = Future<List<HabitList>>.delayed(
  //   const Duration(seconds: 1),
  //   () => HabitRepo.habitList,
  // );
  late Future<List<HabitRecord>> habitRecords;
  late Future<List<Habit>> habits;

  void _init() {
    habitRecords = getHabitRecords(widget.dateTime);
    habits = getHabits();
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(HabitScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.dateTime != widget.dateTime) {
      _init();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CalenderHeader(selectedDate: widget.dateTime),
          Flexible(
            child: FutureBuilder(
              future: habitRecords,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: snapshot.data!
                            .map((e) => HabitRecordTile(habitRecord: e))
                            .toList(),
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error'));
                } else {
                  // Loading widget
                  return const Center(child: Text('Loading'));
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FutureBuilder(
        future: habits,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return AllHabitDropdown(habits: snapshot.data!);
          } else if (snapshot.hasError) {
            debugPrint(snapshot.error.toString());
            return const Text('Error');
          } else {
            return const Text('loading');
          }
        },
      ),
    );
  }
}
