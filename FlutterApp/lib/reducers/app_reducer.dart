import 'package:DeliEat/reducers/user_reducer.dart';
import 'package:DeliEat/states/app_state.dart';

AppState appReducer(AppState state, action) => AppState(
  userState: userReducer(state.userState, action),
);
