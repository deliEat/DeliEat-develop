import 'package:DeliEat/models/restaurant.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../screens/ownerMenuCreation.dart';

class RestaurantAddSuccessPage extends StatefulWidget {
  Restaurant newRestaurant;

  RestaurantAddSuccessPage({
    Key key,
    @required this.newRestaurant
  }) : super(key: key);

  @override
  _RestaurantAddSuccessPageState createState() => new _RestaurantAddSuccessPageState();
}

class _RestaurantAddSuccessPageState extends State<RestaurantAddSuccessPage> {
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



