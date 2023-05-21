import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/screens.dart';

class AppRouter {
  static GoRouter get router => _router;

  // ShellRoute를 위한 Key설정
  static final GlobalKey<NavigatorState> _rootkey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _homekey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    navigatorKey: _rootkey,
    initialLocation: '/login',
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
}

// 기본적으로 SingleChildScrollView에서 파란색으로 빛나는 것 없애기 위한 코드
class DiableScrollGlow extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
