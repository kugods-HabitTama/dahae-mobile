import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'package:dahae_mobile/screens/login/login_component.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isWrong = false;
  final formKey = GlobalKey<FormState>();
  //final emailController = TextEditingController();
  String email = '';

  @override
  Widget build(BuildContext context) {
    //WARNING MESSAGE
    Center wrongAccountMsg = const Center(
      child: Text('잘 못 입력하셨습니다.',
          style: TextStyle(
              color: Color(0xFFFA0000),
              fontSize: 12,
              fontWeight: FontWeight.w500)),
    );

    return Form(
      key: formKey,
      child: Scaffold(
          //resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: SignUpAppBar()),
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).viewInsets.bottom == 0
                        ? MediaQuery.of(context).size.height * 0.17
                        : MediaQuery.of(context).size.height * 0.1),
                const Image(
                    image: AssetImage('assets/images/logo_3d.png'),
                    height: 130),
                const SizedBox(height: 25),
                LoginPageText(),
                SizedBox(
                    height: 30,
                    child: _isWrong ? wrongAccountMsg : Container()),
                SignUpInputTextBox(
                  label: '이메일',
                  focusNode: FocusNode(),
                  onSaved: (val) {},
                  onChanged: (val) {},
                  validator: (val) {
                    if (val.length < 1) {
                      return '이메일을 입력하세요.';
                    }

                    if (!RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                        .hasMatch(val)) {
                      return '잘못된 이메일 형식입니다.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                SignUpInputTextBox(
                  label: '비밀번호',
                  password: true,
                  focusNode: FocusNode(),
                  onSaved: (val) {},
                  onChanged: (val) {},
                  validator: (val) {
                    if (val.length < 1) {
                      return '비밀번호를 입력하세요.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '비밀번호가 생각나지 않아요',
                      style: TextStyle(fontSize: 9),
                    ),
                    SizedBox(height: 30, width: 30),
                  ],
                ),
                const SizedBox(height: 50)
              ],
            ),
          ),
          // sign in button
          bottomSheet: SignUpBottomButton(
            text: '로그인',
            onPressed: () async {
              if (formKey.currentState?.validate() == true) {
                formKey.currentState?.save();
                GoRouter.of(context).go('/habit');
              } else {
                // DB로 보냈지만 틀렸을 때
                // if(~)
                _isWrong = true;
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
