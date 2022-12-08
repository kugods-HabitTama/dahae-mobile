import 'package:flutter/material.dart';

// Todo
// 달력기능. 클릭했을 때 달력이 만들어져서 보여야되고, 다시 클릭하면 원상복구됨.
// 날짜를 찾아서 클릭했을 때 go_router를 통해 해당 날짜로 이동할 수 있어야함.

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
