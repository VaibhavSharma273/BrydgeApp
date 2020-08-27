import 'package:flutter/material.dart';
import 'firebase_auth_utils.dart';

class MyContacts extends StatelessWidget {
  final AuthFunc auth;
  final VoidCallback onSignOut;
  final String userId, userEmail;

  MyContacts({Key key, this.auth, this.onSignOut, this.userId, this.userEmail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Center(
      child: Container(
        color: Colors.black,
        child: Stack(children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                width: maxWidth * 0.5,
                padding: EdgeInsets.fromLTRB(0, maxHeight * 0.45, 0, 0),
                //color: Colors.white,
                decoration: BoxDecoration(
                  //color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0)),
                ),
                child: Column(
                  children: [
                    Text(
                      userEmail,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
          ),
        ]),
      ),
    ));
  }
}
