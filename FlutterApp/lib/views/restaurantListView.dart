import 'package:DeliEat/models/restaurant.dart';
import 'package:DeliEat/services/restaurants.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class RestaurantListView extends StatefulWidget {
  @override
  _RestaurantListViewState createState() => new _RestaurantListViewState();
}

class _RestaurantListViewState extends State<RestaurantListView> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("List of Restaurants"),
      ),
      body: new Column(
        children: <Widget>[
          new _RestaurantMenuBar(),
          new _RestaurantListItems(),
        ],
      ),
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
  @override
  _RestaurantListItemsState createState() => new _RestaurantListItemsState();
}

class _RestaurantListItemsState extends State<_RestaurantListItems> {
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: getRestaurants(),
      builder: (BuildContext context, AsyncSnapshot<List> restaurants) {
        if (!restaurants.hasData) {
          return new Center(
            child: new CircularProgressIndicator(),
          );
        }
        List retrievedData = restaurants.data;
        List<Widget> displayRestaurants = new List();
        for (final restaurant in retrievedData) {
          displayRestaurants.add(_buildRow(restaurant));
        }
        return new Expanded(
          child: ListView(
            children: displayRestaurants,
          )
        );
      },
    );
  }

  Widget _buildRow(Restaurant restaurant) {
    return new ListTile(
      leading: const Icon(Icons.event_seat),
      title: Text(restaurant.name),
    );
  }
}