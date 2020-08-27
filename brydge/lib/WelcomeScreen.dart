import 'package:flutter/material.dart';
import 'package:flutter_particles/particles.dart';
import './SignUp.dart';
import './LoginScreen.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({
    Key key,
    this.title,
    this.auth,
    this.userEmail,
  }) : super(key: key);
  final String title;
  final String auth;
  final String userEmail;
  @override
  _WelcomeScreen createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> {
  TextStyle style = TextStyle(fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;

    final loginButon = Material(
      borderRadius: BorderRadius.circular(30.0),
      child: Ink(
        decoration: const BoxDecoration(
          color: Color(0xFF3EBFED),
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
        child: MaterialButton(
          minWidth: maxWidth * 0.7,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: Text("Login",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );

    final signUpButton = Material(
      borderRadius: BorderRadius.circular(30.0),
      child: Ink(
        decoration: const BoxDecoration(
          color: Color(0xFF3EBFED),
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
        child: MaterialButton(
          minWidth: maxWidth * 0.7,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: Text("Sign Up",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );

    return Scaffold(
        body: Container(
      color: Color(0xFF3EBFED),
      child: Stack(children: <Widget>[
        Particles(50, Colors.white.withOpacity(0.5)),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Container(
              //color: Colors.white,
              width: maxWidth,
              height: maxHeight * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: maxHeight * 0.5),
                  loginButon,
                  SizedBox(height: maxHeight * 0.02),
                  signUpButton,
                ],
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
