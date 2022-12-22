import 'package:dahae_mobile/models/habit.dart';
import 'package:dahae_mobile/repos/habit_repo.dart';
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
  final _mockData = Future<List<Habit>>.delayed(
    const Duration(seconds: 3),
    () => HabitRepo.habitList,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Header(),
          Expanded(
            child: FutureBuilder(
              future: _mockData,
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: snapshot.data!
                          .map((e) => HabitRecordTile(title: e.title))
                          .toList(),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error'));
                } else {
                  // Loading widget
                  return const Center(child: Text('Loading'));
                }
              }),
            ),
          ),
        ],
      ),
      floatingActionButton: const AllHabitDropdown(),
    );
  }
}
