import 'package:brydge/screens/ContactPages/FavoriteContacts.dart';
import 'package:flutter/material.dart';
import './CreateProfile.dart';

class VerificationScreen extends StatefulWidget {
  VerificationScreen({Key key}) : super(key: key);
  @override
  _VerificationScreen createState() => new _VerificationScreen();
}

class _VerificationScreen extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;

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
            // Change here -- Right now it opens create profile
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateProfile(
                        userUID: userUID,
                      )),
            );
          },
          child: Center(
            child: Text("Resend E-Mail",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF85AFE3),
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
      )),
    );

    return Scaffold(
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
                Color(0xFF70C3E0),
                Color(0xFF9D97E6),
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
                        icon: Icon(Icons.arrow_back, color: Color(0xFF70C3E0)),
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
                      padding: EdgeInsets.fromLTRB(5, maxHeight * 0.15, 5, 0),
                      child: Text(
                        'Check Your Inbox!',
                        style: TextStyle(
                            fontSize:
                                0.06 * curScaleFactor * maxHeight, //FontSize
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text(
                        'We just sent you an email! Fill in the one-time password provided in the email to verify your account.',
                        style: TextStyle(
                            fontSize: 17,
                            //0.030 * curScaleFactor * maxHeight, //FontSize
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(height: maxHeight * 0.08),
                    reSendButton,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
