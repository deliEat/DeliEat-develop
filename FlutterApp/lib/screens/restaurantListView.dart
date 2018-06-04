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
      body: new SafeArea(
        child: new Column(
          children: <Widget>[
            new _RestaurantMenuBar(),
            const SizedBox(height: 70.0),
            const SizedBox(height: 70.0),
          ],
        ),
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
    return new Column(
      children: <Widget> [
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: new Icon(
              const IconData(0xe8b6, fontFamily: 'MaterialIcons')),
          ),
        )
      ]
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
    return null;
  }
}