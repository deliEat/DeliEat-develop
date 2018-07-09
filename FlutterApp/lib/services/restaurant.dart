import 'dart:async';
import 'dart:convert';

import 'package:DeliEat/models/restaurant.dart';
import 'package:DeliEat/support/log.dart';
import 'package:http/http.dart' as http;

const allRestaurantUrl = 'http://10.0.2.2:3000/restaurants/all';
const ownerRestaurantUrl = 'http://10.0.2.2:3000/restaurants/owner/';
const createOwnerRestaurantUrl = 'http://10.0.2.2:3000/restaurants/owner';

Future<List<Restaurant>> getRestaurants() async {
  final response = await http.get(
    allRestaurantUrl,
  );

  List<dynamic> restaurantsJSON = json.decode(response.body);

  List<Restaurant> restaurants = new List();
  restaurantsJSON.forEach((restaurant) {
    restaurants.add(new Restaurant.fromJson(restaurant));
  });

  return restaurants;
}

Future<List<Restaurant>> getOwnerRestaurants(int ownerId) async {
  final response = await http.get(
    ownerRestaurantUrl + ownerId.toString(),
  );

  List<dynamic> restaurantsJSON = json.decode(response.body);

  List<Restaurant> restaurants = new List();
  restaurantsJSON.forEach((restaurant) {
    restaurants.add(new Restaurant.fromJson(restaurant));
  });

  return restaurants;
}

Future<Restaurant> createRestaurant(Restaurant r) async {
  final response = await http.post(
    //TODO: fix missing param on ruby side!
    createOwnerRestaurantUrl, body: json.encode(r),
  ).catchError((e, stackTrace) {
    accountServiceLogger.severe('Cannot add restaurant');
  });

  return new Restaurant.fromJson(json.decode(response.body));
}


