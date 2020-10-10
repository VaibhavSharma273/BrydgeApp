// import 'package:brydge/ContactsPage.dart';
import 'dart:async';

import 'package:brydge/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import './VerificationScreen.dart';
import 'firebase_auth_utils.dart';

enum STATE { SIGNIN, SIGNUP }

class SignUpScreen extends StatefulWidget {
  final AuthFunc auth;
  final VoidCallback onSignedIn;
  SignUpScreen({Key key, this.auth, this.onSignedIn}) : super(key: key);
  @override
  _SignUpScreen createState() => new _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  String email, password, passwordConfirm;
  final formKey = GlobalKey<FormState>();
  bool signUpAttempt = false;

  void createUser({String em, String pw}) async {
    try {
      user =
          (await _auth.createUserWithEmailAndPassword(email: em, password: pw))
              .user;
      if (user != null) {
        await user.sendEmailVerification();
        print('sent');
        verificationAlertDialog();
      }
    } catch (err) {
      print(err.code);
      if (err.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text(
                    'This email already has an account associated with it, Sign In instead'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                      startTimer();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                  )
                ],
              );
            });
      } else if (err.code == 'ERROR_INVALID_EMAIL') {
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text('Please enter a valid email'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      } else {
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text('Please try again after some time'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                      startTimer();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                  )
                ],
              );
            });
      }
    }
  }

  void verificationAlertDialog() {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Verification email sent!'),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text('Continue'),
                onPressed: () {
                  Navigator.pop(context);
                  startTimer();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              )
            ],
          );
        });
  }

  void customAlertDialog(
      {@required String text, @required String transitionbutton}) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(text),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text(transitionbutton),
                onPressed: () {
                  Navigator.pop(context);
                  startTimer();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              )
            ],
          );
        });
  }

  String removeSpaces(String text) {
    String textSpecial;
    textSpecial = text.split(' ').join('');
    return textSpecial;
  }

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;

    final emailField = TextFormField(
      autovalidate: signUpAttempt,
      onChanged: (textVal) {
        setState(() {
          email = textVal;
        });
      },
      validator: (emailValue) {
        if (emailValue.isEmpty) {
          return 'This field is mandatory';
        }
        String regEmail = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
            "\\@" +
            "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
            "(" +
            "\\." +
            "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
            ")+";
        RegExp regExp = new RegExp(regEmail);

        if (regExp.hasMatch(emailValue)) {
          // So, the email is valid
          return null;
        }

        return 'This is not a valid email';
      },
      obscureText: false,
      style: TextStyle(fontSize: 17, color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        hintText: "Email",
        hintStyle: TextStyle(
            fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: BorderSide(color: Colors.white, width: 5.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: BorderSide(color: Colors.white, width: 5.0),
        ),
      ),
    );

    final passwordField = TextFormField(
      autovalidate: signUpAttempt,
      onChanged: (textVal) {
        setState(() {
          password = textVal;
        });
      },
      validator: (pwValue) {
        if (pwValue.isEmpty) {
          return 'This field is mandatory';
        }
        if (pwValue.length < 8) {
          return 'Password must be at least 8 characters';
        }
        return null;
      },
      obscureText: true,
      style: TextStyle(fontSize: 17, color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        hintText: "Password",
        hintStyle: TextStyle(
            fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: BorderSide(color: Colors.white, width: 5.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: BorderSide(color: Colors.white, width: 5.0),
        ),
      ),
    );

    final rePasswordField = TextFormField(
      autovalidate: signUpAttempt,
      onChanged: (textVal) {
        setState(() {
          passwordConfirm = textVal;
        });
      },
      validator: (pwConfirmValue) {
        if (pwConfirmValue != password) {
          return 'Passwords must match';
        }
        return null;
      },
      obscureText: true,
      style: TextStyle(fontSize: 17, color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        hintText: "Re-enter Password",
        hintStyle: TextStyle(
            fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: BorderSide(color: Colors.white, width: 5.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: BorderSide(color: Colors.white, width: 5.0),
        ),
      ),
    );

    final verifyButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      child: Ink(
          child: Container(
        width: 0.6 * maxWidth,
        height: 0.05 * maxHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
        child: InkWell(
          onTap: () {
            setState(() {
              signUpAttempt = true;
            });
            if (formKey.currentState.validate()) {
              formKey.currentState.save();
              createUser(em: removeSpaces(email), pw: password);
            }
          },
          child: Center(
            child: Text("Verify Profile",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF3EBFED),
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
      )),
    );

    final resendEmailButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      child: Ink(
          child: Container(
        width: 0.6 * maxWidth,
        height: 0.05 * maxHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
        child: InkWell(
          onTap: () {
            resendEmail();
            verificationAlertDialog();
          },
          child: Center(
            child: Text("Resend Email",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF3EBFED),
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
      )),
    );

    return Form(
      key: formKey,
      child: Container(
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Center(
            child: Container(
              height: maxHeight,
              width: maxWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  tileMode: TileMode.clamp,
                  colors: <Color>[
                    Color(0xFF23B8EB),
                    Color(0xFFA9D7E3),
                  ],
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, maxHeight * 0.08, 0, 0),
                      child: Container(
                        width: maxWidth * 0.18,
                        height: maxWidth * 0.12,
                        padding: EdgeInsets.fromLTRB(0, 0, maxWidth * 0.02, 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50.0),
                              bottomRight: Radius.circular(50.0)),
                        ),
                        child: IconButton(
                            alignment: Alignment.center,
                            icon: Icon(Icons.arrow_back,
                                color: Color(0xFF23B8EB)),
                            iconSize: 30,
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(maxHeight * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          padding:
                              EdgeInsets.fromLTRB(5, maxHeight * 0.15, 5, 0),
                          child: Text(
                            'Hello!',
                            style: TextStyle(
                                fontSize: 0.06 *
                                    curScaleFactor *
                                    maxHeight, //FontSize
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Text(
                            'Welcome to ConnectMe, an app that will allow you to network better, faster, and more efficicently. To begin, create an account below!',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: maxHeight * 0.04),
                        emailField,
                        SizedBox(height: maxHeight * 0.03),
                        passwordField,
                        SizedBox(height: maxHeight * 0.03),
                        rePasswordField,
                        SizedBox(height: maxHeight * 0.08),
                        verifyButton,
                        SizedBox(
                          height: maxHeight * 0.03,
                        ),
                        resendEmailButton,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void resendEmail({String em, String pw, String pwConfirmValue}) async {
    await _auth.currentUser().then((value) {
      value.sendEmailVerification();
      customAlertDialog(
          text: "Verification email re-sent!", transitionbutton: "Continue");
    }).catchError((err) {
      customAlertDialog(
          text: "Error. Please try again", transitionbutton: "OK");
    });
  }
}

void startTimer() {
  // ignore: unused_local_variable
  Timer timer = new Timer.periodic(new Duration(seconds: 5), (time) {
    time.cancel();
  });
// Start the periodic timer which prints something after 5 seconds and then stop it .
}
