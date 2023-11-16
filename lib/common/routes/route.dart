import 'package:flutter/material.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/features/auth/view/login_screen.dart';
import 'package:kalicart/features/onboarding/view/on_boarding_screen.dart';

class AppRoute {
  static Route onGenaratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case  RouteName.LoginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen(),);
      
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('No Page'),
            ),
          ),
        );
    }
  }
}
