import 'package:flutter/material.dart';
import 'package:school_app/route/Router.dart';
import 'package:school_app/screen/LoginScreen.dart';
import 'package:school_app/screen/SplashScreen.dart';

import 'common/Constant.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      // ignore: missing_return
      onGenerateRoute: (RouteSettings routeSetting) {
        final args = routeSetting.arguments;

        switch (routeSetting.name) {
          case Constant.LOGIN_SCREEN:
            return Router(
              builder: (_) => LoginScreen(),
              settings: routeSetting,
            );
        }

      },
    );
  }
}

