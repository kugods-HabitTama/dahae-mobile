import 'package:dahae_mobile/app.dart';
import 'package:dahae_mobile/screens/habit/habit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:dahae_mobile/screens/login/login_component.dart';
import 'package:dahae_mobile/screens/route_animation.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isDup = false;
  final formKey = GlobalKey<FormState>();
  //final emailController = TextEditingController();
  String email = '';

  @override
  Widget build(BuildContext context) {
    //WARNING MESSAGE
    Center duplicateEmail = const Center(
      child: Text('중복된 이메일입니다.',
          style: TextStyle(
              color: Color(0xFFFA0000),
              fontSize: 12,
              fontWeight: FontWeight.w500)),
    );

    AppBar signUpBar = AppBar(
        elevation: 0,
        leading: IconButton(
            focusColor: Colors.white,
            splashColor: Colors.white,
            highlightColor: Colors.white,
            disabledColor: Colors.white,
            icon:
                Icon(Icons.arrow_back_ios, color: Theme.of(context).hintColor),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.white);

    return Form(
      key: formKey,
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          appBar: signUpBar,
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 70),
                const Image(
                    image: AssetImage('assets/images/logo_3d.png'),
                    height: 130),
                const SizedBox(height: 25),
                SignUpText(text: _isDup ? '이메일을 다시' : '이메일을'),
                SizedBox(
                    height: 30, child: _isDup ? duplicateEmail : Container()),
                SignUpInputTextBox(
                  label: '이메일',
                  onSaved: (val) {},
                  validator: (val) {
                    if (val.length < 1) {
                      return '이메일을 입력하세요.';
                    }

                    if (!RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                        .hasMatch(val)) {
                      return '잘못된 이메일 형식입니다.';
                    }

                    //중복확인하는 method 넣기

                    return null;
                  },
                ),
              ],
            ),
          ),
          bottomSheet: SignUpBottomButton(
            text: '인증하기',
            onPressed: () async {
              if (formKey.currentState?.validate() == true) {
                formKey.currentState?.save();
                PageRouteWithAnimation pageRouteWithAnimation =
                    PageRouteWithAnimation(DahaeApp());
                Navigator.push(
                    context, pageRouteWithAnimation.slideRitghtToLeft());
              } else {
                _isDup = true;
              }
            },
          )),
    );
  }
}

class SignUpScreen2 extends StatefulWidget {
  const SignUpScreen2({
    super.key,
    required this.email,
  });

  final String email;

  @override
  State<SignUpScreen2> createState() => _SignUpScreen2State();
}

class _SignUpScreen2State extends State<SignUpScreen2> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
