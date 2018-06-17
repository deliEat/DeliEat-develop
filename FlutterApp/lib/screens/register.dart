import 'package:DeliEat/screens/registerCustomer.dart';
import 'package:DeliEat/screens/registerOwner.dart';
import 'package:DeliEat/theme/colors.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SafeArea(
        child: new ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 70.0),
            new _Icon(),
            const SizedBox(height: 70.0),
            new _RegisterFields(),
            const SizedBox(height: 50.0),
            new _RegisterButtons()
          ],
        ),
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Image.asset('assets/hotpot.png', height: 70.0, width: 70.0),
        const SizedBox(height: 16.0),
        const Text('DeliEat', style: const TextStyle(fontSize: 20.0)),
      ],
    );
  }
}

class _RegisterFields extends StatefulWidget {
  @override
  _RegisterFieldsState createState() => new _RegisterFieldsState();
}

class _RegisterFieldsState extends State<_RegisterFields> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            labelText: 'Username',
          ),
        ),
        // spacer
        SizedBox(height: 12.0),
        // [Password]
        TextField(
          decoration: InputDecoration(
            labelText: 'Password',
          ),
          obscureText: true,
        ),
        //spacer
        SizedBox(height: 12.0),
        TextField(
          decoration: InputDecoration(
            labelText: 'Confirm Password',
          ),
          obscureText: true,
        ),
      ],
    );
  }
}

class _RegisterButtons extends StatefulWidget {
  @override
  _RegisterButtonsState createState() => new _RegisterButtonsState();
}

class _RegisterButtonsState extends State<_RegisterButtons> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        new Container(
          margin: const EdgeInsets.all(5.0),
          child: new RaisedButton(
            child: Text('Register as Customer'),
            textColor: deliEatBackgroundWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            elevation: 5.0,
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new RegisterCustomerPage(),
                ),
              );
            },
          ),
        ),
        new Container(
          margin: const EdgeInsets.all(5.0),
          child: new RaisedButton(
            child: new Text('Register as Restaurant Owner'),
            textColor: deliEatBackgroundWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            elevation: 5.0,
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new RegisterOwnerPage(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
