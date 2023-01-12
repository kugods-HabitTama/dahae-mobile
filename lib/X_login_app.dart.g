import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'app.dart';
import 'screens/login/login_page.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

class LoginApp extends StatefulWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '로그인 앱',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const LoginCheckPage(),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() async {
    super.dispose();
  }
}

class LoginCheckPage extends StatefulWidget {
  const LoginCheckPage({Key? key}) : super(key: key);

  @override
  _LoginCheckPageState createState() => _LoginCheckPageState();
}

class _LoginCheckPageState extends State<LoginCheckPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _permission();
    _logout();
    _auth();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // 제거해도 되는 부분이나, 추후 권한 설정과 관련된 포스팅 예정
  _permission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    logger.i(statuses[Permission.storage]);
  }

  _auth() {
    // 사용자 인증정보 확인. 딜레이를 두어 확인
    Future.delayed(const Duration(milliseconds: 100), () {
      if (FirebaseAuth.instance.currentUser == null) {
        Get.off(() => const LoginPage());
      } else {
        Get.off(() => DahaeApp());
      }
    });
  }

  _logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
