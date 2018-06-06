import 'package:DeliEat/screens/login.dart';
import 'package:DeliEat/theme/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(DeliEatApp());

class DeliEatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliEat',
      theme: buildDeliEatTheme(),
      home: new LoginPage(),
    );
  }
}
