import 'package:DeliEat/models/restaurant.dart';
import 'package:DeliEat/support/log.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';

List<Widget> rowDisplayed = new List();

//TODO: get data from all menu item and send them as package to create menu!
class OwnerMenuCreationPage extends StatefulWidget {
  Restaurant restaurant;

  OwnerMenuCreationPage({this.restaurant});

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
          new _MenuCategories(),
        ],
      ),
      bottomNavigationBar: new _MenuCreationBottomBarSection(),
    );
  }
}

class _MenuItem extends StatefulWidget {
  ValueChanged<_MenuItem> deleteMenuItem;

  _MenuItem({this.deleteMenuItem});
  
  @override
  __MenuItemState createState() => new __MenuItemState();
}

class __MenuItemState extends State<_MenuItem> {
  @override
  Widget build(BuildContext context) {
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
                widget.deleteMenuItem(widget);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuCategory extends StatefulWidget {
  @override
  __MenuCategoryState createState() => new __MenuCategoryState();
}

class __MenuCategoryState extends State<_MenuCategory> {
  List<_MenuItem> menuItems = [];
  TextEditingController menuCategoryType = new TextEditingController();
  
  void deleteMenuItem(_MenuItem menuItem) {
    setState(() {
      menuItems.remove(menuItem);
    });
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
            menuItems.add(new _MenuItem(deleteMenuItem: deleteMenuItem));
          });
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          new TextFormField(
            controller: menuCategoryType,
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
            children: menuItems,
          ),
          createMenuItemAddButton(),
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

class _MenuCategories extends StatefulWidget {
  @override
  _MenuCategoriesState createState() => new _MenuCategoriesState();
}

class _MenuCategoriesState extends State<_MenuCategories> {
  Widget createMenuButton() {
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: RaisedButton(
        child: Text("Add Menu"),
        elevation: 3.0,
        textColor: deliEatBackgroundWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        onPressed: () {
          setState(() {
            rowDisplayed.add(_MenuCategory());
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Column(
            children: rowDisplayed,
          ),
          createMenuButton(),
        ],
      ),
    );
  }
}

class _MenuCreationBottomBarSection extends StatefulWidget {
  @override
  _MenuCreationBottomBarSectionState createState() =>
      new _MenuCreationBottomBarSectionState();
}

class _MenuCreationBottomBarSectionState
    extends State<_MenuCreationBottomBarSection> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new RaisedButton(
              child: Text("Create Restaurant Menus"),
              elevation: 3.0,
              textColor: deliEatBackgroundWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              onPressed: () {
                for (Widget row in rowDisplayed) {
                  
                }
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
