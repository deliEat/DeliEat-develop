import 'dart:async';
import 'package:http/http.dart' as http;

const LOGIN_URL = 'http://10.0.2.2:3000/login';

Future<http.Response> login(String username, String password) async {
  return http.post(
    LOGIN_URL,
    body: {
      'username': username,
      'password': password,
    }
  ).then((response) {
    print(response.statusCode);
    print(response.body);
  });
}
