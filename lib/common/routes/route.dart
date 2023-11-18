import 'package:flutter/material.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/features/auth/view/login_screen.dart';
import 'package:kalicart/features/auth/view/sigin_up_screen.dart';
import 'package:kalicart/features/onboarding/view/on_boarding_screen.dart';

class AppRoute {
  static Route onGenaratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case  RouteName.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen(),);
      case  RouteName.signupScreen:
        return MaterialPageRoute(builder: (context) => const SignUpScreen(),);
      
      
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
