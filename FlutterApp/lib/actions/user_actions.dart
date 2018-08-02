import 'package:DeliEat/models/user.dart';

class LoginAction {
  final String username;
  final String password;

  LoginAction({
    this.username,
    this.password,
  });
}

class LogoutAction {}

class RestoreUserSessionAction {}

class RestoreUserSessionSucceededAction {
  final User user;

  RestoreUserSessionSucceededAction({
    this.user,
  });
}

class RestoreUserSessionFailedAction {}
