import 'package:flutter/material.dart';
import 'package:kalicart/features/onboarding/view/on_boarding_screen.dart';

class AppRoute {
  Route onGenaratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
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
