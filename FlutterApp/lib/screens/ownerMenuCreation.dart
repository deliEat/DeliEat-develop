import 'package:flutter/material.dart';
import '../theme/colors.dart';

class OwnerMenuCreationPage extends StatefulWidget {
  @override
  _OwnerMenuCreationPageState createState() =>
      new _OwnerMenuCreationPageState();
}

class _OwnerMenuCreationPageState extends State<OwnerMenuCreationPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Menu Creation"),
      ),
      body: new _CreateMenuSection(),
    );
  }
}

class _CreateMenuSection extends StatefulWidget {
  @override
  _CreateMenuSectionState createState() => new _CreateMenuSectionState();
}

class _CreateMenuSectionState extends State<_CreateMenuSection> {
  //TODO: fix this broken code....
  List<Widget> rowDisplayed = new List();

  @override
  Widget build(BuildContext context) {
    Widget createMenuContainer() {
      return new Row(
        children: <Widget>[
          new Expanded(
            child: new TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Menu needs a category';
                }
              },
              decoration: InputDecoration(
                border: new UnderlineInputBorder(),
                labelText: "Menu Category",
              ),
            ),
          ),
        ],
      );
    }

    Expanded createMenuButton() {
      return new Expanded(
        child: new RaisedButton(
          child: Text("Create Menu"),
          elevation: 3.0,
          textColor: deliEatBackgroundWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          onPressed: () {
            setState(() {
              rowDisplayed.removeLast();
              rowDisplayed.add(createMenuContainer());
              rowDisplayed.add(createMenuButton());
            });
          },
        ),
      );
    }

    List<Widget> determineWidget() {
      if (rowDisplayed.length == 0) {
        rowDisplayed.add(createMenuButton());
      }
      return rowDisplayed;
    }

    return new Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: new Row(
        children: determineWidget(),
      ),
    );
  }
}
