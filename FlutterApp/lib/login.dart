import 'package:flutter/material.dart';

import 'register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            new _LoginFields(),
            const SizedBox(height: 70.0),
            new _LoginButtons()
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
        new Image.asset('assets/hotpot.png',
          height: 70.0,
          width: 70.0),
        const SizedBox(height: 16.0),
        const Text('DeliEat',
          style: const TextStyle(fontSize: 20.0)),
      ],
    );
  }
}

class _LoginFields extends StatefulWidget {
  @override
  _LoginFieldsState createState() => new _LoginFieldsState();
}

class _LoginFieldsState extends State<_LoginFields> {
  @override
  Widget build(BuildContext context){
    return new Column(
      children: <Widget> [
        TextField(
          decoration: InputDecoration(
            labelText: 'Username',
            prefixIcon: new Icon(
              const IconData(0xe7fd, fontFamily: 'MaterialIcons')
            ),
          ),
        ),
// spacer
        SizedBox(height: 12.0),
// [Password]
        TextField(
          decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: new Icon(
              const IconData(0xe897, fontFamily: 'MaterialIcons')
            )
          ),
          obscureText: true,
        ),
      ],
    );
  }
}

class _LoginButtons extends StatefulWidget {
  @override
  _LoginButtonsState createState() => new _LoginButtonsState();
}

class _LoginButtonsState extends State<_LoginButtons> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        new Container (
          margin: const EdgeInsets.all(5.0),
          child: new RaisedButton(
            child: Text('LOGIN'),
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            onPressed: () {
              // TODO: Login
            }
          )
        ),
        new Container(
          margin: const EdgeInsets.all(10.0),
          child: new InkWell(
            child: new Center(
              child: new Text('Register'),
            ),
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new RegisterPage()),
              );
            }
          )
        )
      ],
    );
  }
}