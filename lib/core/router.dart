import 'dart:io' show Platform;
import 'package:cycle_ai/views/screens/mail_login.dart';
import 'package:cycle_ai/views/screens/mainpage.dart';
import 'package:cycle_ai/views/screens/signup_page.dart';
import 'package:cycle_ai/core/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/views/screens/signin_page.dart';

class AppRouter {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case signInRoute:
        return getPageRoute(
          settings: settings,
          view: const SignInPage(),
        );
      case registerRoute:
        return getPageRoute(
          settings: settings,
          view: const SignUpPage(),
        );
      case mailLogin:
        return getPageRoute(
          settings: settings,
          view: const MailLogin(),
        );
      case mainPage:
        return getPageRoute(
          settings: settings,
          view: const MainPage(),
        );
      default:
        return getPageRoute(
          settings: settings,
          view: Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static PageRoute<dynamic> getPageRoute({
    required RouteSettings settings,
    required Widget view,
  }) {
    return Platform.isIOS
        ? CupertinoPageRoute(settings: settings, builder: (_) => view)
        : MaterialPageRoute(settings: settings, builder: (_) => view);
  }
}
