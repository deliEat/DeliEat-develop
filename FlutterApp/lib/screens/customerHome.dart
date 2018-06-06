import 'package:DeliEat/views/restaurantListView.dart';
import 'package:flutter/material.dart';

class CustomerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Customer Home"),
      ),
      body: new Center(
        child: new Column(children: <Widget>[
          new RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: new Text('Go back to Login!'),
          ),
          new RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new RestaurantListView()));
              },
              child: new Text('Go to Restaurant List View'))
        ]),
      ),
    );
  }
}
