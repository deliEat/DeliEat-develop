import 'dart:async';

import 'package:DeliEat/actions/user_actions.dart';
import 'package:DeliEat/models/user.dart';
import 'package:DeliEat/pages/customerHome.dart';
import 'package:DeliEat/pages/ownerHome.dart';
import 'package:DeliEat/pages/register.dart';
import 'package:DeliEat/states/app_state.dart';
import 'package:DeliEat/states/user_state.dart';
import 'package:DeliEat/views/loginView.dart';
import 'package:DeliEat/support/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../services/account.dart';
import '../theme/colors.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserState>(
      onInit: (Store<AppState> store) => store.dispatch(RestoreUserSessionAction()),
      converter: (Store<AppState> store) => store.state.userState,
      builder: (BuildContext context, UserState userState) {
        if (userState.isLoggingIn) {
          return CircularProgressIndicator();
        } else if (userState.user == null) {
          return LoginView();
        } else {
          return userState.user.type == customer ? CustomerHomePage() : OwnerHomePage(ownerId: userState.user.id);
        }
      }
    );
//    return FutureBuilder(
//      future: _sessionUser,
//      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
//        switch (snapshot.connectionState) {
//          case ConnectionState.waiting:
//            return const CircularProgressIndicator();
//          default:
//            if (snapshot.hasError || !snapshot.hasData || snapshot.data == null)
//              return _loginView();
//            else {
//              loginScreenLogger.info(
//                  'User session is restored for user ${snapshot.data.name}');
//              if (snapshot.data.type == customer) {
//                return CustomerHomePage();
//              } else {
//                return OwnerHomePage(ownerId: snapshot.data.id);
//              }
//            }
//        }
//      },
//    );
  }
}

