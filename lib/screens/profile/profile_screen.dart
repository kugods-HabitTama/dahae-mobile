import 'package:flutter/material.dart';

import 'profile_header.dart';
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
          const ProfileHeader(),
          // 환경설정 text
          Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.fromLTRB(30, 10, 25, 5),
              height: 25,
              child: const Text(
                '환경설정',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              )),
          // 환경설정 list
          Flexible(
            child: Expanded(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NoticeBox(),
                  AppInfoBox(),
                  PushAlarmSetBox(),
                ],
              ),
            )),
          ),
          //로그아웃 및 계정삭제 BOX
          Container(
            width: double.infinity,
            height: 130,
            color: Theme.of(context).backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ProfileBottomBox(text: '로그아웃', outlined: false),
                const ProfileBottomBox(text: '계정 삭제', outlined: true),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
