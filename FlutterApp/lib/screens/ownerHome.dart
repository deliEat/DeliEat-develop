import 'package:DeliEat/models/restaurant.dart';
import 'package:DeliEat/services/restaurant.dart';
import 'package:DeliEat/views/restaurantListView.dart';
import 'package:flutter/material.dart';

class OwnerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
      ),
      body: new Column(
        children: <Widget>[
          new FutureBuilder(
            // TODO: get owner_id from logged in user
            future: getOwnerRestaurants('29'),
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
