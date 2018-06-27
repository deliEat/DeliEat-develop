import 'package:flutter/material.dart';
import '../theme/colors.dart';

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
              child: new Image(
                image: new AssetImage('assets/food.jpg'),
              ),
            ),
            new Positioned(left: 12.0, top: 60.0, child: new _UploadIcon()),
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
        //TODO:
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
  _RestaurantInfoSectionState createState() => new _RestaurantInfoSectionState();
}

class _RestaurantInfoSectionState extends State<_RestaurantInfoSection> {
  //TODO: build each listTile based on a list?

  @override
  Widget build(BuildContext context) {
    return new Form(
      child: new Expanded(
        child: ListView(
          children: <Widget>[
            buildInfoItem("Restaurant Name"),
            buildInfoItem("Restaurant Name"),
            buildInfoItem("Restaurant Name"),
            buildInfoItem("Restaurant Name"),
            buildInfoItem("Restaurant Name"),
            buildInfoItem("Restaurant Name"),
            buildInfoItem("Restaurant Name"),
          ],
        ),
      )
    );
  }

  Container buildInfoItem(String title) {
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0,),
      child: new TextFormField(
        decoration: InputDecoration(
          border: new UnderlineInputBorder(),
          labelText: title,
        ),
      ),
    );
  }
}
