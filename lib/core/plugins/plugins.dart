import 'package:shared_preferences/shared_preferences.dart';

class Plugins {
  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool("isLoggedIn");
  }

  static Future<bool> logOutUser() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.setString("token", "");
    return sf.setBool("isLoggedIn", false);
  }
}
