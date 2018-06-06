import 'dart:async';
import 'dart:convert';

import 'package:DeliEat/models/restaurant.dart';
import 'package:http/http.dart' as http;

const RESTAURANTS_URL = 'http://10.0.2.2:3000/restaurants';

Future<List<Restaurant>> getRestaurants() async {
  final response = await http.get(
    RESTAURANTS_URL,
  );

  List restaurantsJSON = json.decode(response.body);
  List<Restaurant> restaurants = new List();

  for (final restaurant in restaurantsJSON ) {
    restaurants.add(new Restaurant.fromJson(restaurant));
  }

  return restaurants;
}
