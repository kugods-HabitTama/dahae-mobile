import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// 메인 화면 감싸는 위젯
// 간단하게 Scaffold에 NavBar만 사용.
// NavBar에서 해빗, 다마고치, 프로필 창 오갈 수 있도록 함
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

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _menu = 0;

  @override
  Widget build(BuildContext context) {
    var calendar_icon = (_menu == 0)
        ? Image.asset("assets/icons/calendar_act.png", width: 30, height: 30)
        : Image.asset("assets/icons/calendar.png", width: 30, height: 30);

    var pet_icon = (_menu == 1)
        ? Image.asset("assets/icons/pet_act.png", width: 30, height: 30)
        : Image.asset("assets/icons/pet.png", width: 30, height: 30);

    var profile_icon = (_menu == 2)
        ? Image.asset("assets/icons/profile_act.png", width: 30, height: 30)
        : Image.asset("assets/icons/profile.png", width: 30, height: 30);

    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
          )
        ],
        color: Theme.of(context).backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: (() {
              _menu = 0;
              GoRouter.of(context).go('/habit');
            }),
            icon: calendar_icon,
            /*icon:
                Image.asset("assets/icons/calendar.png", width: 30, height: 30),
            isSelected: (_menu == 0) ? true : false,
            selectedIcon: Image.asset("assets/icons/calendar_act.png",
                width: 30, height: 30),*/
            enableFeedback: false,
          ),
          IconButton(
            onPressed: (() {
              _menu = 1;
              GoRouter.of(context).go('/pet');
            }),
            icon: pet_icon,
            enableFeedback: false,
          ),
          IconButton(
            onPressed: (() {
              _menu = 2;
              GoRouter.of(context).go('/profile');
            }),
            icon: profile_icon,
            enableFeedback: false,
          ),
        ],
      ),
    );
  }
}
