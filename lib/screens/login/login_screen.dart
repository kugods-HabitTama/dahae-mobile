import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:dahae_mobile/common/util/route_animation.dart';
import 'package:dahae_mobile/screens/login/login_component.dart';
import 'package:dahae_mobile/screens/login/sign_in_screen.dart';
import 'package:dahae_mobile/screens/login/sign_up/sign_up_email.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                  PageRouteWithAnimation pageRouteWithAnimation =
                      PageRouteWithAnimation(SignUpScreen());
                  Navigator.push(
                      context, pageRouteWithAnimation.slideRitghtToLeft());
                },
              ),
              const SizedBox(height: 20),
              DahaeStartButton(
                child: Text('다 해 본 적 있어요'),
                onPressed: () {
                  PageRouteWithAnimation pageRouteWithAnimation =
                      PageRouteWithAnimation(SignInScreen());
                  Navigator.push(
                      context, pageRouteWithAnimation.slideRitghtToLeft());
                  //MaterialPageRoute(
                  //builder: (_) => SignInScreen(),),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
