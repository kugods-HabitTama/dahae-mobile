import 'package:flutter/material.dart';

import 'package:dahae_mobile/data/enums/day_of_week.dart';
import 'day_button.dart';

class DaysBox extends StatefulWidget {
  final List<DayOfWeek> days;

  const DaysBox({super.key, required this.days});

  @override
  State<DaysBox> createState() => _DaysBoxState();
}

class _DaysBoxState extends State<DaysBox> {
  // @@@@ 이 함수 마저 구현하기
  List<bool> daysToBool(List<DayOfWeek> days) {
    return [false, false, false, true, false, true, false];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "실천 요일 *",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.center,
            child: DayButtons(isSelected: daysToBool(widget.days)),
          )
        ],
      ),
    );
  }
}
