import 'package:flutter/material.dart';
import '../views/menuCategoryView.dart';
import '../theme/colors.dart';

class RestaurantDetailPage extends StatefulWidget {
  @override
  _RestaurantDetailPageState createState() => new _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("McDonalds"),
      ),
      body: new Column(
        children: <Widget>[
          new _RestaurantBanner(),
          new _MenuSection(),
        ],
      ),
      bottomNavigationBar: new _BottomBar(),
    );
  }
}

class _RestaurantBanner extends StatelessWidget {
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
          colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.2), BlendMode.dstATop),
        ),
        border: new Border(bottom: new BorderSide(color: Theme.of(context).dividerColor)),
      ),
    );
  }
}

class _BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => new _BottomBarState();
}

class _BottomBarState extends State<_BottomBar> {
  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: buildIconRow(
                  const IconData(0xe227, fontFamily: 'MaterialIcons'), "10.00"),
            ),
            new Expanded(
              child: buildIconRow(
                  const IconData(0xe192, fontFamily: 'MaterialIcons'),
                  "45 min"),
            ),
            new Expanded(
              child: new RaisedButton(
                child: Text("Proceed"),
                elevation: 3.0,
                textColor: deliEatBackgroundWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                onPressed: () {
                  //TODO: onpressed Event, lead to next page.
                },
              ),
            ),
          ],
        ),
      decoration: new BoxDecoration(
        border: new Border(top: new BorderSide(color: Theme.of(context).dividerColor)),
      ),
    );
  }

  Row buildIconRow(IconData icon, String label) {
    return new Row(
      children: <Widget>[
        new Icon(icon),
        const SizedBox(width: 3.0),
        new Text(label),
      ],
    );
  }
}

class _MenuSection extends StatefulWidget {
  @override
  _MenuSectionState createState() => new _MenuSectionState();
}

class _MenuSectionState extends State<_MenuSection> {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new ListView(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        children: <Widget>[
          new Text(
            "Menu:",
          ),
          new Divider(),
          new MenuCategoryView(),
        ],
      ),
    );
  }
}
