import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/screens.dart';

// ShellRoute를 위한 Key설정
GlobalKey<NavigatorState> _rootkey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> _homekey = GlobalKey<NavigatorState>();

class DahaeApp extends StatelessWidget {
  DahaeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: _theme,
      builder: (context, child) => ScrollConfiguration(
        behavior: DiableScrollGlow(),
        child: child ?? Container(),
      ),
    );
  }

  final GoRouter _router = GoRouter(
    navigatorKey: _rootkey,
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/',
        redirect: (_, __) => '/habit',
      ),
      GoRoute(
        path: '/splash',
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) {
          return LogInScreen();
        },
        //redirect: (_, __) => '/habit',
      ),
      GoRoute(
        path: '/habit',
        redirect: (_, __) {
          var now = DateTime.now();
          return '/habit/${now.year}/${now.month}/${now.day}';
        },
      ),
      ShellRoute(
        navigatorKey: _homekey,
        builder: (context, state, child) {
          return HomeScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: '/habit/:year(\\d+)/:month(\\d+)/:day(\\d+)',
            builder: (context, state) => HabitScreen(
              selectedDate: DateTime(
                int.parse(state.params['year']!),
                int.parse(state.params['month']!),
                int.parse(state.params['day']!),
              ),
            ),
          ),
          GoRoute(
            path: '/pet',
            builder: (context, state) => PetScreen(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => ProfileScreen(),
          ),
        ],
      )
    ],
  );

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

// 기본적으로 SingleChildScrollView에서 파란색으로 빛나는 것 없애기 위한 코드
class DiableScrollGlow extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
