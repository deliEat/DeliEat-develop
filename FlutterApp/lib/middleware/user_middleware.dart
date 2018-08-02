import 'package:DeliEat/actions/user_actions.dart';
import 'package:DeliEat/services/account.dart';
import 'package:DeliEat/states/app_state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> userMiddleware() {
  return [
    TypedMiddleware<AppState, RestoreUserSessionAction>(restoreSession),
    TypedMiddleware<AppState, LogoutAction>(clearSession),
  ];
}

void restoreSession(Store<AppState> store, action, NextDispatcher next) {
  getSessionUser().then((user) {
    if (user == null) {
      store.dispatch(RestoreUserSessionFailedAction());
    } else {
      store.dispatch(RestoreUserSessionSucceededAction(user: user));
    }
  }).catchError((e) {
    // TODO: handle error
    store.dispatch(RestoreUserSessionFailedAction());
  });
}

void clearSession(Store<AppState> store, action, NextDispatcher next) {

}
