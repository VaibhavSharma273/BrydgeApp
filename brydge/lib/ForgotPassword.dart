import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key key}) : super(key: key);
  @override
  _ForgotPassword createState() => new _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
  String email;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;

    final emailField = TextFormField(
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

    final resetPasswordButton = Material(
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
            if (formKey.currentState.validate()) {
              formKey.currentState.save();
              passwordReset(email);
            }
            // // Change here -- Right now it opens create profile
            // Navigator.pop(context);
          },
          child: Center(
            child: Text("Reset Password",
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

    final reSendButton = Material(
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
            if (formKey.currentState.validate()) {
              formKey.currentState.save();
              reSendpasswordReset(email);
            }
            // // Change here -- Right now it opens create profile
            // Navigator.pop(context);
          },
          child: Center(
            child: Text("Resend E-Mail",
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
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  tileMode: TileMode.clamp,
                  colors: <Color>[
                    Color(0xFF3EBFED),
                    Color(0xFF1C8CB4),
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
                                color: Color(0xFF70C3E0)),
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
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          padding:
                              EdgeInsets.fromLTRB(5, maxHeight * 0.15, 5, 0),
                          child: Text(
                            'We\'ve Got Your Back!',
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
                            'Enter your registered email and we will send you a mail with a link to reset your password.',
                            style: TextStyle(
                                fontSize: 17,
                                //0.030 * curScaleFactor * maxHeight, //FontSize
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(height: maxHeight * 0.02),
                        emailField,
                        SizedBox(height: maxHeight * 0.08),
                        resetPasswordButton,
                        SizedBox(height: maxHeight * 0.08),
                        reSendButton,
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

  void reSendpasswordReset(String email) async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    await _firebaseAuth.sendPasswordResetEmail(email: email).then((value) {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text('Password reset link sent again!'),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text('Continue'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
    }).catchError((err) {
      if (err.code == 'ERROR_USER_NOT_FOUND') {
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text('User not found. Please Sign up instead'),
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
      }
    });
  }

  void passwordReset(String email) async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    await _firebaseAuth.sendPasswordResetEmail(email: email).then((value) {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text('Password reset link sent!'),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text('Continue'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
    }).catchError((err) {
      if (err.code == 'ERROR_USER_NOT_FOUND') {
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text('User not found. Please Sign up instead'),
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
      }
    });
  }
}
