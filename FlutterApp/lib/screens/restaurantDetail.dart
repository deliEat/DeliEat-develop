import 'package:flutter/material.dart';

class RestaurantDetailPage extends StatefulWidget {
  @override
  _RestaurantDetailPageState createState() => new _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("McDonalds"),
      ),
      body: new Column(
        children: <Widget>[
          new _RestaurantBanner(),
        ],
      ),
      bottomNavigationBar: new _bottomBar(),
    );
  }
}

class _RestaurantBanner extends StatefulWidget {
  @override
  _RestaurantBannerState createState() => new _RestaurantBannerState();
}

class _RestaurantBannerState extends State<_RestaurantBanner> {
  @override
  Widget build(BuildContext context) {
    return new DecoratedBox(
      child: new Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 100.0),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 10.0),
                      new Text(
                        "Mcdonalds",
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text("Rating:"),
                      new Text("Estimated Cook Time:")
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage('assets/food.jpg'),
          fit: BoxFit.fill,
          colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
        ),
      ),
    );
  }
}

class _bottomBar extends StatefulWidget {
  @override
  _bottomBarState createState() => new _bottomBarState();
}

class _bottomBarState extends State<_bottomBar> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        children: <Widget>[
          buildIconRow(const IconData(0xe227, fontFamily: 'MaterialIcons'), "10.00"),
          buildIconRow(const IconData(0xe192, fontFamily: 'MaterialIcons'), "45 min"),
          new RaisedButton(
            child: Text("Proceed"),
          ),
        ],
      )
    );
  }

  Row buildIconRow(IconData icon, String label) {
    return new Row(
      children: <Widget>[
        new Icon(
          icon
        ),
        new Text(
          label
        ),
      ],
    );
  }
}
