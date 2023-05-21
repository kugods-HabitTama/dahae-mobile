import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:dahae_mobile/common/styles/app_theme.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(DahaeApp());
}

class DahaeApp extends StatelessWidget {
  DahaeApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 화면 크기 설정
    ScreenUtil.init(
      context,
      // design size in figma - iphone 14 pro
      designSize: Size(390, 844),
    );

    // App router
    final AppRouter appRouter = AppRouter();

    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: AppTheme.theme,
      builder: (context, child) => ScrollConfiguration(
        behavior: DiableScrollGlow(),
        child: child ?? Container(),
      ),
    );
  }
}
