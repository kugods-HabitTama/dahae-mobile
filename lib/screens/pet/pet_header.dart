import 'package:flutter/material.dart';

class PetHeader extends StatelessWidget {
  const PetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      alignment: Alignment.bottomCenter,
      child: Image.asset('assets/images/logo_3d.png', width: 90, height: 80),
      //decoration: BoxDecoration(
      // borderRadius: const BorderRadius.vertical(
      //   bottom: Radius.circular(200.0),
      // ),
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.grey.withOpacity(0.5),
      //     spreadRadius: 5,
      //     blurRadius: 7,
      //     offset: const Offset(0, 0),
      //   )
      // ],
      //color: Theme.of(context).backgroundColor,
      //),
    );
  }
}
