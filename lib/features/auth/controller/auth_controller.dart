import 'package:flutter/material.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/services/api_services.dart';
import 'package:kalicart/common/services/db_service.dart';
import 'package:kalicart/common/utils/keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ChangeNotifier {
 

  //shared prefernce
  SharedPreferences? sharedPreferences;

  //login form key
  GlobalKey<FormState> ? loginFormkey;
  GlobalKey<FormState> ? registrationFormKey;
 
  final ApiService _apiService = ApiService();

  bool loading = false;
  String? email;
  String? password;
  String? name;
  String? phone;

  String emailErrorText = '';
  String passwordError = '';
  String confirmPasswordError = '';
  String phoneError = '';

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

      password = value;
    }

    notifyListeners();
  }

  //validate phone
  void validatePhone(String value) {
    if (value.isEmpty) {
      phoneError = 'Please enter phone number';
    } else if (value.length > 10) {
      phoneError = 'Phone number must be  10 numbers';
    } else {
      phoneError = '';
    }

    notifyListeners();
  }

  //match password
  void ismatchPassword(String value) {
    if (value.isEmpty) {
      confirmPasswordError = 'Please enter password again';
    } else if (value != password) {
      confirmPasswordError = 'Password not match';
    } else {
      confirmPasswordError = '';
    }

    notifyListeners();
  }

  //login
  void login(BuildContext context) async {
    loginFormkey?.currentState!.save();
    validateEmail(email!);
    validatePassword(password!);

    print(email!);
    print(password!);

    if (emailErrorText.isEmpty && passwordError.isEmpty) {
      try {
        loading = true;
        notifyListeners();

        Map<String, dynamic> data =
            await _apiService.login(email: email, password: password);

        await Db.init();
        Db.setAuth(loginId: data["loginId"], token: data["token"], auth: true);
        if(context.mounted){

          Navigator.pushReplacementNamed(context, RouteName.rootScreen);
        }



        loading = false;
        notifyListeners();
      } catch (e) {
        loading = false;
        notifyListeners();
      }
    }
  }

  //sigin up
  void signUp(BuildContext context) async {
    registrationFormKey?.currentState!.save();

    validateEmail(email!);
    validatePassword(password!);
    ismatchPassword(password!);
    validatePhone(phone!);

    if (emailErrorText.isEmpty &&
        passwordError.isEmpty &&
        confirmPasswordError.isEmpty &&
        phoneError.isEmpty) {
      try {
        loading = true;
        notifyListeners();

        await _apiService.signUp(
            name: name, email: email, confirmPassword: password, phone: phone);

        if (context.mounted) {
          Navigator.pop(context);
        }

        loading = false;
        notifyListeners();
      } catch (e) {
        loading = false;
        notifyListeners();
        if (context.mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }
    }
  }
}
