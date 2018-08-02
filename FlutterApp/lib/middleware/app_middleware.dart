import 'package:DeliEat/middleware/user_middleware.dart';
import 'package:DeliEat/states/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

List<Middleware<AppState>> appMiddleware() {
  List<Middleware<AppState>> appMiddleware = [];
  appMiddleware
    ..add(LoggingMiddleware.printer())
    ..addAll(userMiddleware());
  return appMiddleware;
}
