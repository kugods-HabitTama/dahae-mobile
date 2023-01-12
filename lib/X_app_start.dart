import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/screens.dart';
import 'app.dart';

class DahaeAppStart extends StatelessWidget {
  DahaeAppStart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _theme,
      home: LogInScreen(),
    );
  }

  final ThemeData _theme = ThemeData(
    //fontFamily: Inter,
    backgroundColor: const Color(0xFFF5EFFF),
    primaryColor: const Color(0xFFD3BFF9),
    highlightColor: const Color(0xFF925FF0),
    focusColor: const Color(0xFFC4F954),
    hintColor: const Color(0xFF969696),
    errorColor: const Color(0xFF925FF0),
    textTheme: const TextTheme(
        subtitle1: TextStyle(
            color: Color(0xFFD3BFF9),
            fontWeight: FontWeight.w600,
            fontSize: 14),
        subtitle2: TextStyle(
          color: Color(0xFF925FF0),
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
        bodyText1: TextStyle(
          color: Color(0xFF432876),
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        bodyText2: TextStyle(
          color: Color(0xFF0F0324),
          fontWeight: FontWeight.w700,
          fontSize: 16,
          overflow: TextOverflow.ellipsis,
        ),
        caption: TextStyle(
          color: Color(0xFF969696),
          fontWeight: FontWeight.w500,
          fontSize: 13,
        )),
  );
}
