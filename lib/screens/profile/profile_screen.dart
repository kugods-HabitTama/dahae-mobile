import 'package:flutter/material.dart';

import 'profile_header.dart';
import 'profile_setting.dart';
import 'profile_box.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //profile data 정의

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // profile 내용
          ProfileHeader(),
          // 환경설정 text
          const SettingText(),
          // 환경설정 list
          const Flexible(
            child: Expanded(child: SettingScroll()),
          ),
          //로그아웃 및 계정삭제 BOX
          Container(
            width: double.infinity,
            height: 130,
            color: Theme.of(context).backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                ProfileBottomBox(text: '로그아웃', outlined: false),
                ProfileBottomBox(text: '계정 삭제', outlined: true),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
