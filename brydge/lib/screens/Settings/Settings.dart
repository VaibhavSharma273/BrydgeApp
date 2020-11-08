// ****************** CONTACT VIEW PAGE SCREEN [FROM PARTIAL VIEW] ******************

import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _Settings createState() => new _Settings();
}

class _Settings extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;

    final accountBox = Container(
        alignment: Alignment.centerLeft,
        height: 130,
        width: maxWidth * 0.90,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(0xFF3EBFED),
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Account",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Colors.white))),
            SizedBox(height: 10),
            Container(
                width: maxWidth * 0.90,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                padding: const EdgeInsets.fromLTRB(10.0, 4.0, 5.0, 5.0),
                child: Text("My Account",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1C8CB4)))),
            SizedBox(height: 10),
            Container(
                width: maxWidth * 0.90,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                padding: const EdgeInsets.fromLTRB(10.0, 4.0, 5.0, 5.0),
                child: Text("Activity",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1C8CB4))))
          ],
        ));

    final settingsBox = Container(
        alignment: Alignment.centerLeft,
        height: 170,
        width: maxWidth * 0.90,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(0xFF3EBFED),
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Settings",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Colors.white))),
            SizedBox(height: 10),
            Container(
                width: maxWidth * 0.90,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                padding: const EdgeInsets.fromLTRB(10.0, 4.0, 5.0, 5.0),
                child: Text("App Settings",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1C8CB4)))),
            SizedBox(height: 10),
            Container(
                width: maxWidth * 0.90,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                padding: const EdgeInsets.fromLTRB(10.0, 4.0, 5.0, 5.0),
                child: Text("Security",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1C8CB4)))),
            SizedBox(height: 10),
            Container(
                width: maxWidth * 0.90,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                padding: const EdgeInsets.fromLTRB(10.0, 4.0, 5.0, 5.0),
                child: Text("Notifications",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1C8CB4))))
          ],
        ));

    final aboutBox = Container(
        alignment: Alignment.centerLeft,
        height: 210,
        width: maxWidth * 0.90,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(0xFF3EBFED),
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text("About",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Colors.white))),
            SizedBox(height: 10),
            Container(
                width: maxWidth * 0.90,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                padding: const EdgeInsets.fromLTRB(10.0, 4.0, 5.0, 5.0),
                child: Text("Help",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1C8CB4)))),
            SizedBox(height: 10),
            Container(
                width: maxWidth * 0.90,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                padding: const EdgeInsets.fromLTRB(10.0, 4.0, 5.0, 5.0),
                child: Text("Rate Us",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1C8CB4)))),
            SizedBox(height: 10),
            Container(
                width: maxWidth * 0.90,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                padding: const EdgeInsets.fromLTRB(10.0, 4.0, 5.0, 5.0),
                child: Text("Terms and Privacy",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1C8CB4)))),
            SizedBox(height: 10),
            Container(
                width: maxWidth * 0.90,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                padding: const EdgeInsets.fromLTRB(10.0, 4.0, 5.0, 5.0),
                child: Text("Share the App",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1C8CB4))))
          ],
        ));

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
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: maxHeight * 0.04,
                        left: maxHeight * 0.02,
                        right: maxHeight * 0.02,
                        top: 80,
                      ),
                      child: Container(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          height: maxHeight * 0.8,
                          child: ListView(
                            children: [
                              accountBox,
                              SizedBox(height: 20),
                              settingsBox,
                              SizedBox(height: 20),
                              aboutBox,
                            ],
                          )),
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
