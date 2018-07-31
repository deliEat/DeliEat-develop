import 'package:DeliEat/reducers/app_reducer.dart';
import 'package:DeliEat/pages/login.dart';
import 'package:DeliEat/services/map.dart';
import 'package:DeliEat/states/app_state.dart';
import 'package:DeliEat/support/log.dart';
import 'package:DeliEat/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  initializeGoogleMaps();
  runApp(DeliEatApp());
}

class DeliEatApp extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState(),
  );

  @override
  Widget build(BuildContext context) {
    configureLogger();
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'DeliEat',
        theme: buildDeliEatTheme(),
        home: LoginPage(),
      ),
    );
  }
}
