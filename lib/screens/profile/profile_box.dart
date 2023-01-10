import 'package:dahae_mobile/screens/screens_consts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingText extends StatelessWidget {
  const SettingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.fromLTRB(30, 10, 25, 5),
        height: 25,
        child: const Text(
          '환경설정',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ));
  }
}

class SettingBox extends StatelessWidget {
  const SettingBox({
    Key? key,
    required this.text,
    required this.iconAddr,
  }) : super(key: key);

  final String text;
  final String iconAddr;

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
              width: 50, child: Image.asset(iconAddr, width: 25, height: 25)),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
          SizedBox(
            width: 70,
            child: Icon(Icons.arrow_forward_ios,
                color: Theme.of(context).highlightColor),
          )
        ],
      ),
    );
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

class LinkBox extends StatefulWidget {
  const LinkBox({
    Key? key,
    required this.url,
    required this.box,
  }) : super(key: key);

  final String url;
  final SettingBox box;

  @override
  State<LinkBox> createState() => _LinkBoxState(url, box);
}

class _LinkBoxState extends State<LinkBox> {
  final String url;
  final SettingBox box;

  late Uri _url;

  _LinkBoxState(this.url, this.box) {}

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  void initState() {
    super.initState();
    _url = ('Notice'.compareTo(url) == 0)
        ? Uri.parse(ScreensConsts.dahaeNoticeUrl)
        : ('AppInfo'.compareTo(url) == 0)
            ? Uri.parse(ScreensConsts.dahaeInfoUrl)
            : Uri.parse(url);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchUrl,
      child: box,
    );
  }
}
