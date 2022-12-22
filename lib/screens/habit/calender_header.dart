import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Todo
// 달력기능. 클릭했을 때 달력이 만들어져서 보여야되고, 다시 클릭하면 원상복구됨.
// 날짜를 찾아서 클릭했을 때 go_router를 통해 해당 날짜로 이동할 수 있어야함.

class Header extends StatelessWidget {
  const Header({super.key});

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
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 0),
          )
        ],
        color: Theme.of(context).backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: headerContent(context)
      ),
    );
  }

  Column headerContent(BuildContext context) {
    return Column( 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top)
        ),   // 상태바 높이 패딩
        Text(
          '안녕하세요 !',
          textAlign: TextAlign.left, 
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '오늘도 힘차게 ', 
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: '다해 ', 
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Theme.of(context).highlightColor)),
                      TextSpan(
                        text: '볼까요?', 
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ]
                  ),
                ),
              ],
            ),
            Image(image: AssetImage('assets/images/logo.png'))
          ],
        ),
        Text(_CurrentDay(), textAlign: TextAlign.left, style: TextStyle(fontSize: 12),),
        SizedBox(height:10),  // 간격 띄우기
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            dayButton('월'),
            dayButton('화'),
            dayButton('수'),
            dayButton('목'),
            dayButton('금'),
            dayButton('토'),
            dayButton('일'),
          ],
        )
      ],
    );
  }

  RawMaterialButton dayButton(day) {
    return RawMaterialButton(
      onPressed: () {},
      elevation: 2.0,
      fillColor: Color(0x80D3BFF9),
      child: Text(day),
      padding: EdgeInsets.all(15.0),
      constraints: BoxConstraints(),
      shape: CircleBorder(),
    );
  }

  // ElevatedButton dayButton(day) {
  //   return ElevatedButton(
  //     onPressed: () {}, 
  //     child: Text(day, style: TextStyle(color: Colors.black),),
  //     style: ElevatedButton.styleFrom(
  //       backgroundColor: Color(0x80D3BFF9),
  //       shape: CircleBorder()),
        
  //   );
  // }

  String _CurrentDay() {
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);

    return DateFormat('yyyy 년 MM 월 dd 일').format(today);
  }
}
