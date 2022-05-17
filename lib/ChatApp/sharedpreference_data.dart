import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getLogInData() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getString("number");
}

Future<bool?> getLogInInfo() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getBool("login");
}
