import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:dahae_mobile/screens/login/login_component.dart';
import 'package:dahae_mobile/screens/login/sign_in_screen.dart';
import 'package:dahae_mobile/screens/login/sign_up_screen.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
                image: AssetImage('assets/images/logo_3d.png'), height: 150),
            const SizedBox(height: 25),
            const LoginPageText(),
            const SizedBox(height: 70),
            DahaeStartButton(
              child: Text('처음 다 해 봐요!'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SignUpScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            DahaeStartButton(
              child: Text('다 해 본 적 있어요'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SignInScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
