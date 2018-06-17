import 'dart:async';
import 'dart:convert';

import 'package:DeliEat/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const loginUrl = 'http://10.0.2.2:3000/login';

const userFullName = 'userFullName';
const userId = 'userId';

Future<User> login(String username, String password) async {
  final response = await http.post(loginUrl, body: {
    'username': username,
    'password': password,
  });
  return new User.fromJson(json.decode(response.body));
}

void startUserSession(User user) {
  Future<SharedPreferences> _sharedPref = SharedPreferences.getInstance();
  _sharedPref.then((sf) {
    sf.setString(userFullName, user.name);
    sf.setInt(userId, user.userId);
  });
}
