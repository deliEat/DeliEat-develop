import 'package:DeliEat/models/user.dart';
import 'package:meta/meta.dart';

@immutable
class UserState {
  final User user;

  UserState({
    this.user = null,
  });
}
