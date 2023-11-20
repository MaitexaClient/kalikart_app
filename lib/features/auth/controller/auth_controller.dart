import 'package:flutter/material.dart';
import 'package:kalicart/common/routes/route_name.dart';

class AuthController extends ChangeNotifier {
  final GlobalKey<FormState> loginFormkey = GlobalKey<FormState>();

  bool loading = false;
  String? email;
  String? password;

  String emailErrorText = '';
  String passwordError = '';

  //validate email
  void validateEmail(String value) {
    final RegExp emailRegExp = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    );

    if (value.isEmpty) {
      emailErrorText = 'Please enter email address';
    } else if (!emailRegExp.hasMatch(value)) {
      emailErrorText = 'Please Enter valid email address';
    } else {
      emailErrorText = '';
    }

    notifyListeners();
  }

  //validate password
  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError = 'Please enter a password';
    } else if (value.length < 6) {
      passwordError = 'Password must be at least 6 characters long';
    } else {
      passwordError = '';
    }

    notifyListeners();
  }

  //login
  void login(BuildContext context) async {
    loginFormkey.currentState!.save();
    validateEmail(email!);
    validatePassword(password!);

    if (emailErrorText.isEmpty) {
      loading = true;
      notifyListeners();
      await Future.delayed(const Duration(seconds: 5));

      if (context.mounted) {
        Navigator.pushNamed(context, RouteName.homeScreen);
      }
      loading = false;
      notifyListeners();
    }
  }
}
