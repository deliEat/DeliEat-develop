import 'dart:async';

import 'package:DeliEat/models/user.dart';
import 'package:DeliEat/pages/customerHome.dart';
import 'package:DeliEat/pages/ownerHome.dart';
import 'package:DeliEat/pages/register.dart';
import 'package:DeliEat/services/account.dart';
import 'package:DeliEat/theme/colors.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DecoratedBox(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              const SizedBox(height: 70.0),
              _Icon(),
              const SizedBox(height: 70.0),
              _LoginForm(),
            ],
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset('assets/hotpot.png', height: 70.0, width: 70.0),
        const SizedBox(height: 16.0),
        const Text('DeliEat', style: const TextStyle(fontSize: 20.0)),
        const Text(
          'Deli, Delicious, Delivery Eat',
          style: const TextStyle(fontSize: 15.0),
        ),
      ],
    );
  }
}

class _LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
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
              prefixIcon: Icon(
                const IconData(0xe7fd, fontFamily: 'MaterialIcons'),
              ),
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
              prefixIcon: Icon(
                const IconData(0xe897, fontFamily: 'MaterialIcons'),
              ),
            ),
            obscureText: true,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                child: RaisedButton(
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
                        startUserSession(user);
                        if (user.type == customer) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CustomerHomePage(),
                            ),
                          );
                        } else if (user.type == owner) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  OwnerHomePage(ownerId: user.id),
                            ),
                          );
                        }
                        // TODO: Add error handling
                      });
                    }
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: InkWell(
                  child: Center(
                    child: Text('Register'),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
