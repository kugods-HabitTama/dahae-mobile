import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'screens/screens.dart';

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
          behavior: DiableScrollGlow(), child: child ?? Container()),
    );
  }

  final GoRouter _router = GoRouter(
    navigatorKey: _rootkey,
    initialLocation: '/habit',
    routes: [
      GoRoute(
        path: '/',
        redirect: (_, __) => '/habit',
      ),
      GoRoute(
        path: '/login',
        redirect: (_, __) => '/habit',
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
              dateTime: DateTime(
                int.parse(state.params['year']!),
                int.parse(state.params['month']!),
                int.parse(state.params['day']!),
              ),
            ),
          ),
          GoRoute(
            path: '/pet',
            builder: (context, state) => const PetScreen(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      )
    ],
  );

  final ThemeData _theme = ThemeData(
    backgroundColor: const Color(0xFFF5EFFF),
    primaryColor: const Color(0xFFD3BFF9),
    highlightColor: const Color(0xFF925FF0),
    focusColor: const Color(0xFFC4F954),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Color(0xFF432876),
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      bodyText2: TextStyle(
        color: Color(0xFF432876),
        fontWeight: FontWeight.w700,
        fontSize: 16,
      ),
    ),
  );
}

class DiableScrollGlow extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
