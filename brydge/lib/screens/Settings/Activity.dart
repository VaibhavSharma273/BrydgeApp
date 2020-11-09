// ****************** ACTIVITY STATS SCREEN ******************

import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  @override
  _Activity createState() => new _Activity();
}

class _Activity extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;

    final statOne = Container(
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
                      text: "Number of Contacts Added: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "Number"),
                ]),
          ),
        ));

    final statTwo = Container(
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
                      text: "Number of Contacts Shared: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "Number"),
                ]),
          ),
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
                          Text("Activity Statistics",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1C8CB4))),
                          SizedBox(height: maxHeight * 0.02),
                          statOne,
                          SizedBox(height: maxHeight * 0.01),
                          statTwo,
                          SizedBox(height: maxHeight * 0.01),
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
