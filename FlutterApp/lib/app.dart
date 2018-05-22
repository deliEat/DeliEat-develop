import 'package:flutter/material.dart';
import 'theme/colors.dart';

import 'login.dart';

final ThemeData _deliEatTheme = _buildDeliEatTheme();

ThemeData _buildDeliEatTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: deliEatSecondaryRed,
    primaryColor: deliEatPrimaryRed,
    buttonColor: deliEatPrimaryRed,
    scaffoldBackgroundColor: deliEatBackgroundWhite,
    cardColor: deliEatBackgroundWhite,
//    textSelectionColor: kShrinePink100,
//    errorColor: kShrineErrorRed,
    inputDecorationTheme: InputDecorationTheme(
      border: new OutlineInputBorder(
        borderRadius: const BorderRadius.all(const Radius.circular(15.0)),
      ),
    ),
    //TODO: Add the text themes (103)
    //TODO: Add the icon themes (103)
    //TODO: Decorate the inputs (103)
  );
}

class DeliEatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliEat',
      theme: _buildDeliEatTheme(),
      home: new LoginPage()
    );
  }
}