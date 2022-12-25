import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../models/day_of_week.dart';

// TODO: 클릭했을 때 달력이 만들어져서 보여야되고, 다시 클릭하면 원상복구됨.
class CalenderHeader extends StatelessWidget {
  final DateTime selectedDate;

  const CalenderHeader({super.key, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //height: 180,
      decoration: BoxDecoration(
        borderRadius:
            const BorderRadius.vertical(bottom: Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
          )
        ],
        color: Theme.of(context).backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: headerContent(context),
      ),
    );
  }

  Column headerContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        ), // 상태바 높이 패딩
        const Text(
          '안녕하세요 !',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: '오늘도 힘차게 ',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '다해 ',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).highlightColor,
                        ),
                      ),
                      const TextSpan(
                        text: '볼까요?',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Image(image: AssetImage('assets/images/logo.png'))
          ],
        ),
        Text(
          DateFormat('yyyy 년 MM 월 dd 일').format(selectedDate),
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 10), // 간격 띄우기
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            7,
            (index) => dayButton(
              date: selectedDate
                  .add(Duration(days: index - selectedDate.weekday + 1)),
              dayButtomMode: DayButtomMode.dateOfWeek,
              context: context,
            ),
          ),
        )
      ],
    );
  }

  Widget dayButton({
    required DateTime date,
    required DayButtomMode dayButtomMode,
    required BuildContext context,
  }) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final isToday = date == today;
    final isSelected = date == selectedDate;
    final backgroundColor = isSelected
        ? const Color(0xFFC4F954)
        : isToday
            ? const Color(0xFFD3BFF9)
            : const Color(0x80D3BFF9);

    return GestureDetector(
      onTap: () => GoRouter.of(context)
          .go('/habit/${DateFormat('yyyy/MM/dd').format(date)}'),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        padding: const EdgeInsets.all(15.0),
        child: dayButtomMode == DayButtomMode.dateOfWeek
            ? Text(DayOfWeek.koreanFormat(date.weekday - 1))
            : Text('${date.day}'),
      ),
    );
  }
}

enum DayButtomMode { dateOfWeek, dayOfMonth }
