import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class LoginPageText extends StatelessWidget {
  const LoginPageText({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Column(
      children: [
        Text.rich(TextSpan(children: [
          TextSpan(text: '하고 싶은 거 ', style: themeData.textTheme.bodyText1),
          TextSpan(
              text: '다 해 ',
              style: themeData.textTheme.bodyText1
                      ?.copyWith(color: themeData.highlightColor) ??
                  themeData.textTheme.bodyText1),
          TextSpan(text: '보자', style: themeData.textTheme.bodyText1)
        ])),
        const SizedBox(height: 10),
        Text('다마고치 해빗 트래커', style: themeData.textTheme.subtitle1),
      ],
    );
  }
}

class SignUpText extends StatelessWidget {
  const SignUpText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text('만나서 반가워요! 몇 가지만 물어볼게요.',
            style: Theme.of(context).textTheme.subtitle1),
        const SizedBox(height: 10),
        Text.rich(
          TextSpan(children: [
            const TextSpan(text: '사용하실 '),
            TextSpan(text: text),
            const TextSpan(text: ' 입력해주세요')
          ]),
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ]),
    );
  }
}

class SignUpInputTextBox extends StatefulWidget {
  SignUpInputTextBox({
    super.key,
    required this.label,
    required this.onSaved,
    required this.validator,
    this.errorText = '',
    this.password = false,
  });
  //assert

  final String label;
  final FormFieldSetter onSaved;
  final FormFieldValidator validator;
  final bool password;
  String errorText;

  @override
  State<SignUpInputTextBox> createState() => _SignUpInputTextBoxState();
}

class _SignUpInputTextBoxState extends State<SignUpInputTextBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Text(widget.errorText),
          TextFormField(
            obscureText: widget.password,
            obscuringCharacter: '*',
            autocorrect: false,
            cursorColor: Colors.black,
            keyboardType: TextInputType.emailAddress,
            //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              isDense: true,
              prefixIcon: Text(
                widget.label,
                style: const TextStyle(
                    color: Color(0xFF925FF0),
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
              ),
              prefixIconConstraints:
                  BoxConstraints(minWidth: 100, minHeight: 0),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 3, color: Theme.of(context).highlightColor)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 3, color: Theme.of(context).highlightColor)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 3, color: Theme.of(context).highlightColor)),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 3, color: Theme.of(context).highlightColor)),
              disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 3, color: Theme.of(context).highlightColor)),
            ),
            style: Theme.of(context).textTheme.bodyText2,
            onChanged: ((val) {
              setState(() {
                widget.errorText = widget.validator(val) ?? '';
              });
            }),
            onSaved: widget.onSaved,
            validator: widget.validator,
          ),
        ],
      ),
    );
  }
}

class SignUpInputTextBox2 extends StatelessWidget {
  const SignUpInputTextBox2({
    super.key,
    required this.textController,
    this.password = false,
    this.checkpassword = false,
  });

  final bool password;
  final bool checkpassword;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: MediaQuery.of(context).size.width - 60,
      child: Row(
        children: [
          Text(checkpassword
              ? '비밀번호 확인'
              : password
                  ? '비밀번호'
                  : '이메일'),
          Expanded(
            child: TextFormField(
                obscureText: password,
                obscuringCharacter: '*',
                controller: textController,
                decoration: InputDecoration(),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    // == null or isEmpty
                    return '비밀번호를 입력해주세요.';
                  }
                  return null;
                }),
          ),
        ],
      ),
    );
  }
}

class SignUpBottomButton extends StatefulWidget {
  const SignUpBottomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback? onPressed;

  @override
  State<SignUpBottomButton> createState() => _SignUpBottomButtonState();
}

class _SignUpBottomButtonState extends State<SignUpBottomButton> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: false,
      child: Ink(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
            color: Theme.of(context).highlightColor,
            borderRadius: const BorderRadius.vertical(
                top: Radius.circular(6), bottom: Radius.circular(6)),
            border: Border.all(
                width: 1,
                color: const Color(0xFF7D7D7D),
                style: BorderStyle.solid)),
        child: InkWell(
          highlightColor: Theme.of(context).primaryColor,
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          onTap: widget.onPressed,
          child: Container(
            //Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            alignment: Alignment.center,
            child: Text(
              widget.text,
              style: const TextStyle(
                  color: Color(0xFFF5EFFF), //Color(0xFF646464),
                  fontWeight: FontWeight.w700,
                  fontSize: 19),
            ),
          ),
        ),
      ),
    );
  }
}

class DahaeStartButton extends StatefulWidget {
  const DahaeStartButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.pressedOpacity = 0.4,
    this.minSize = 40.0,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final double? pressedOpacity;
  bool get enabled => onPressed != null;
  final double? minSize;

  @override
  State<DahaeStartButton> createState() => _DahaeStartButtonState();
}

class _DahaeStartButtonState extends State<DahaeStartButton>
    with SingleTickerProviderStateMixin {
  static const Duration kFadeOutDuration = Duration(milliseconds: 120);
  static const Duration kFadeInDuration = Duration(milliseconds: 180);
  final Tween<double> _opacityTween = Tween<double>(begin: 1.0);

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 0.0,
      vsync: this,
    );
    _opacityAnimation = _animationController
        .drive(CurveTween(curve: Curves.decelerate))
        .drive(_opacityTween);
    _setTween();
  }

  @override
  void didUpdateWidget(DahaeStartButton old) {
    super.didUpdateWidget(old);
    _setTween();
  }

  void _setTween() {
    _opacityTween.end = widget.pressedOpacity ?? 1.0;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool _buttonHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!_buttonHeldDown) {
      _buttonHeldDown = true;
      _animate();
    }
  }

  void _handleTapUp(TapUpDetails event) {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _handleTapCancel() {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _animate() {
    if (_animationController.isAnimating) {
      return;
    }
    final bool wasHeldDown = _buttonHeldDown;
    final TickerFuture ticker = _buttonHeldDown
        ? _animationController.animateTo(1.0,
            duration: kFadeOutDuration, curve: Curves.easeInOutCubicEmphasized)
        : _animationController.animateTo(0.0,
            duration: kFadeInDuration, curve: Curves.easeOutCubic);
    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != _buttonHeldDown) {
        _animate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool enabled = widget.enabled;
    final ThemeData themeData = Theme.of(context);
    final Color primaryColor = themeData.highlightColor;
    final Color? backgroundColor = primaryColor;

    final Color foregroundColor = themeData.backgroundColor;

    final TextStyle textStyle = themeData.textTheme.subtitle2 ??
        TextStyle(
            color: Color(0xFF925FF0),
            fontWeight: FontWeight.w700,
            fontSize: 14);

    return MouseRegion(
      cursor: enabled && kIsWeb ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: enabled ? _handleTapDown : null,
        onTapUp: enabled ? _handleTapUp : null,
        onTapCancel: enabled ? _handleTapCancel : null,
        onTap: widget.onPressed,
        child: Semantics(
          button: true,
          child: Container(
            constraints: widget.minSize == null
                ? const BoxConstraints()
                : BoxConstraints(
                    minWidth: widget.minSize!,
                    minHeight: widget.minSize!,
                  ),
            width: MediaQuery.of(context).size.width - 80,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                        color: primaryColor,
                        style: BorderStyle.solid,
                        width: 1)),
                child: Padding(
                  padding: EdgeInsets.all(1),
                  child: Align(
                    alignment: Alignment.center,
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: DefaultTextStyle(
                      style: textStyle,
                      child: IconTheme(
                        data: IconThemeData(color: foregroundColor),
                        child: widget.child,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
