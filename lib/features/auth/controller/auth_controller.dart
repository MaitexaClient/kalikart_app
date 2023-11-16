
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier{


  String validateEmail(String value) {
  final RegExp emailRegExp = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  );

  if (value.isEmpty) {
    return 'Please enter an email address';
  } else if (!emailRegExp.hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return '';
}

}