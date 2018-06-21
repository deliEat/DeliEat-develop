import 'package:flutter/material.dart';
import '../theme/colors.dart';

class MenuCategoryView extends StatefulWidget {
  @override
  _MenuCategoryViewState createState() => new _MenuCategoryViewState();
}

class _MenuCategoryViewState extends State<MenuCategoryView> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: new Text(
              "Entrée:",
              style: new TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          new _MenuRowView(name: "Burger", price: 3.45, time: 10),
          new _MenuRowView(name: "Burger", price: 3.45, time: 10),
        ],
      ),
      decoration: new BoxDecoration(
        border: new Border.all(color: deliEatGrey),
        color: deliEatBackgroundWhite,
        boxShadow: [
          new BoxShadow(
            color: deliEatGrey,
            blurRadius: 3.0,
          ),
        ],
      ),
    );
  }
}

class _MenuRowView extends StatefulWidget {
  String name;
  double price;
  int time;

  _MenuRowView({this.name, this.price, this.time});

  @override
  _MenuRowViewState createState() => new _MenuRowViewState();
}

class _MenuRowViewState extends State<_MenuRowView> {
  int _itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 2.5),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Expanded(
            child: new Text(
              widget.name + " (" + "Est: " + widget.time.toString() + " min)",
            ),
          ),
          _itemCount != 0
              ? new SizedBox(
                  width: 50.0,
                  height: 25.0,
                  child: new IconButton(
                      icon: new Icon(Icons.remove),
                      padding: const EdgeInsetsDirectional.only(
                          start: 5.0, end: 5.0),
                      onPressed: () {
                        setState(() {
                          _itemCount--;
                        });
                      }),
                )
              : new Container(),
          _itemCount != 0
              ? new Container(
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: new Text(
                    _itemCount.toString(),
                  ),
                )
              : new Container(),
          new SizedBox(
            width: 70.0,
            height: 25.0,
            child: new RaisedButton(
                child: new Text(
                  "\$" + widget.price.toStringAsFixed(2),
                ),
                elevation: 3.0,
                textColor: deliEatBackgroundWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                padding: const EdgeInsetsDirectional.only(start: 5.0, end: 5.0),
                onPressed: () {
                  setState(() {
                    _itemCount++;
                  });
                }),
          ),
        ],
      ),
    );
  }
}
