import 'dart:convert';

import 'package:dahae_mobile/app.dart';
import 'package:dahae_mobile/screens/habit/habit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../api/api.dart';
import 'package:dahae_mobile/screens/login/login_component.dart';
import 'package:dahae_mobile/common/util/route_animation.dart';

class SignUpNameScreen extends StatefulWidget {
  const SignUpNameScreen({
    super.key,
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  State<SignUpNameScreen> createState() => _SignUpNameScreenState();
}

class _SignUpNameScreenState extends State<SignUpNameScreen> {
  bool _isDup = false;
  final formKey = GlobalKey<FormState>();
  //final emailController = TextEditingController();
  FocusNode _nameFocus = FocusNode();
  String name = '';
  String os = '';
  var json;

  @override
  Widget build(BuildContext context) {
    //WARNING MESSAGE
    Center duplicateName = const Center(
      child: Text('중복된 닉네임입니다.',
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          const Image(
              image: AssetImage('assets/images/logo_3d.png'), height: 130),
          const SizedBox(height: 25),
          const SignUpText(text: '닉네임을'),
          SizedBox(height: 30, child: _isDup ? duplicateName : Container()),
          SignUpInputTextBox(
            label: '닉네임',
            focusNode: FocusNode(),
            onSaved: (val) {
              setState(() {
                name = val;
              });
            },
            onChanged: (val) {},
            validator: (val) => CheckValidate().validateName(_nameFocus, val),
          ),
        ],
      ),
    );

    SignUpBottomButton bottomButton = SignUpBottomButton(
      text: '이걸로 하기',
      onPressed: () async {
        if (formKey.currentState?.validate() == true) {
          formKey.currentState?.save();
          // 서버에 중복 확인 보냄
          if (await isNameDuplicate(name)) {
            setState(() {
              _isDup = true;
            });
          } else {
            _isDup = false;
            os = Theme.of(context).platform == TargetPlatform.android
                ? 'ANDROID'
                : 'IOS';
            // json = {
            //   "email": widget.email,
            //   "password": widget.password,
            //   "name": name,
            //   "os": os
            // };
            // server에 put 함
            if (await userRegister(widget.email, widget.password, name, os) ==
                200) {
              print('성공');
              //GoRouter.of(context).go('/habit');
            } else {
              //로딩중
              //print(json);
            }
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
