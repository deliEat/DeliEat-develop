import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../services/account.dart';

class OwnerMenuCreationPage extends StatefulWidget {
  //todo: add more values

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
      body: new ListView(
        children: <Widget>[
          new _CreateMenuSection(),
        ],
      ),
    );
  }
}

class _CreateMenuItemContainer extends StatefulWidget {
  @override
  _CreateMenuItemContainerState createState() =>
      new _CreateMenuItemContainerState();
}

class _CreateMenuItemContainerState extends State<_CreateMenuItemContainer> {
  List<Widget> itemDisplayed = [];

  Widget createMenuItem() {
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Item needs a name';
                }
              },
              decoration: InputDecoration(
                border: new UnderlineInputBorder(),
                labelText: "Item Name",
              ),
            ),
          ),
          new Expanded(
            child: new TextFormField(
              decoration: InputDecoration(
                border: new UnderlineInputBorder(),
                labelText: "Est Time (min)",
              ),
            ),
          ),
          new Expanded(
            child: new TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Item needs a price';
                }
              },
              decoration: InputDecoration(
                border: new UnderlineInputBorder(),
                labelText: "Price (\$)",
              ),
            ),
          ),
          new Expanded(
            child: new RaisedButton(
              child: Text("Remove"),
              elevation: 3.0,
              textColor: deliEatBackgroundWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              onPressed: () {
                //TODO, remove this entry, but how?
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget createMenuItemAddButton() {
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: RaisedButton(
        child: Text("Create Menu Item"),
        elevation: 3.0,
        textColor: deliEatBackgroundWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        onPressed: () {
          setState(() {
            itemDisplayed.removeLast();
            itemDisplayed.add(createMenuItem());
            itemDisplayed.add(createMenuItemAddButton());
          });
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    List<Widget> determineItemDisplayed() {
      if (itemDisplayed.length == 0) {
        itemDisplayed.add(createMenuItemAddButton());
      }
      return itemDisplayed;
    }

    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          new TextFormField(
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
          new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: determineItemDisplayed(),
          ),
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

class _CreateMenuSection extends StatefulWidget {
  @override
  _CreateMenuSectionState createState() => new _CreateMenuSectionState();
}

class _CreateMenuSectionState extends State<_CreateMenuSection> {
  List<Widget> rowDisplayed = new List();

  Widget createMenuButton() {
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: RaisedButton(
        child: Text("Create Menu"),
        elevation: 3.0,
        textColor: deliEatBackgroundWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        onPressed: () {
          setState(() {
            rowDisplayed.removeLast();
            rowDisplayed.add(_CreateMenuItemContainer());
            rowDisplayed.add(createMenuButton());
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> determineRow() {
      if (rowDisplayed.length == 0) {
        rowDisplayed.add(createMenuButton());
      }
      return rowDisplayed;
    }

    return new Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: determineRow(),
      ),
    );
  }
}
