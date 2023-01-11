import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../models/day_of_week.dart';

// TODO: 클릭했을 때 달력이 만들어져서 보여야되고, 다시 클릭하면 원상복구됨.
class CalenderHeader extends StatefulWidget {
  final DateTime selectedDate;

  const CalenderHeader({super.key, required this.selectedDate});

  @override
  State<CalenderHeader> createState() => _CalenderHeaderState();
}

class _CalenderHeaderState extends State<CalenderHeader> {
  bool _week = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: MediaQuery.of(context).size.width,
      height: _week? 248: 487,
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
      child: Stack(
        alignment: Alignment.center,
        children: [
          expandingButton(context),
          Padding(
            padding: _week
              ? const EdgeInsets.fromLTRB(22, 29, 22, 29)
              : const EdgeInsets.fromLTRB(40, 29, 40, 29),
            child: _week? headerContentWeek(context) : headerContentMonth(context),
          )
        ]
      )
    );
  }

  AnimatedPositioned expandingButton(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      top: _week? 220: 459,
      child: GestureDetector(
        onTap: (() {
        setState(() {
          _week = !_week;
        });
      }),
        behavior: HitTestBehavior.translucent,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 28,
                decoration: const BoxDecoration(
                  color: Colors.red, // test color
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))
                )
              ),
            ),
            Positioned(
              top: 17,
              child: Container(
                  width: 40,
                  height: 3,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(1.5)),
                )
            ),
          ],
        )
      ),
    );
  }

  // 맨 처음 요일이 표기된 메뉴
  Column headerContentWeek(BuildContext context) {
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
            const Image(image: AssetImage('assets/images/logo.png'), height: 31)
          ],
        ),
        Text(
          DateFormat('yyyy 년 MM 월 dd 일').format(widget.selectedDate),
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 13), // 간격 띄우기
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            7,
            (index) => dayButton(
              date: widget.selectedDate
                  .add(Duration(days: index - widget.selectedDate.weekday + 1)),
              dayButtomMode: DayButtonMode.dateOfWeek,
              context: context,
              isEmpty: false,
            ),
          ),
        )
      ],
    );
  }

  Column headerContentMonth(BuildContext context) {
    var week1 = ['일', '월', '화', '수', '목', '금', '토'];
    var monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    DateTime firstDay = DateTime(widget.selectedDate.year, widget.selectedDate.month, 1);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        ), // 상태바 높이 패딩
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              DateFormat('yyyy 년 MM 월 dd 일').format(widget.selectedDate),
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(width: 12,),
            const Image(image: AssetImage('assets/images/logo.png'), height: 24)
          ],
        ),
        const SizedBox(height: 42,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13), // 정렬 먼가 이상함 ..
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              7, 
              (index) => Text(week1[index], 
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)
              ))
          )
        ),
        Expanded(
          child: GridView.count(
            //shrinkWrap: true,
            padding: EdgeInsets.zero,
            crossAxisCount: 7,  // 열 개수
            children: List<Widget>.generate(
              monthDays[widget.selectedDate.month - 1] + firstDay.weekday % 7, 
              (index) {
                return dayButton(
                  date: widget.selectedDate // 일월화수목금토 순서
                    .add(Duration(days: index - firstDay.weekday % 7 - widget.selectedDate.day + 1)),
                  dayButtomMode: DayButtonMode.dayOfMonth,
                  context: context,
                  isEmpty: index >= firstDay.weekday % 7 ? false: true,
                );
              }
            ).toList()
          ),
        ),
      ],
    );
  }

  Widget dayButton({
    required DateTime date,
    required DayButtonMode dayButtomMode,
    required BuildContext context,
    required bool isEmpty,
  }) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final isToday = date == today;
    final isSelected = date == widget.selectedDate;
    final backgroundColor = isSelected
        ? const Color(0xFFC4F954)
        : isToday
            ? const Color(0xFFD3BFF9)
            : const Color(0x80D3BFF9);
    
    if (isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(5.5),
        child: SizedBox(
          height: 35,
          width: 35,
        )
      );
    }
    else {
      return GestureDetector(
        onTap: () => GoRouter.of(context)
            .go('/habit/${DateFormat('yyyy/MM/dd').format(date)}'),
        child: Padding(
          padding: dayButtomMode == DayButtonMode.dateOfWeek
              ? const EdgeInsets.all(0.0)
              : const EdgeInsets.all(5.5),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor,
            ),
            padding: dayButtomMode == DayButtonMode.dateOfWeek
              ? const EdgeInsets.all(14.5)
              : const EdgeInsets.all(10.0),
            child: dayButtomMode == DayButtonMode.dateOfWeek
              ? Text(DayOfWeek.koreanFormat(date.weekday - 1),
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300,),
                textAlign: TextAlign.center,
              )
              : Text('${date.day}',
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300,),
                textAlign: TextAlign.center,
              ),
          ),
        ),
      );
    }
  }
}

enum DayButtonMode { dateOfWeek, dayOfMonth }
