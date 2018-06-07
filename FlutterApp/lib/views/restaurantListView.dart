import 'package:DeliEat/models/restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantListView extends StatefulWidget {
  final List<Restaurant> restaurants;

  RestaurantListView({this.restaurants});

  @override
  _RestaurantListViewState createState() => new _RestaurantListViewState();
}

class _RestaurantListViewState extends State<RestaurantListView> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new _RestaurantMenuBar(),
        new _RestaurantListItems(widget.restaurants),
      ],
    );
  }
}

class _RestaurantMenuBar extends StatefulWidget {
  @override
  _RestaurantMenuBarState createState() => new _RestaurantMenuBarState();
}

class _RestaurantMenuBarState extends State<_RestaurantMenuBar> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: new Icon(
            const IconData(0xe8b6, fontFamily: 'MaterialIcons'),
          ),
        ),
      ),
    );
  }
}

class _RestaurantListItems extends StatefulWidget {
  final List<Restaurant> restaurants;

  _RestaurantListItems(List<Restaurant> restaurants)
      : restaurants = restaurants;

  @override
  _RestaurantListItemsState createState() => new _RestaurantListItemsState();
}

class _RestaurantListItemsState extends State<_RestaurantListItems> {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: ListView(
        children: _buildRestaurantRows(widget.restaurants),
      ),
    );
  }

  List<Widget> _buildRestaurantRows(List<Restaurant> restaurants) {
    List<Widget> restaurantRows = new List();
    restaurants.forEach((restaurant) {
      restaurantRows.add(_buildRestaurantRow(restaurant));
    });
    return restaurantRows;
  }

  Widget _buildRestaurantRow(Restaurant restaurant) {
    return new ListTile(
      leading: const Icon(Icons.event_seat),
      title: Text(restaurant.name),
    );
  }
}
