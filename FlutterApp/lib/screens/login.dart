import 'dart:async';

import 'package:DeliEat/models/user.dart';
import 'package:DeliEat/screens/customerHome.dart';
import 'package:DeliEat/screens/ownerHome.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../register.dart';
import '../services/account.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SafeArea(
        child: new DecoratedBox(
            child: new ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              children: <Widget>[
                const SizedBox(height: 70.0),
                new _Icon(),
                const SizedBox(height: 70.0),
                new _LoginForm(),
              ],
            ),
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage('assets/background.jpg'),
                    fit: BoxFit.fill))),
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
        const Text('Deli, Delicious, Delivery Eat',
            style: const TextStyle(fontSize: 15.0)),
      ],
    );
  }
}

class _LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => new _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  final _usernameController = new TextEditingController();
  final _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Form(
        key: _formKey,
        child: new Column(
          children: <Widget>[
            TextFormField(
              controller: _usernameController,
              validator: (val) {
                if (val.isEmpty) {
                  return 'Username is required';
                }
              },
              decoration: InputDecoration(
                labelText: 'Username',
                prefixIcon: new Icon(
                    const IconData(0xe7fd, fontFamily: 'MaterialIcons')),
              ),
            ),
            SizedBox(height: 12.0),
            TextFormField(
              controller: _passwordController,
              validator: (val) {
                if (val.isEmpty) {
                  return 'Password is required';
                }
              },
              decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: new Icon(
                      const IconData(0xe897, fontFamily: 'MaterialIcons'))),
              obscureText: true,
            ),
            new Container(
              margin: const EdgeInsets.all(5.0),
              child: new RaisedButton(
                  child: Text('LOGIN'),
                  elevation: 5.0,
                  textColor: deliEatBackgroundWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Future<User> user = login(
                        _usernameController.text,
                        _passwordController.text,
                      );
                      user.then((user) {
                        if (user.type == 'customer') {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new CustomerHomePage()),
                          );
                        } else if (user.type == 'owner') {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new OwnerHomePage()),
                          );
                        }
                        // TODO: Add error handling
                      });
                    }
                  }),
            ),
//          new Container(
//                  margin: const EdgeInsets.all(10.0),
//                  child: new InkWell(
//                  child: new Center(
//                    child: new Text('Register'),
//                  ),
//                  onTap
//                }: () {
//                    Navigator.push(
//                      context,
//                      new MaterialPageRoute(builder: (context) => new RegisterPage()),
//                    );
//                  }
//              )
//          )
          ],
        ));

//    return new Column(
//      children: <Widget> [
//        TextField(
//          controller: usernameController,
//          decoration: InputDecoration(
//            labelText: 'Username',
//            prefixIcon: new Icon(
//              const IconData(0xe7fd, fontFamily: 'MaterialIcons')
//            ),
//          ),
//        ),
//        SizedBox(height: 12.0),
//        TextField(
//          controller: passwordController,
//          decoration: InputDecoration(
//            labelText: 'Password',
//            prefixIcon: new Icon(
//              const IconData(0xe897, fontFamily: 'MaterialIcons')
//            )
//          ),
//          obscureText: true,
//        ),
//      ],
//    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

//class _LoginButtons extends StatefulWidget {
//  @override
//  _LoginButtonsState createState() => new _LoginButtonsState();
//}

//class _LoginButtonsState extends State<_LoginButtons> {
//  @override
//  Widget build(BuildContext context) {
//    return new Column(
//      crossAxisAlignment: CrossAxisAlignment.stretch,
//      children: <Widget>[
//        new Container (
//          margin: const EdgeInsets.all(5.0),
//          child: new RaisedButton(
//            child: Text('LOGIN'),
//            elevation: 5.0,
//            textColor: deliEatBackgroundWhite,
//            shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.all(Radius.circular(15.0)),
//            ),
//            onPressed: () {
//              // TODO: Login
//              login(new LoginRequest(
//                username: usernameController.text,
//                password: passowordController.text));
//            }
//          )
//        ),
//        new Container(
//          margin: const EdgeInsets.all(10.0),
//          child: new InkWell(
//            child: new Center(
//              child: new Text('Register'),
//            ),
//            onTap: () {
//              Navigator.push(
//                context,
//                new MaterialPageRoute(builder: (context) => new RegisterPage()),
//              );
//            }
//          )
//        )
//      ],
//    );
//  }
//}
