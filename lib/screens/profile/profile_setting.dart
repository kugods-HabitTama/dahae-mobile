import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'profile_box.dart';

class SettingScroll extends StatefulWidget {
  const SettingScroll({super.key});

  @override
  State<SettingScroll> createState() => _SettingScrollState();
}

class _SettingScrollState extends State<SettingScroll> {
  bool alarmSet = false;

  Widget alarm(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const SettingBox(
            text: '푸쉬 알림 설정', iconAddr: 'assets/icons/push_alarm.png'),
        Positioned(
          right: 30,
          child: CupertinoSwitch(
              activeColor: Theme.of(context).highlightColor,
              trackColor: Colors.grey,
              value: alarmSet,
              onChanged: (value) => setState(() => alarmSet = !alarmSet)),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LinkBox(
              url: 'Notice',
              box: SettingBox(
                  text: '공지사항', iconAddr: 'assets/icons/notice.png')),
          const LinkBox(
            url: 'AppInfo',
            box: SettingBox(
                text: '어플리케이션 정보', iconAddr: 'assets/icons/app_info.png'),
          ),
          alarm(context),
        ],
      ),
    );
  }
}
