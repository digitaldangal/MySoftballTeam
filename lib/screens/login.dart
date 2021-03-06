import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_softball_team/screens/addNewGame.dart';
import 'package:my_softball_team/screens/addNewPlayer.dart';
import 'package:my_softball_team/screens/homeScreen.dart';
import 'package:my_softball_team/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, FirebaseUser;

class LoginScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'My Softball Team',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LoginPage(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) => new HomeScreen(),
        '/Signup': (BuildContext context) => new Signup(),
        '/AddNewGame': (BuildContext context) => new AddNewGame(),
        '/AddNewPlayer': (BuildContext context) => new AddNewPlayer(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  var email;
  var password;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.lightBlue,
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "MySoftballTeam",
              style: new TextStyle(fontSize: 30.0, color: Colors.white),
            ),
            new SizedBox(
              height: 25.0,
            ),
            new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Card(
                elevation: 4.0,
                child: new Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      /*new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text("Login"),
                        ],
                      ),*/
                      new SizedBox(
                        height: 25.0,
                      ),
                      new TextField(
                        decoration: new InputDecoration(
                          icon: new Icon(Icons.email),
                          labelText: "Email Address",
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                      ),
                      new SizedBox(
                        height: 25.0,
                      ),
                      new TextField(
                        decoration: new InputDecoration(
                          icon: new Icon(Icons.lock),
                          labelText: "Password",
                        ),
                        obscureText: true,
                        controller: _passwordController,
                      ),
                      new SizedBox(
                        height: 50.0,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          new RaisedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/Signup');
                            },
                            color: Colors.lightBlueAccent,
                            child: new Text(
                              "Create Account",
                              style: new TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: new Builder(
                                builder: (BuildContext loginButtonContext) {
                              return new RaisedButton(
                                onPressed: () async {
                                  email = _emailController.text;
                                  password = _passwordController.text;

                                  try {
                                    final firebaseUser = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
                                    if (firebaseUser.isEmailVerified == true) {
                                      _scaffoldKey.currentState.showSnackBar(
                                        new SnackBar(
                                          duration: new Duration(seconds: 4),
                                          content:
                                            new Row(
                                              children: <Widget>[
                                                new CircularProgressIndicator(),
                                                new Text("    Signing-In...")
                                              ],
                                            ),
                                        )
                                      );
                                      await new Future.delayed(const Duration(seconds : 4));
                                      Navigator.of(context).pushNamedAndRemoveUntil('/HomeScreen',(Route<dynamic> route) => false);
                                    } else {
                                      final optionsDialog = new SimpleDialog(
                                        title: new Text(
                                            "Your email address is not verified"),
                                      );
                                      showDialog(
                                          context: context,
                                          builder: (_) => SimpleDialog(
                                                title: new Text(
                                                    "Your email address is not verified"),
                                                children: <Widget>[
                                                  new Row(
                                                    children: <Widget>[
                                                      new Padding(
                                                        padding:
                                                            const EdgeInsets.only(left: 24.0, top: 16.0, bottom: 16.0),
                                                        child: new Text(
                                                            "Would you like another verificaion email sent?"),
                                                      )
                                                    ],
                                                  ),
                                                  new Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      new FlatButton(
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                          child:
                                                              new Text("No")),
                                                      new FlatButton(
                                                          onPressed: () {
                                                            firebaseUser.sendEmailVerification();
                                                            Navigator.pop(context);
                                                          },
                                                          child:
                                                              new Text("Yes")
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ));
                                    }
                                  } catch (e) {
                                    final snackBar = new SnackBar(
                                      content: new Text(
                                          "Email or Password not found, please try again."),
                                      action: SnackBarAction(
                                        label: 'Dismiss',
                                        onPressed: () {},
                                      ),
                                      duration: new Duration(seconds: 3),
                                    );
                                    Scaffold
                                        .of(loginButtonContext)
                                        .showSnackBar(snackBar);
                                  }
                                },
                                color: Colors.lightBlueAccent,
                                child: new Text(
                                  "Login",
                                  style: new TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
