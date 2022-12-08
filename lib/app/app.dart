import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../screens/screens.dart';

GlobalKey<NavigatorState> _rootkey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> _homekey = GlobalKey<NavigatorState>();

class DahaeApp extends StatelessWidget {
  DahaeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: _theme,
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
    backgroundColor: const Color.fromARGB(0xFF, 0xF5, 0xEF, 0xFF),
    primaryColor: const Color.fromARGB(0xFF, 0xD3, 0xBF, 0xF9),
    highlightColor: const Color.fromARGB(0xFF, 0x92, 0x5F, 0xF0),
  );
}
