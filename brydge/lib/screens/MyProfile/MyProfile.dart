
// ****************** MY PROFILE SCREEN ******************

import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfile createState() => new _MyProfile();
}

class _MyProfile extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;

    final profilePicture = Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/linkedin.jpg")),
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );

    final displayName = Text("Name",
        style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1C8CB4)));
    final displayDesignationCompany = Text("Designation at Company",
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1C8CB4)));

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

    final company = Container(
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
                      text: "Company: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "Company"),
                ]),
          ),
        ));

    final address = Container(
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
                      text: "Address: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "Address"),
                ]),
          ),
        ));

    final shareContactButton = Material(
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
            child: Text("Share Contact",
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
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, maxHeight * 0.03, 0, 0),
                        child: profilePicture,
                      )),
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
                          displayName,
                          displayDesignationCompany,
                          SizedBox(height: maxHeight * 0.02),
                          Text("Contact Information",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1C8CB4))),
                          SizedBox(height: maxHeight * 0.01),
                          email,
                          SizedBox(height: maxHeight * 0.01),
                          contactNumber,
                          SizedBox(height: maxHeight * 0.01),
                          company,
                          SizedBox(height: maxHeight * 0.01),
                          address,
                          SizedBox(height: maxHeight * 0.02),
                          shareContactButton,
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
