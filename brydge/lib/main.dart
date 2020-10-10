import 'package:brydge/ContactsPage.dart';
import 'package:brydge/SignUp.dart';
import 'package:brydge/WelcomeScreen.dart';
import 'package:flutter/material.dart';
// import './WelcomeScreen.dart';
import 'firebase_auth_utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ConnectMe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyAppHome(
        auth: new MyAuth(),
      ),
    );
  }
}

class MyAppHome extends StatefulWidget {
  MyAppHome({this.auth});

  final AuthFunc auth;

  @override
  State<StatefulWidget> createState() => new _MyAppHomeState();
}

enum AuthStatus {
  NOT_LOGIN,
  NOT_DETERMINED,
  LOGIN,
}

class _MyAppHomeState extends State<MyAppHome> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "", _userEmail = "";

  void initstate() {
    super.initState();
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
          _userEmail = user?.email;
        }
        authStatus =
            user?.uid == null ? AuthStatus.NOT_LOGIN : AuthStatus.LOGIN;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return WelcomeScreen(
          userEmail: _userEmail,
        );
      // return _showLoading();
      case AuthStatus.NOT_LOGIN:
        return SignUpScreen(auth: widget.auth, onSignedIn: _onSignedIn);
      case AuthStatus.LOGIN:
        return MyContacts(
            userUID: _userId, userEmail: _userEmail, onSignOut: _onSignOut);
      default:
        return _showLoading();
    }
  }

  void _onSignOut() {
    setState(() {
      authStatus = AuthStatus.NOT_LOGIN;
      _userId = _userEmail = "";
    });
  }

  void _onSignedIn() {
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        _userId = user.uid.toString();
        _userEmail = user.email.toString();
      });

      setState(() {
        authStatus = AuthStatus.LOGIN;
      });
    });
  }
}

Widget _showLoading() {
  return Scaffold(
    body: Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    ),
  );
}
