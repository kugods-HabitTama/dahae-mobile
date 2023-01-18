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

  // figma 레이아웃 비율에 맞춰 적용 사이즈 값을 계산해주는 함수
  double getSize(size, screen, [isHeight=true]) {
    const double figmaWidth = 390;
    const double figmaHeight = 844;
    return isHeight
      ? size * screen / figmaHeight
      : size * screen / figmaWidth;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: screenWidth,
      // height: _week
      //   ? getSize(248, screenHeight)
      //   : getSize(487, screenHeight),
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
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top)
          ),  // 상태바 높이 패딩
          Stack(
            alignment: Alignment.center,
            children: [
              expandingButton(context),
              Padding(
                padding: _week
                  ? EdgeInsets.fromLTRB(
                      getSize(22, screenWidth, false), getSize(29, screenHeight),
                      getSize(22, screenWidth, false), getSize(29, screenHeight)
                    )
                  : EdgeInsets.fromLTRB(
                    getSize(40, screenWidth, false), getSize(47, screenHeight),
                    getSize(40, screenWidth, false), getSize(68, screenHeight)
                  ),
                child: _week
                  ? headerContentWeek(context)
                  : headerContentMonth(context),
              )
            ]
          )
        ]
      )
    );
  }

  AnimatedPositioned expandingButton(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      bottom: 0,
      child: GestureDetector(
        onTap: (() {
          setState(() {
            _week = !_week;
          });
        }),
        onVerticalDragUpdate: (DragUpdateDetails details) {
          setState(() {
            if (_week & (details.delta.dy > 0)) {
              _week = !_week;
            }
            else if (!_week & (details.delta.dy < 0)) {
              _week = !_week;
            }
          });
        },
        behavior: HitTestBehavior.translucent,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: 0, // set opacity (0.0 ~ 1.0)
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: getSize(28, screenHeight),
                  decoration: const BoxDecoration(
                      color: Colors.red, // test color
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(20.0)))),
            ),
            Positioned(
              bottom: getSize(6, screenHeight),
              child: Container(
                width: getSize(40, screenWidth, false),
                height: getSize(3, screenHeight),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(1.5)),
              )),
          ],
        )),
    );
  }

  // 맨 처음 요일이 표기된 메뉴
  Column headerContentWeek(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    //final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '안녕하세요 !',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: getSize(18, screenHeight), fontWeight: FontWeight.bold),
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
                      TextSpan(
                        text: '오늘도 힘차게 ',
                        style: TextStyle(
                          fontSize: getSize(22, screenHeight),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '다해 ',
                        style: TextStyle(
                          fontSize: getSize(22, screenHeight),
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).highlightColor,
                        ),
                      ),
                      TextSpan(
                        text: '볼까요?',
                        style: TextStyle(
                          fontSize: getSize(22, screenHeight),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Image(image: const AssetImage('assets/images/logo.png'), height: getSize(31, screenHeight))
          ],
        ),
        SizedBox(height: getSize(4, screenHeight)),
        Text(
          DateFormat('yyyy 년 MM 월 dd 일').format(widget.selectedDate),
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: getSize(12, screenHeight), color:const Color.fromARGB(255, 67, 40, 118)),
        ),
        SizedBox(height: getSize(20, screenHeight)), // 간격 띄우기
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
        ),
        // const Padding (
        //   padding: EdgeInsets.only(bottom: 5)
        // )
      ],
    );
  }

  Column headerContentMonth(BuildContext context) {
    final week1 = ['일', '월', '화', '수', '목', '금', '토'];
    final monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    DateTime firstDay =
        DateTime(widget.selectedDate.year, widget.selectedDate.month, 1);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              DateFormat('yyyy 년 MM 월 dd 일').format(widget.selectedDate),
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(
              width: 12,
            ),
            const Image(image: AssetImage('assets/images/logo.png'), height: 24)
          ],
        ),
        SizedBox(
          height: getSize(42, screenHeight),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                7,
                (index) => Text(week1[index],
                  style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w500))))),
        //Container( height:1.0, width:500.0, color:Colors.red,),
        SizedBox( 
          height: getSize(219, screenHeight),
          child: GridView.count(
            //shrinkWrap: true,
            padding: EdgeInsets.zero,
            crossAxisCount: 7, // 열 개수
            mainAxisSpacing: getSize(11, screenWidth, false),
            crossAxisSpacing: getSize(13, screenHeight),
            physics: const NeverScrollableScrollPhysics(),
            children: List<Widget>.generate(
              monthDays[widget.selectedDate.month - 1] + firstDay.weekday % 7,
              (index) {
                return dayButton(
                  date: widget.selectedDate // 일월화수목금토 순서
                      .add(Duration(
                          days: index - firstDay.weekday % 7 -
                            widget.selectedDate.day + 1)),
                  dayButtomMode: DayButtonMode.dayOfMonth,
                  context: context,
                  isEmpty: index >= firstDay.weekday % 7 ? false : true,
                );
              }
            ).toList()
          ),
        ),
        //Container( height:1.0, width:500.0, color:Colors.red,),
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
    final screenHeight = MediaQuery.of(context).size.height;
    //final screenWidth = MediaQuery.of(context).size.width;

    if (isEmpty) {
      return Padding(
          padding: const EdgeInsets.all(5.5),
          child: SizedBox(
            height: getSize(35, screenHeight),
            width: getSize(35, screenHeight),
          ));
    } else {
      return GestureDetector(
        onTap: () => GoRouter.of(context)
            .go('/habit/${DateFormat('yyyy/MM/dd').format(date)}'),
        child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor,
            ),
            height: dayButtomMode == DayButtonMode.dateOfWeek
              ? getSize(39, screenHeight) : getSize(35, screenHeight),
            width: dayButtomMode == DayButtonMode.dateOfWeek
              ? getSize(39, screenHeight) : getSize(35, screenHeight),
            child: Align(
              alignment: Alignment.center,
              child: dayButtomMode == DayButtonMode.dateOfWeek
                  ? Text(DayOfWeek.koreanFormat(date.weekday - 1),
                      style: isSelected
                          ? TextStyle(
                              fontSize: getSize(18, screenHeight),
                              fontWeight: FontWeight.w600,
                            )
                          : TextStyle(
                              fontSize: getSize(16, screenHeight),
                              fontWeight: FontWeight.w300,
                              color: const Color.fromARGB(255, 67, 40, 118)))
                  : Text('${date.day}',
                      style: isSelected
                          ? TextStyle(
                              fontSize: getSize(15, screenHeight),
                              fontWeight: FontWeight.w500,
                            )
                          : TextStyle(
                              fontSize: getSize(15, screenHeight),
                              fontWeight: FontWeight.w300,
                              color: const Color.fromARGB(255, 67, 40, 118))),
            )),
      );
    }
  }
}

enum DayButtonMode { dateOfWeek, dayOfMonth }
