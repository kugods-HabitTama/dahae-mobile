import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width, size.height);
  }

  // Rect getCircle(Size size) {
  //   return Rect.fromCircle(center: center, radius: radius);
  // }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}

class BannerCircle extends StatelessWidget {
  BannerCircle({
    super.key,
    required this.label,
    required this.main,
    this.labelEnd = '',
  });

  String label;
  String main;
  String labelEnd;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return ClipOval(
      clipper: MyClipper(),
      child: Container(
        height: 80,
        width: 80,
        color: Color(0xFFFEFEFE),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: themeData.textTheme.subtitle2?.copyWith(fontSize: 9),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2),
              child: Text(
                main,
                style: labelEnd != ''
                    ? themeData.textTheme.bodyText1
                        ?.copyWith(fontWeight: FontWeight.w700, fontSize: 16)
                    : themeData.textTheme.bodyText1
                        ?.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
              child: labelEnd != ''
                  ? Text(
                      labelEnd,
                      style:
                          themeData.textTheme.subtitle2?.copyWith(fontSize: 9),
                    )
                  : Container(),
            )
          ],
        ),
      ),
    );
  }
}

class PetBanner extends StatelessWidget {
  const PetBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BannerCircle(label: '애정도', main: '80%'),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 7),
              child: BannerCircle(
                label: '현재는',
                main: '유아기',
                labelEnd: '입니다.',
              ),
            ),
            BannerCircle(label: '경험치', main: '80%'),
          ],
        ),
        SizedBox(height: 45),
      ],
    );
  }
}
