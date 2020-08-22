import 'package:flutter/material.dart';

class CreateMyProfile extends StatefulWidget {
  CreateMyProfile({Key key}) : super(key: key);
  @override
  _CreateMyProfile createState() => new _CreateMyProfile();
}

class _CreateMyProfile extends State<CreateMyProfile> {
  @override
  Widget build(BuildContext context) {
    //final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Center(
      child: Container(
        color: Colors.white,
        child: Column(
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
                      icon: Icon(Icons.arrow_back_ios, color: Colors.black),
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
