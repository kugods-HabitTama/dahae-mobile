import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'package:dahae_mobile/data/models/user.dart';
import 'package:dahae_mobile/data/api/api.dart';
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
  late Future<User> userProfile;

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
      body: FutureBuilder(
        future: userProfile,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProfileHeader(userProfile: snapshot.data!),
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
                          child:
                              ProfileBottomBox(text: '로그아웃', outlined: false)),
                      GestureDetector(
                          onTap: () {},
                          child:
                              ProfileBottomBox(text: '계정 삭제', outlined: true)),
                    ],
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          } else {
            // Loading widget
            return const Center(child: Text('Loading'));
          }
        },
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  // @override
  // void didUpdateWidget(ProfileScreen oldWidget) {
  //   // 프로필 정보(이름/사진) 수정 시 업데이트
  //   super.didUpdateWidget(oldWidget);
  //   if (oldWidget.selectedDate != widget.selectedDate) {
  //     _init();
  //   }
  // }

  @override
  void initState() {
    super.initState();
    _init();
  }

  // 한번 실행될 때마다 서버에 요청으로 보낸다고 생각하면 편함
  void _init() {
    userProfile = getUserProfile();
  }
}
