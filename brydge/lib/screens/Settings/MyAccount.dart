// ****************** MY ACCOUNT SCREEN ******************

import 'package:flutter/material.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccount createState() => new _MyAccount();
}

class _MyAccount extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;

    final displayName = Container(
        width: maxWidth * 0.90,
        //height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(0xFF3EBFED),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 10.0),
        child: Center(
          child: RichText(
            text: TextSpan(
                style: TextStyle(fontSize: 17, color: Colors.white),
                children: [
                  TextSpan(
                      text: "Name: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "Name"),
                ]),
          ),
        ));

    final email = Container(
        width: maxWidth * 0.90,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(0xFF3EBFED),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 10.0),
        child: Center(
          child: RichText(
            text: TextSpan(
                style: TextStyle(fontSize: 17, color: Colors.white),
                children: [
                  TextSpan(
                      text: "Mail: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "Email"),
                ]),
          ),
        ));

    final contactNumber = Container(
        width: maxWidth * 0.90,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(0xFF3EBFED),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 10.0),
        child: Center(
          child: RichText(
            text: TextSpan(
                style: TextStyle(fontSize: 17, color: Colors.white),
                children: [
                  TextSpan(
                      text: "Number: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "Number"),
                ]),
          ),
        ));

    final forgotPassword = Material(
      borderRadius: BorderRadius.circular(30.0),
      child: Ink(
        width: maxWidth * 0.5,
        decoration: const BoxDecoration(
          color: Color(0xFF0CB2ED),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        child: MaterialButton(
            minWidth: maxWidth * 0.5,
            onPressed: () {
              Navigator.pop(context); // Change here
            },
            child: Text("Forgot Password",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: Colors.white))),
      ),
    );

    final signOut = Material(
      borderRadius: BorderRadius.circular(30.0),
      child: Ink(
        width: maxWidth * 0.5,
        decoration: const BoxDecoration(
          color: Color(0xFF0CB2ED),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        child: MaterialButton(
            minWidth: maxWidth * 0.5,
            onPressed: () {
              var count = 0;
              Navigator.popUntil(context, (route) {
                return count++ == 2;
              });
            },
            child: Text("Sign Out",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: Colors.white))),
      ),
    );

    final deleteAccount = Material(
      borderRadius: BorderRadius.circular(30.0),
      child: Ink(
        width: maxWidth * 0.5,
        decoration: const BoxDecoration(
          color: Color(0xFF0CB2ED),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        child: MaterialButton(
            minWidth: maxWidth * 0.5,
            onPressed: () {
              Navigator.pop(context); // Change here
            },
            child: Text("Delete Account",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: Colors.white))),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: maxHeight,
          width: maxWidth,
          child: ListView(
            children: [
              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, maxHeight * 0.03, 0, 0),
                      child: Container(
                        width: maxWidth * 0.18,
                        height: maxWidth * 0.12,
                        padding: EdgeInsets.fromLTRB(0, 0, maxWidth * 0.02, 0),
                        decoration: BoxDecoration(
                          color: Color(0xFF3EBFED),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50.0),
                              bottomRight: Radius.circular(50.0)),
                        ),
                        child: IconButton(
                            alignment: Alignment.center,
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            iconSize: 30,
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, maxHeight * 0.03, 0, 0),
                      child: Container(
                        width: maxWidth * 0.18,
                        height: maxWidth * 0.12,
                        padding: EdgeInsets.fromLTRB(maxWidth * 0.02, 0, 0, 0),
                        decoration: BoxDecoration(
                          color: Color(0xFF3EBFED),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              bottomLeft: Radius.circular(50.0)),
                        ),
                        child: IconButton(
                            alignment: Alignment.center,
                            icon: Icon(Icons.edit, color: Colors.white),
                            iconSize: 30,
                            onPressed: () {}),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: maxHeight * 0.04,
                        left: maxHeight * 0.02,
                        right: maxHeight * 0.02,
                        top: 150,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Account Information",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1C8CB4))),
                          SizedBox(height: maxHeight * 0.02),
                          displayName,
                          SizedBox(height: maxHeight * 0.01),
                          email,
                          SizedBox(height: maxHeight * 0.01),
                          contactNumber,
                          SizedBox(height: maxHeight * 0.01),
                          SizedBox(height: maxHeight * 0.02),
                          forgotPassword,
                          SizedBox(height: maxHeight * 0.01),
                          signOut,
                          SizedBox(height: maxHeight * 0.01),
                          deleteAccount,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
