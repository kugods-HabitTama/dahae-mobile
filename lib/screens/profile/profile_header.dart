import 'package:flutter/material.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //height: 180,
      decoration: BoxDecoration(
        borderRadius:
            const BorderRadius.vertical(bottom: Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
          )
        ],
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: headerContent(context),
      ),
    );
  }

  Column headerContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        ),
        const SizedBox(height: 40),
        const Image(image: AssetImage('assets/images/logo.png'), height: 40),
        const SizedBox(height: 10),
        Row(
          children: [
            Stack(
              children: [
                Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)))),
                // 수정 버튼~
                Positioned(
                    bottom: 7,
                    right: 7,
                    child: Icon(
                      Icons.circle_outlined,
                      size: 20,
                      color: Theme.of(context).primaryColor,
                    ))
              ],
            ),
            const SizedBox(width: 20),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                        width: 40,
                        child: Text(
                          '이름은',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        )),
                    Container(
                        height: 40,
                        width: 100,
                        margin: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6)))),
                    const SizedBox(
                        width: 60,
                        child: Text(
                          '입니다.',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ))
                  ],
                ),
                Container(
                  width: 240,
                  height: 40,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: const BorderRadius.all(Radius.circular(6))),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        width: 80,
                        height: 20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4))),
                        child: const Text(
                          '비밀번호 변경하기',
                          style: TextStyle(
                              fontSize: 9,
                              color: Color(0xFF925FF0),
                              fontWeight: FontWeight.w700),
                        )),
                  ],
                )
              ],
            ))
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
