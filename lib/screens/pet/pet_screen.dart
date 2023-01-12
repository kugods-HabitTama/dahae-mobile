import 'package:dahae_mobile/screens/pet/pet_component.dart';
import 'package:flutter/material.dart';

import 'pet_header.dart';

class PetScreen extends StatefulWidget {
  const PetScreen({super.key});

  @override
  State<PetScreen> createState() => _PetScreenState();
}

class _PetScreenState extends State<PetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          PetHeader(),
          Expanded(
              child: Center(
            child:
                Image.asset('assets/images/sorry.png', width: 200, height: 400),
          )),
          PetBanner(),
        ],
      ),
    );
  }
}
