import 'dart:async';
import 'dart:convert';

import 'package:DeliEat/models/menu.dart';
import 'package:DeliEat/models/menuItem.dart';
import 'package:DeliEat/support/log.dart';
import 'package:http/http.dart' as http;

const menuCreationUrl = 'http://10.0.2.2:3000/menu';
final client = new http.Client();

Future<Menu> createMenu(Menu menu) async {
  final response = await client.post(
    menuCreationUrl, body: json.encode(menu),
    headers: {'Content-type': 'application/json'},
  ).catchError((e, stackTrace) {
    accountServiceLogger.severe('Cannot add restaurant');
  });

  return new Menu.fromJson(json.decode(response.body));
}

Future<List<Menu>> getMenus(String restaurantId) async {
  final response = await client.get(
    menuCreationUrl + restaurantId.toString(),
    headers: {'Content-type': 'application/json'},
  );

  List<dynamic> menuJSON = json.decode(response.body);

  List<Menu> menus = new List();
  menuJSON.forEach((menu) {
    List<dynamic> menuItemsJSON = menu["menu_items"];
    List<MenuItem> menuItems = new List();
    menuItemsJSON.forEach((menuItem) {
      MenuItem newItem = new MenuItem.fromJson(menuItem);
      menuItems.add(newItem);
    });

    Menu m = new Menu(menu["name"], menu["restaurant_id"], menuItems);
    menus.add(m);
  });

  return menus;
}