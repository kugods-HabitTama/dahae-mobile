import 'package:dahae_mobile/app.dart';
import 'package:dahae_mobile/screens/habit/habit_screen.dart';
import 'package:dahae_mobile/screens/login/sign_up/sign_up_certification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

import '../../../api/api.dart';
import 'package:dahae_mobile/screens/login/login_component.dart';
import 'package:dahae_mobile/common/util/route_animation.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isDup = false;
  final formKey = GlobalKey<FormState>();
  //final emailController = TextEditingController();
  String email = '';
  String authCode = '';
  FocusNode _emailFocus = new FocusNode();
  FocusNode _passwordFocus = new FocusNode();

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

    SingleChildScrollView screenBody = SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.17),
          const Image(
              image: AssetImage('assets/images/logo_3d.png'), height: 130),
          const SizedBox(height: 25),
          SignUpText(text: _isDup ? '이메일을 다시' : '이메일을'),
          SizedBox(height: 30, child: _isDup ? duplicateEmail : Container()),
          SignUpInputTextBox(
            label: '이메일',
            focusNode: _emailFocus,
            onSaved: (val) {
              setState(() {
                email = val;
              });
            },
            onChanged: (val) {},
            validator: (val) => CheckValidate().validateEmail(_emailFocus, val),
          ),
        ],
      ),
    );

    SignUpBottomButton bottomButton = SignUpBottomButton(
      text: '인증번호 받기',
      onPressed: () async {
        if (formKey.currentState?.validate() == true) {
          formKey.currentState?.save();
          //중복확인하는 method 넣기
          if (await isEmailDuplicate(email)) {
            setState(() {
              _isDup = true;
            });
          } else {
            _isDup = false;
            authCode = await getEmailAuthCode(email);
            PageRouteWithAnimation pageRouteWithAnimation =
                PageRouteWithAnimation(
                    SignUpCertScreen(email: email, authCode: authCode));
            Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
          }
        }
      },
    );

    return Form(
      key: formKey,
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: SignUpAppBar()),
          extendBodyBehindAppBar: true,
          body: screenBody,
          bottomSheet: bottomButton),
    );
  }
}
