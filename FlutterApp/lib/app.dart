import 'package:flutter/material.dart';
import 'theme/colors.dart';

import 'package:DeliEat/screens/login.dart';

ThemeData _buildDeliEatTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: deliEatSecondaryRed,
    primaryColor: deliEatPrimaryRed,
    buttonColor: deliEatPrimaryRed,
    scaffoldBackgroundColor: deliEatBackgroundWhite,
    cardColor: deliEatBackgroundWhite,
    inputDecorationTheme: InputDecorationTheme(
      border: new OutlineInputBorder(
        borderRadius: const BorderRadius.all(const Radius.circular(15.0)),
      ),
    ),
    textTheme: _buildDeliEatTextTheme(
      base.textTheme
    ),
    //TODO: Add the icon themes (103)
    //TODO: Decorate the inputs (103)
  );
}

TextTheme _buildDeliEatTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(
      fontSize: 18.0
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
  ).apply(
    fontFamily: 'OpenSans',
    displayColor: deliEatBlack,
    bodyColor: deliEatBlack,
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