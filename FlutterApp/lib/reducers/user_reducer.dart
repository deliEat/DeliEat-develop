import 'package:DeliEat/actions/user_actions.dart';
import 'package:DeliEat/states/user_state.dart';
import 'package:redux/redux.dart';

Reducer<UserState> userReducer = combineReducers<UserState>([
  new TypedReducer<UserState, LoginAction>(loginReducer),
  new TypedReducer<UserState, RestoreUserSessionAction>(restoreUserSessionReducer),
  new TypedReducer<UserState, RestoreUserSessionSucceededAction>(restoreUserSessionSucceededReducer),
  new TypedReducer<UserState, RestoreUserSessionFailedAction>(restoreUserSessionFailedReducer),
]);

UserState loginReducer(UserState userState, LoginAction action) => UserState(isLoggingIn: true);
UserState restoreUserSessionReducer(UserState userState, RestoreUserSessionAction action) =>
    UserState(isLoggingIn: true);
UserState restoreUserSessionSucceededReducer(UserState userState, RestoreUserSessionSucceededAction action) =>
    UserState(isLoggingIn: false, user: action.user);
UserState restoreUserSessionFailedReducer(UserState userState, RestoreUserSessionFailedAction action) =>
    UserState(isLoggingIn: false);
