import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  AddContact({Key key}) : super(key: key);
  @override
  _AddContact createState() => new _AddContact();
}

class _AddContact extends State<AddContact> {
  @override
  Widget build(BuildContext context) {
    //final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;

    final scanCard = Align(
      alignment: Alignment.topCenter,
      child: Container(
        //width: 110,
        // height: maxWidth * 0.12,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF0CB2ED),
          border: Border.all(color: Colors.white, width: 10),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
            )
          ],
        ),
        child: IconButton(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            icon: Icon(Icons.camera_alt, color: Colors.white),
            iconSize: 70,
            onPressed: () {}),
      ),
    );

    final firstNameField = TextField(
      obscureText: false,
      style: TextStyle(
          fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        hintText: "First Name",
        hintStyle:
            TextStyle(fontSize: 17, color: Colors.white.withOpacity(0.7)),
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

    final lastNameField = TextField(
      obscureText: false,
      style: TextStyle(
          fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        hintText: "Last Name",
        hintStyle:
            TextStyle(fontSize: 17, color: Colors.white.withOpacity(0.7)),
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

    final primaryEmail = TextField(
      obscureText: false,
      style: TextStyle(
          fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        hintText: "Primary E-Mail",
        hintStyle:
            TextStyle(fontSize: 17, color: Colors.white.withOpacity(0.7)),
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

    final companyName = TextField(
      obscureText: false,
      style: TextStyle(
          fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        hintText: "Company Name",
        hintStyle:
            TextStyle(fontSize: 17, color: Colors.white.withOpacity(0.7)),
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

    final mobileNumber = TextField(
      obscureText: false,
      style: TextStyle(
          fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        hintText: "Mobile Number",
        hintStyle:
            TextStyle(fontSize: 17, color: Colors.white.withOpacity(0.7)),
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

    final address = TextField(
      obscureText: false,
      style: TextStyle(
          fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        hintText: "Address",
        hintStyle:
            TextStyle(fontSize: 17, color: Colors.white.withOpacity(0.7)),
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

    final notes = TextField(
      maxLines: 10,
      keyboardType: TextInputType.multiline,
      obscureText: false,
      style: TextStyle(
          fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
        hintText: "Add some notes",
        hintStyle:
            TextStyle(fontSize: 17, color: Colors.black.withOpacity(0.5)),
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

    final metDate = TextField(
      obscureText: false,
      style: TextStyle(
          fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        hintText: "Met On",
        hintStyle:
            TextStyle(fontSize: 17, color: Colors.white.withOpacity(0.7)),
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

    final connectDate = TextField(
      obscureText: false,
      style: TextStyle(
          fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        hintText: "Connected On",
        hintStyle:
            TextStyle(fontSize: 17, color: Colors.white.withOpacity(0.7)),
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

    final addContact = Material(
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
          },
          child: Center(
            child: Text("Add Contact",
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

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.0), // here the desired height
          child: AppBar(
            backgroundColor: Colors.white,
          )
      ),
      //resizeToAvoidBottomPadding: false,
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
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
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
                          padding:
                              EdgeInsets.fromLTRB(0, 0, maxWidth * 0.02, 0),
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
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, maxHeight * 0.03, 0, 0),
                        child: scanCard,
                      )
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
                            Container(
                              child: Text(
                                'Scan a contact card',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: maxHeight * 0.02),
                            firstNameField,
                            SizedBox(height: maxHeight * 0.01),
                            lastNameField,
                            SizedBox(height: maxHeight * 0.03),
                            primaryEmail,
                            SizedBox(height: maxHeight * 0.01),
                            companyName,
                            SizedBox(height: maxHeight * 0.01),
                            mobileNumber,
                            SizedBox(height: maxHeight * 0.01),
                            address,
                            SizedBox(height: maxHeight * 0.03),
                            notes,
                            SizedBox(height: maxHeight * 0.03),
                            metDate,
                            SizedBox(height: maxHeight * 0.01),
                            connectDate,
                            SizedBox(height: maxHeight * 0.01),
                            SizedBox(height: maxHeight * 0.03),
                            addContact,
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
      ),
    );
  }
}
