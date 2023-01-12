import 'package:dahae_mobile/app.dart';
import 'package:dahae_mobile/screens/habit/habit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:dahae_mobile/screens/login/login_component.dart';
import 'package:dahae_mobile/screens/route_animation.dart';
import 'sign_up_password.dart';

class SignUpCertScreen extends StatefulWidget {
  const SignUpCertScreen({
    super.key,
    required this.email,
  });

  final String email;

  @override
  State<SignUpCertScreen> createState() => _SignUpCertScreenState();
}

class _SignUpCertScreenState extends State<SignUpCertScreen> {
  bool _isCert = false;
  final formKey = GlobalKey<FormState>();
  //final emailController = TextEditingController();
  FocusNode _certFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    //WARNING MESSAGE
    Center worngCertification = const Center(
      child: Text('인증번호가 일치하지 않습니다',
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
          const SignUpText(text: '인증코드를'),
          SizedBox(
              height: 30, child: _isCert ? worngCertification : Container()),
          SignUpInputTextBox(
            label: '인증코드',
            focusNode: _certFocus,
            isNum: true,
            onSaved: (val) {},
            onChanged: (val) {},
            validator: (val) =>
                CheckValidate().validateCertCode(_certFocus, val),
          ),
        ],
      ),
    );

    SignUpBottomButton bottomButton = SignUpBottomButton(
      text: '인증하기',
      onPressed: () async {
        // 입력조건 확인
        if (formKey.currentState?.validate() == true) {
          formKey.currentState?.save();
          // 서버와 인증코드가 맞는지 확인
          if (true) {
            _isCert = false;
            PageRouteWithAnimation pageRouteWithAnimation =
                PageRouteWithAnimation(SignUpPWScreen(email: widget.email));
            Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
          } else {
            _isCert = true;
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
