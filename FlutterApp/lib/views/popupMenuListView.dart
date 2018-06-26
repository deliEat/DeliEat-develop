//import 'package:DeliEat/main.dart';
//import 'package:DeliEat/services/account.dart';
//import 'package:flutter/material.dart';
//
//const logOutMenuOptionTitle = 'Log Out';
//
//class MenuChoice {
//  const MenuChoice({this.title, this.icon});
//
//  final String title;
//  final IconData icon;
//}
//
//const List<MenuChoice> popupMenuOptions = const <MenuChoice>[
//  const MenuChoice(title: logOutMenuOptionTitle, icon: Icons.exit_to_app),
//];
//
//class PopupMenu extends StatefulWidget {
//  PopupMenu({Key key}) : super(key: key);
//
//  @override
//  _PopupMenuState createState() => new _PopupMenuState();
//}
//
//class _PopupMenuState extends State<PopupMenu> {
//  MenuChoice _choice;
//
//  @override
//  Widget build(BuildContext context) {
//    return new PopupMenuButton<MenuChoice>(
//      onSelected: _select,
//      itemBuilder: (BuildContext context) {
//        return popupMenuOptions
//            .map((choice) => new PopupMenuItem<MenuChoice>(
//                  value: choice,
//                  child: new Text(choice.title),
//                ))
//            .toList();
//      },
//      icon: new Icon(Icons.account_circle),
//    );
//  }
//
//  void _select(MenuChoice choice) {
//    switch (choice.title) {
//      case logOutMenuOptionTitle:
//        endUserSession();
//        // Hard restart entire app for now
//        main();
//    }
//    setState(() {
//      _choice = choice;
//    });
//  }
//}
