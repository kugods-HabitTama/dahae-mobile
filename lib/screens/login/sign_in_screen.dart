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
  String password = '';
  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();

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

    SingleChildScrollView screenBody = SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom == 0
                  ? MediaQuery.of(context).size.height * 0.17
                  : MediaQuery.of(context).size.height * 0.1),
          const Image(
              image: AssetImage('assets/images/logo_3d.png'), height: 130),
          const SizedBox(height: 25),
          LoginPageText(),
          SizedBox(height: 30, child: _isWrong ? wrongAccountMsg : Container()),
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
          const SizedBox(height: 10),
          SignUpInputTextBox(
            label: '비밀번호',
            password: true,
            nopad: true,
            focusNode: _passwordFocus,
            onSaved: (val) {
              setState(() {
                password = val;
              });
            },
            onChanged: (val) {},
            validator: (val) => CheckValidate().validateEmpty(_emailFocus, val),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => GoRouter.of(context).go('/habit'),
                child: Text(
                  '비밀번호가 생각나지 않아요',
                  style: TextStyle(fontSize: 9),
                ),
              ),
              SizedBox(height: 30, width: 30),
            ],
          ),
          const SizedBox(height: 50)
        ],
      ),
    );

    SignUpBottomButton bottomButton = SignUpBottomButton(
      text: '로그인',
      onPressed: () async {
        if (formKey.currentState?.validate() == true) {
          formKey.currentState?.save();
          // DB로 보내서 맞는지 확인
          if (true) {
            GoRouter.of(context).go('/habit');
          } else {
            _isWrong = true;
          }
        }
      },
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
          body: screenBody,
          // sign in button
          bottomSheet: bottomButton),
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
