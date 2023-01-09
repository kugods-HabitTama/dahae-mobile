import 'dart:math';
import 'dart:ui';

import 'package:dahae_mobile/screens/habit/edit_dialog.dart';
import 'package:flutter/material.dart';

import '../../models/habit.dart';

class AllHabitDropdown extends StatefulWidget {
  final List<Habit> habits;
  const AllHabitDropdown({Key? key, required this.habits}) : super(key: key);

  @override
  State<AllHabitDropdown> createState() => _AllHabitDropdownState();
}

class _AllHabitDropdownState extends State<AllHabitDropdown> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    var height =
        _open ? min(MediaQuery.of(context).size.height - 100, 570.0) : 40.0;

    var width = _open ? MediaQuery.of(context).size.width - 30 : 40.0;

    var borderRadius = _open
        ? const BorderRadius.only(
            topLeft: Radius.circular(6),
            topRight: Radius.circular(6),
            bottomLeft: Radius.circular(6),
            bottomRight: Radius.circular(20))
        : const BorderRadius.all(Radius.circular(20));

    var allHabitList = _open
        ? SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.habits
                    .map((e) => AllHabitDropdownTile(habit: e))
                    .toList()),
          )
        : null;

    var knobIcon = AnimatedRotation(
      turns: _open ? -0.25 : 0,
      duration: const Duration(milliseconds: 100),
      child: Icon(
        Icons.menu,
        size: 26,
        color: Theme.of(context).highlightColor,
      ),
    );

    var knob = GestureDetector(
      onTap: (() {
        setState(() {
          _open = !_open;
        });
      }),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            if (!_open)
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 5,
              )
          ],
        ),
        child: knobIcon,
      ),
    );

    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        AnimatedContainer(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: borderRadius,
          ),
          padding: const EdgeInsets.all(4),
          height: height,
          width: width,
          duration: const Duration(milliseconds: 100),
          child: allHabitList,
        ),
        knob,
      ],
    );
  }
}

class AllHabitDropdownTile extends StatelessWidget {
  const AllHabitDropdownTile({
    Key? key,
    required this.habit,
  }) : super(key: key);

  final Habit habit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                habit.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color(0xFF0F0324),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
                        child: EditDialog(
                          title: habit.title,
                          days: habit.days,
                          action: habit.action,
                          value: habit.value,
                          unit: habit.unit,
                          startDate: habit.startDate,
                          endDate: habit.endDate,
                        ),
                        // child: MyDialog(itemTitle: habit.title),
                      );
                    });
              },
              icon: const Icon(Icons.edit),
              color: Theme.of(context).highlightColor,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomFABLoc extends FloatingActionButtonLocation {
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    return Offset(
      scaffoldGeometry.scaffoldSize.width -
          scaffoldGeometry.floatingActionButtonSize.width,
      scaffoldGeometry.scaffoldSize.height -
          scaffoldGeometry.floatingActionButtonSize.height,
    );
  }
}
