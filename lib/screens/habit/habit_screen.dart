import 'package:flutter/material.dart';

import '../../api/api.dart';
import '../../models/habit.dart';
import '../../models/habit_record.dart';
import 'all_habit_dropdown.dart';
import 'calender_header.dart';
import 'habit_record_tile.dart';

class HabitScreen extends StatefulWidget {
  final DateTime selectedDate;

  const HabitScreen({super.key, required this.selectedDate});

  @override
  State<HabitScreen> createState() => _HabitScreenState();
}

class _HabitScreenState extends State<HabitScreen> {
  late Future<List<HabitRecord>> habitRecords;
  late Future<List<Habit>> habits;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CalenderHeader(selectedDate: widget.selectedDate),
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
            return const Text('Error');
          } else {
            return const Text('loading');
          }
        },
      ),
    );
  }

  @override
  void didUpdateWidget(HabitScreen oldWidget) {
    // ?????? ???????????? ??? ????????? ????????? ?????? ?????? ????????? ??? ??????
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedDate != widget.selectedDate) {
      _init();
    }
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  // ?????? ????????? ????????? ????????? ???????????? ???????????? ???????????? ??????
  void _init() {
    habitRecords = getHabitRecords(widget.selectedDate);
    habits = getHabits();
  }
}
