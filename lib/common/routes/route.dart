import 'package:flutter/material.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/features/Root/view/root_screen.dart';
import 'package:kalicart/features/auth/view/login_screen.dart';
import 'package:kalicart/features/auth/view/otp_verification_screen.dart';
import 'package:kalicart/features/auth/view/sigin_up_screen.dart';
import 'package:kalicart/features/home/view/home_screen.dart';

class AppRoute {
  static Route onGenaratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        
      case RouteName.loginScreen:
        return MaterialPageRoute(
          builder: (context) =>  LoginScreen(),
        );
      case RouteName.signupScreen:
        return MaterialPageRoute(
          builder: (context) =>  SignUpScreen(),
        );
      case RouteName.otpverificationScreen:
        return MaterialPageRoute(
          builder: (context) => const OTPverificationScreen(),
        );
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen(),);

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
