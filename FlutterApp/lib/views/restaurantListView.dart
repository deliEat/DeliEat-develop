import 'package:DeliEat/models/restaurant.dart';
import 'package:DeliEat/screens/restaurantDetail.dart';
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
          border: new UnderlineInputBorder(),
          hintText: 'Look for a restaurant by name',
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
    Widget buildRestaurantInfoRow(String title, String value) {
      return new Row(
        children: <Widget>[
          new Text(title),
          new Text(value),
        ],
      );
    }

    return new Column(
      children: <Widget>[
        new InkWell(
            child: new Row(
              children: <Widget>[
                new Container(
                  margin: new EdgeInsets.all(8.0),
                  child: new Image.asset('assets/hotpot.png',
                      height: 70.0, width: 70.0),
                  decoration: new BoxDecoration(boxShadow: [
                    new BoxShadow(
                      color: Colors.black,
                      blurRadius: 3.0,
                    ),
                  ]),
                ),
                new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        restaurant.name,
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      buildRestaurantInfoRow('Estimated Cook Time: ',
                          restaurant.estimatedCookTime.toString()),
                    ]),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new RestaurantDetailPage(),
                ),
              );
            }),
        new Divider(),
      ],
    );
  }
}
