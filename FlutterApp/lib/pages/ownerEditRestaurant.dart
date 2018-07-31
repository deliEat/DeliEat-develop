import 'package:DeliEat/models/restaurant.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../pages/ownerMenuCreation.dart';

class RestaurantEditPage extends StatefulWidget {
  Restaurant newRestaurant;

  RestaurantEditPage({
    Key key,
    @required this.newRestaurant
  }) : super(key: key);

  @override
  _RestaurantEditPageState createState() => new _RestaurantEditPageState();
}

class _RestaurantEditPageState extends State<RestaurantEditPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          widget.newRestaurant.name
        ),
      ),
      body: new Container(),
      bottomNavigationBar: new _RestaurantBottomBarSection(r: widget.newRestaurant),
    );
  }
}

class _MenuDisplaySection extends StatefulWidget {
  @override
  __MenuDisplaySectionState createState() => new __MenuDisplaySectionState();
}

class __MenuDisplaySectionState extends State<_MenuDisplaySection> {
  @override
  Widget build(BuildContext context) {
    return new Container();
  }
}


class _RestaurantBottomBarSection extends StatefulWidget {
  Restaurant r;

  //TODO: refactor data passing with InheritedWidget!!!!!!
  _RestaurantBottomBarSection({
    Key key,
    @required this.r
  }) : super(key: key);

  @override
  _RestaurantBottomBarSectionState createState() => new _RestaurantBottomBarSectionState();
}

class _RestaurantBottomBarSectionState extends State<_RestaurantBottomBarSection> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new RaisedButton(
              child: Text("Create Menu"),
              elevation: 3.0,
              textColor: deliEatBackgroundWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new OwnerMenuCreationPage(
                      restaurant: widget.r,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      decoration: new BoxDecoration(
        border: new Border(
          top: new BorderSide(color: Theme.of(context).dividerColor)),
        color: deliEatBackgroundWhite,
      ),
    );
  }
}



