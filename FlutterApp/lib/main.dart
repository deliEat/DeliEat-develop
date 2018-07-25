import 'package:DeliEat/screens/login.dart';
import 'package:DeliEat/services/map.dart';
import 'package:DeliEat/support/log.dart';
import 'package:DeliEat/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  initializeGoogleMaps();
  runApp(DeliEatApp());
}

class DeliEatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    configureLogger();
    return MaterialApp(
      title: 'DeliEat',
      theme: buildDeliEatTheme(),
      home: new LoginPage(),
    );
  }
}
