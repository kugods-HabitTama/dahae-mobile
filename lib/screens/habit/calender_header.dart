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
      height: 180,
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            ), // 상태바 높이 패딩
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '안녕하세요 !',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: '오늘도 힘차게 ',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: '다해 ',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).highlightColor),
                          ),
                          const TextSpan(
                            text: '볼까요?',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      DateFormat('yyyy년 MM월 dd일').format(DateTime.now()),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                const Image(image: AssetImage('assets/images/logo.png'))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('월'),
                Text('화'),
                Text('수'),
                Text('목'),
                Text('금'),
                Text('토'),
                Text('일'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
