import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'profile_header.dart';
import 'profile_setting.dart';
import 'profile_component.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //profile data 정의

  void _showAlert({String? title, String? message}) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title ?? ''),
            content: Text(message ?? ''),
            actions: [
              CupertinoDialogAction(
                  isDefaultAction: false,
                  child: Text("확인"),
                  onPressed: () {
                    // 서버와 auth 초기화 하기
                    Navigator.pop(context);
                    GoRouter.of(context).go('/splash');
                  }),
              CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text("취소"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          );
        });
  }

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
              children: [
                GestureDetector(
                    onTap: () {
                      _showAlert(title: '로그아웃', message: '로그아웃2');
                    },
                    child: ProfileBottomBox(text: '로그아웃', outlined: false)),
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
