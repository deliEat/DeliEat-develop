import 'dart:async';
import 'dart:convert';

import 'package:DeliEat/models/restaurant.dart';
import 'package:http/http.dart' as http;

const ALL_RESTAURANTS_URL = 'http://10.0.2.2:3000/restaurants/all';
const OWNER_RESTAURANTS_URL = 'http://10.0.2.2:3000/restaurants/owner/';

Future<List<Restaurant>> getRestaurants() async {
  final response = await http.get(
    ALL_RESTAURANTS_URL,
  );

  List<dynamic> restaurantsJSON = json.decode(response.body);

  List<Restaurant> restaurants = new List();
  restaurantsJSON.forEach((restaurant) {
    restaurants.add(new Restaurant.fromJson(restaurant));
  });

  return restaurants;
}

Future<List<Restaurant>> getOwnerRestaurants(String ownerId) async {
  final response = await http.get(
    OWNER_RESTAURANTS_URL + ownerId,
  );

  List<dynamic> restaurantsJSON = json.decode(response.body);

  List<Restaurant> restaurants = new List();
  restaurantsJSON.forEach((restaurant) {
    restaurants.add(new Restaurant.fromJson(restaurant));
  });

  return restaurants;
}
