import 'package:DeliEat/main.dart';
import 'package:DeliEat/models/restaurant.dart';
import 'package:DeliEat/services/account.dart';
import 'package:DeliEat/services/restaurant.dart';
import 'package:DeliEat/views/restaurantListView.dart';
import 'package:flutter/material.dart';

class OwnerHomePage extends StatelessWidget {
  final int ownerId;

  OwnerHomePage({@required this.ownerId});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.exit_to_app),
            onPressed: () {
              endUserSession();
              main();
            },
          ),
        ],
      ),
      body: new Column(
        children: <Widget>[
          new FutureBuilder(
            future: getOwnerRestaurants(ownerId),
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
