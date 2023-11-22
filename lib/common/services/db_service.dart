import 'package:shared_preferences/shared_preferences.dart';

class Db{

  static bool  isLoggedIn = false;

static SharedPreferences? _instance;
  static SharedPreferences get instance => _instance!;

  static Future<SharedPreferences> init() async {
    _instance ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  static setAuth({required String loginId,required String token,required bool auth}){

    _instance?.setBool('auth', auth);
    _instance?.setString('loginId',loginId);
    _instance?.setString('token', token);




  }

  static  auth(){
    return _instance?.getBool('auth');
  }
  static getLoginId(){
    return _instance?.getString('loginId');
  }
  static getToken(){
    return _instance?.getString('token');
  }

  
  
}