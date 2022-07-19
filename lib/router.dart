import 'package:flutter/material.dart';

import 'auth/screens/login_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginPage.routeName:
      return MaterialPageRoute(
        builder: (context) {
          return const LoginPage();
        },
      );
    default:
      return MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            body: ErrorWidget('This page does\'nt exist'),
          );
        },
      );
  }
}
