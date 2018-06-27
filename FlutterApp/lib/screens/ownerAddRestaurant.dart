import 'package:flutter/material.dart';
import '../screens/ownerMenuCreation.dart';
import '../theme/colors.dart';

final _restaurantFormKey = new GlobalKey<FormState>();

class OwnerAddRestaurantPage extends StatefulWidget {
  @override
  _OwnerAddRestaurantPageState createState() =>
      new _OwnerAddRestaurantPageState();
}

class _OwnerAddRestaurantPageState extends State<OwnerAddRestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Add Restaurant"),
      ),
      body: new Column(
        children: <Widget>[
          new _UploadPictureSection(),
          new _RestaurantInfoSection(),
        ],
      ),
      bottomNavigationBar: new _RestaurantBottomBarSection(),
    );
  }
}

class _UploadPictureSection extends StatefulWidget {
  @override
  _UploadPictureSectionState createState() => new _UploadPictureSectionState();
}

class _UploadPictureSectionState extends State<_UploadPictureSection> {
  @override
  Widget build(BuildContext context) {
    //todo: this is actually challenging since we have to some how upload picture to somewhere
    return new GestureDetector(
      onTap: () {
        //todo: upload image
      },
      child: new Container(
        child: new Stack(
          children: <Widget>[
            new Container(
              height: 150.0,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new AssetImage("assets/food.jpg"),
                  colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.dstATop),
                ),
              ),
            ),
            new Positioned(left: 15.0, top: 50.0, child: new _UploadIcon()),
          ],
        ),
        decoration: new BoxDecoration(
          color: deliEatBackgroundWhite,
          boxShadow: [
            new BoxShadow(
              color: deliEatGrey,
              blurRadius: 5.0,
            ),
          ],
        ),
      ),
    );
  }
}

class _UploadIcon extends StatefulWidget {
  @override
  _UploadIconState createState() => new _UploadIconState();
}

class _UploadIconState extends State<_UploadIcon> {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        //TODO: on tap
      },
      //todo: wrap in FractionalTranslation
      child: new Container(
        child: new Image(
          width: 80.0,
          height: 80.0,
          image: new AssetImage('assets/hotpot.png'),
        ),
      ),
    );
  }
}

class _RestaurantInfoSection extends StatefulWidget {
  @override
  _RestaurantInfoSectionState createState() =>
      new _RestaurantInfoSectionState();
}

class _RestaurantInfoSectionState extends State<_RestaurantInfoSection> {
  //TODO: build each listTile based on a list?

  @override
  Widget build(BuildContext context) {
    return new Form(
      key: _restaurantFormKey,
        child: new Expanded(
      child: ListView(
        children: <Widget>[
          buildInfoItem("Restaurant Name", (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
          }, TextInputType.text),
          buildInfoItem("Contact Name", (value) {}, TextInputType.text),
          buildInfoItem("Phone Number", (value) {}, TextInputType.number),
          buildInfoItem("Some some info", (value) {}, TextInputType.text),
        ],
      ),
    )
    );
  }

  Container buildInfoItem(
    String title, FormFieldValidator validator, TextInputType keyboardType
  ) {
    return new Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 20.0,
      ),
      //todo: probably need onSave() as well.
      child: new TextFormField(
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: new UnderlineInputBorder(),
          labelText: title,
        ),
      ),
    );
  }
}

class _RestaurantBottomBarSection extends StatefulWidget {
  @override
  _RestaurantBottomBarSectionState createState() =>
      new _RestaurantBottomBarSectionState();
}

class _RestaurantBottomBarSectionState
    extends State<_RestaurantBottomBarSection> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new RaisedButton(
              child: Text("Proceed to Menu Creation"),
              elevation: 3.0,
              textColor: deliEatBackgroundWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              onPressed: () {
                //TODO: onpressed Event, lead to next page.
                if (_restaurantFormKey.currentState.validate()) {
                  //TODO: do something when it's validated, just redirecting to ownerMenuCreation for now.
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => new OwnerMenuCreationPage(),
                    ),
                  );
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
