import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScaffold extends StatelessWidget {
  final Widget child;

  const HomeScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: const NavBar(),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () => GoRouter.of(context).go('/habit'),
            icon: const Icon(Icons.calendar_month),
            enableFeedback: false,
          ),
          IconButton(
            onPressed: () => GoRouter.of(context).go('/pet'),
            icon: const Icon(Icons.pets),
            enableFeedback: false,
          ),
          IconButton(
            onPressed: () => GoRouter.of(context).go('/profile'),
            icon: const Icon(Icons.person),
            enableFeedback: false,
          ),
        ],
      ),
    );
  }
}
