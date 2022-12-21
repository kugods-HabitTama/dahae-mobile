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
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        AnimatedContainer(
          decoration: BoxDecoration(
            color: const Color(0xFFD3BFF9),
            borderRadius: _open
                ? const BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                    bottomRight: Radius.circular(25))
                : const BorderRadius.all(Radius.circular(20)),
          ),
          height:
              _open ? min(MediaQuery.of(context).size.height - 50, 427) : 40,
          width: _open ? min(MediaQuery.of(context).size.width - 31, 380) : 40,
          duration: const Duration(milliseconds: 100),
          child: _open
              // prevent overflow
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(width: 10, height: 12),
                      SizedBox(
                        height: max(369, 10),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 가로로만 확장하기 위해 ROW 안에 tile을 넣는게 너무 비효율적
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(child: AllHabitDropdownTile())
                                ],
                              ),
                              AllHabitDropdownTile(),
                              AllHabitDropdownTile(),
                              AllHabitDropdownTile(),
                              AllHabitDropdownTile(),
                              AllHabitDropdownTile(),
                              AllHabitDropdownTile(),
                              AllHabitDropdownTile(),
                              AllHabitDropdownTile(),
                              AllHabitDropdownTile(),
                              AllHabitDropdownTile(),
                            ],
                          ),
                        ),
                      ),
                      // do not cover menu Icon
                      const SizedBox(width: 10, height: 46),
                    ],
                  ),
                )
              : const SizedBox(width: 5, height: 5),
        ),
        GestureDetector(
          onTap: (() {
            setState(() {
              _open = !_open;
            });
          }),
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: const Color(0xFFD3BFF9),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  _open
                      ? const BoxShadow(color: Color(0xFFD3BFF9))
                      : BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                        )
                ]),
            child: _open
                ? const RotatedBox(
                    quarterTurns: 1,
                    child: Icon(Icons.menu, size: 26, color: Color(0xFF925FF0)))
                : const Icon(Icons.menu, size: 26, color: Color(0xFF925FF0)),
          ),
        ),
      ],
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
      padding: const EdgeInsets.fromLTRB(14, 0, 14, 9),
      child: Container(
        width: 300,
        height: 37,
        decoration: const BoxDecoration(
          color: Color(0xFFF5EFFF),
          borderRadius: BorderRadius.all(Radius.circular(5.2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SizedBox(height: 18, width: 33),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  // choice text overflow strategy
                  height: 18,
                  child: Text(
                    'Breathe & Breathe & Breathe & Breathe & Breathe & Breathe',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 14.7,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF2B2B2B),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 18, width: 30),
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
