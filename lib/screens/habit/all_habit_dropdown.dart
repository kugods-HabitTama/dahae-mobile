import 'dart:math';

import 'package:flutter/material.dart';

class AllHabitDropdown extends StatefulWidget {
  const AllHabitDropdown({
    Key? key,
  }) : super(key: key);

  @override
  State<AllHabitDropdown> createState() => _AllHabitDropdownState();
}

class _AllHabitDropdownState extends State<AllHabitDropdown> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        setState(() {
          _open = !_open;
        });
      }),
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: _open ? Colors.amber : Colors.red,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        height: _open ? min(MediaQuery.of(context).size.height - 100, 400) : 40,
        width: _open ? min(MediaQuery.of(context).size.width - 100, 300) : 40,
        duration: const Duration(milliseconds: 100),
        child: _open
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    AllHabitDropdownTile(),
                  ],
                ),
              )
            : const Center(child: Icon(Icons.menu, size: 20)),
      ),
    );
  }
}

class AllHabitDropdownTile extends StatelessWidget {
  const AllHabitDropdownTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.red,
        child: Row(
          children: const [Expanded(child: Text('title')), Icon(Icons.done)],
        ),
      ),
    );
  }
}
