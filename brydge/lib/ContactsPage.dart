 import 'package:flutter/material.dart';

class MyContacts extends StatefulWidget {
  MyContacts({Key key}) : super(key: key);
  @override
  _MyContacts createState() => new _MyContacts();
}

class _MyContacts extends State<MyContacts> {
  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Center(
      child: Container(
        color: Colors.black,
        child: Stack(
          children: <Widget> [
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
                  child: IconButton(
                      //padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                      iconSize: 36,
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ),
          ]
        ),
      ),
    ));
  }
}