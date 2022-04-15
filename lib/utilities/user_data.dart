import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isLogin = false;
int id = 0;
String firstName = '';
String lastName = '';
String mobile = '';
String email = '';
bool status = false;
String createdAt = '';
String token = '';
String language = '';

saveLoggedIn(Map<String, dynamic> data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("loggedIn", true);
  prefs.setInt("id", data['user']['id']);
  prefs.setString("firstName", data['user']['first_name']);
  prefs.setString("lastName", data['user']['last_name']);
  prefs.setString("mobile", data['user']['mobile']);
  prefs.setString("email", data['user']['email']);
  prefs.setBool("status", data['user']['status']);
  prefs.setString("createdAt", data['user']['created_at']);
  prefs.setString("token", data['plainTextToken']);

  isLogin = ((prefs.getBool("loggedIn") == null) ? false : prefs.getBool("loggedIn"))!;
  id = ((prefs.getInt("id") == null) ? 0 : prefs.getInt("id"))!;
  firstName = ((prefs.getString("firstName") == null) ? "" : prefs.getString("firstName"))!;
  lastName = ((prefs.getString("lastName") == null) ? "" : prefs.getString("lastName"))!;
  mobile = ((prefs.getString("mobile") == null) ? '' : prefs.getString("mobile"))!;
  email = ((prefs.getString("email") == null) ? "" : prefs.getString("email"))!;
  status = ((prefs.getBool("status") == null) ? false : prefs.getBool("status"))!;
  createdAt = ((prefs.getString("createdAt") == null) ? '' : prefs.getString("createdAt"))!;
  token = ((prefs.getString("token") == null) ? '' : prefs.getString("token"))!;
  language = ((prefs.getString("language") == null) ? "en" : prefs.getString("language"))!;
}

prepareUserData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isLogin = ((prefs.getBool("loggedIn") == null) ? false : prefs.getBool("loggedIn"))!;
  id = ((prefs.getInt("id") == null) ? 0 : prefs.getInt("id"))!;
  firstName = ((prefs.getString("firstName") == null) ? "" : prefs.getString("firstName"))!;
  lastName = ((prefs.getString("lastName") == null) ? "" : prefs.getString("lastName"))!;
  mobile = ((prefs.getString("mobile") == null) ? '' : prefs.getString("mobile"))!;
  email = ((prefs.getString("email") == null) ? "" : prefs.getString("email"))!;
  status = ((prefs.getBool("status") == null) ? false : prefs.getBool("status"))!;
  createdAt = ((prefs.getString("createdAt") == null) ? '' : prefs.getString("createdAt"))!;
  token = ((prefs.getString("token") == null) ? '' : prefs.getString("token"))!;
  language = ((prefs.getString("language") == null) ? "en" : prefs.getString("language"))!;
}

loggedOut() {
  debugPrint('clearing system preferences values');
  SharedPreferences.getInstance().then((prefs) {
    prefs.setBool("loggedIn", false);
    prefs.remove("id");
    prefs.remove("firstName");
    prefs.remove("lastName");
    prefs.remove("mobile");
    prefs.remove("email");
    prefs.remove("status");
    prefs.remove("createdAt");
    prefs.remove("token");
    prefs.remove("language");
  });
}
