import 'package:DeliEat/states/user_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final UserState userState;

  AppState({
    this.userState,
  });

  AppState.initialState() : userState = new UserState(user: null, isLoggingIn: false) {}
}
