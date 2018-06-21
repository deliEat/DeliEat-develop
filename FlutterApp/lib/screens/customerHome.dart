import 'package:DeliEat/models/restaurant.dart';
import 'package:DeliEat/services/restaurant.dart';
import 'package:DeliEat/views/restaurantListView.dart';
import 'package:flutter/material.dart';

class CustomerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Nearby Restaurants"),
      ),
      body: new Column(
        children: <Widget>[
          new FutureBuilder(
            future: getRestaurants(),
            builder: (
                BuildContext context,
                AsyncSnapshot<List<Restaurant>> restaurantsResponse,
                ) {
              if (!restaurantsResponse.hasData) {
                return new Center(
                  child: new CircularProgressIndicator(),
                );
              }
              List<Restaurant> restaurants = restaurantsResponse.data;
              return new Expanded(
                child: new RestaurantListView(restaurants: restaurants),
              );
            },
          ),
        ],
      ),
    );
  }
}
