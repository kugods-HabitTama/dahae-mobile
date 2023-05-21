import 'package:dahae_mobile/app.dart';
import 'package:dahae_mobile/screens/habit/habit_screen.dart';
import 'package:dahae_mobile/screens/login/sign_up/sign_up_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:dahae_mobile/screens/login/login_component.dart';
import 'package:dahae_mobile/common/util/route_animation.dart';

class SignUpPWScreen extends StatefulWidget {
  const SignUpPWScreen({
    super.key,
    required this.email,
  });

  final String email;

  @override
  State<SignUpPWScreen> createState() => _SignUpPWScreenState();
}

class _SignUpPWScreenState extends State<SignUpPWScreen> {
  bool _isDup = false;
  final formKey = GlobalKey<FormState>();
  //final emailController = TextEditingController();
  String password = '';
  String passwordtest = '';
  FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    //WARNING MESSAGE
    Center differentPassword = const Center(
      child: Text('비밀번호가 일치하지 않습니다',
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
          const SignUpText(text: '비밀번호를'),
          SizedBox(height: 30, child: _isDup ? differentPassword : Container()),
          SignUpInputTextBox(
            label: '비밀번호',
            password: true,
            focusNode: FocusNode(),
            onChanged: (val) {},
            onSaved: (val) {
              setState(() {
                password = val;
              });
            },
            validator: (val) =>
                CheckValidate().validatePassword(_passwordFocus, val),
          ),
          const SizedBox(height: 10),
          SignUpInputTextBox(
            label: '비밀번호 확인',
            password: true,
            focusNode: FocusNode(),
            onChanged: (val) {},
            onSaved: (val) {
              setState(() {
                passwordtest = val;
              });
            },
            validator: (val) {
              if (val.length < 1) return '비밀번호 확인을 입력하세요.';
              return null;
            },
          ),
          const SizedBox(height: 70),
        ],
      ),
    );

    SignUpBottomButton bottomButton = SignUpBottomButton(
      text: '이걸로 하기',
      onPressed: () async {
        if (formKey.currentState?.validate() == true) {
          formKey.currentState?.save();
          if (password == passwordtest) {
            PageRouteWithAnimation pageRouteWithAnimation =
                PageRouteWithAnimation(
                    SignUpNameScreen(email: widget.email, password: password));
            Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
          } else {
            _isDup = true;
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
        bottomSheet: bottomButton,
      ),
    );
  }
}
