import 'dart:async';
import 'dart:convert';

import 'package:DeliEat/models/user.dart';
import 'package:DeliEat/support/log.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const loginUrl = 'http://10.0.2.2:3000/login';

const customerId = 'customerId';
const email = 'email';
const ownerId = 'ownerId';
const phoneNumber = 'phoneNumber';
const userFullName = 'userFullName';
const userId = 'userId';
const userType = 'userType';

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
    if (user.type == customer) {
      sf.setInt(customerId, user.id);
    } else if (user.type == owner) {
      sf.setInt(ownerId, user.id);
    }
    sf.setString(email, user.email);
    sf.setString(phoneNumber, user.phoneNumber);
    sf.setString(userFullName, user.name);
    sf.setInt(userId, user.userId);
    sf.setString(userType, user.type);
  }).catchError((e, stackTrace) {
    accountServiceLogger.severe('Cannot start session for user ${user.userId}');
  });
}

void endUserSession() {
  Future<SharedPreferences> _sharedPref = SharedPreferences.getInstance();
  _sharedPref.then((sf) {
    sf.remove(customerId);
    sf.remove(ownerId);
    sf.remove(email);
    sf.remove(phoneNumber);
    sf.remove(userFullName);
    sf.remove(userId);
    sf.remove(userType);
  }).catchError((e, stackTrace) {
    accountServiceLogger.severe('Cannot end session for current user');
  });
}

Future<User> getSessionUser() {
  Future<SharedPreferences> sharedPref = SharedPreferences.getInstance();
  return sharedPref.then((sf) {
    int _userId = sf.getInt(userId);
    if (_userId == null) return null;

    String _email = sf.getString(email);
    String _name = sf.getString(userFullName);
    String _phoneNumber = sf.getString(phoneNumber);
    String _type = sf.getString(userType);
    int _id = _type == customer ? sf.getInt(customerId) : sf.getInt(ownerId);

    return new User(
      email: _email,
      name: _name,
      id: _id,
      phoneNumber: _phoneNumber,
      type: _type,
      userId: _userId,
    );
  }).catchError((e, stackTrace) {
    accountServiceLogger.severe('Cannot retrieve session for user');
  });
}
