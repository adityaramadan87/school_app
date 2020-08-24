import 'package:flutter/material.dart';
import 'package:school_app/route/Router.dart';
import 'package:school_app/screen/CheckReferalCodeScreen.dart';
import 'package:school_app/screen/LoginScreen.dart';
import 'package:school_app/screen/RegisterScreen.dart';
import 'package:school_app/screen/SplashScreen.dart';

import 'common/Constant.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School App',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      // ignore: missing_return
      onGenerateRoute: (RouteSettings routeSetting) {
        final args = routeSetting.arguments;

        switch (routeSetting.name) {
          case Constant.LOGIN_SCREEN:
            return Router(
              builder: (_) => LoginScreen(),
              settings: routeSetting,
            );
          case Constant.REFERAL_CODE_SCREEN:
            return Router(
              builder: (_) => CheckReferalCodeScreen(),
              settings: routeSetting,
            );
          case Constant.REGISTER_SCREEN:
            return Router(
              builder: (_) => RegisterScreen(),
              settings: routeSetting,
            );
        }

      },
    );
  }
}

