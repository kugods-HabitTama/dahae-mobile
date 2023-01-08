import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoticeBox extends StatelessWidget {
  const NoticeBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 50,
                child: Icon(Icons.speaker,
                    color: Theme.of(context).highlightColor)),
            const Expanded(child: Text('공지사항', style: TextStyle(fontSize: 14))),
            SizedBox(
                width: 70,
                child: Icon(Icons.arrow_forward_ios,
                    color: Theme.of(context).highlightColor))
          ],
        ));
  }
}

class AppInfoBox extends StatelessWidget {
  const AppInfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 50,
                child: Icon(Icons.info_rounded,
                    color: Theme.of(context).highlightColor)),
            const Expanded(
                child: Text('어플리케이션 정보', style: TextStyle(fontSize: 14))),
            SizedBox(
                width: 70,
                child: Icon(Icons.arrow_forward_ios,
                    color: Theme.of(context).highlightColor))
          ],
        ));
  }
}

class PushAlarmSetBox extends StatefulWidget {
  const PushAlarmSetBox({super.key});

  @override
  State<PushAlarmSetBox> createState() => _PushAlarmSetBoxState();
}

class _PushAlarmSetBoxState extends State<PushAlarmSetBox> {
  bool alarmSet = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 50,
                child: Icon(Icons.notifications_active,
                    color: Theme.of(context).highlightColor)),
            const Expanded(
                child: Text('푸쉬 알림 설정', style: TextStyle(fontSize: 14))),
            SizedBox(
                width: 70,
                child: CupertinoSwitch(
                    activeColor: Theme.of(context).highlightColor,
                    value: alarmSet,
                    onChanged: (value) => setState(() => alarmSet = !alarmSet)))
          ],
        ));
  }
}

class ProfileBottomBox extends StatelessWidget {
  const ProfileBottomBox({
    Key? key,
    required this.text,
    required this.outlined,
  }) : super(key: key);

  final String text;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    var textTheme = outlined
        ? const TextStyle(
            fontSize: 15,
            color: Color(0xFF925FF0),
            fontWeight: FontWeight.w600,
          )
        : const TextStyle(
            color: Color(0xFFD9D9D9),
            fontSize: 15,
            fontWeight: FontWeight.w600,
          );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: outlined
              ? Theme.of(context).backgroundColor
              : Theme.of(context).highlightColor,
          border: Border.all(color: Theme.of(context).highlightColor, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(6))),
      child: Text(
        text,
        style: textTheme,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
