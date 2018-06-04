import 'dart:async';
import 'dart:convert';

import 'package:DeliEat/models/user.dart';
import 'package:http/http.dart' as http;

const LOGIN_URL = 'http://10.0.2.2:3000/login';

Future<User> login(String username, String password) async {
  final response = await http.post(
    LOGIN_URL,
    body: {
      'username': username,
      'password': password,
    }
  );
  return new User.fromJson(json.decode(response.body));
}
