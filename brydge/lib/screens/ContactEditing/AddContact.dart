// import 'package:brydge/ContactsPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  final String userUID;
  AddContact({Key key, @required this.userUID}) : super(key: key);
  @override
  _AddContact createState() => new _AddContact();
}

class _AddContact extends State<AddContact> {
  String firstNameText,
      lastNameText,
      primaryEmailText,
      designationText,
      companyNameText,
      mobileNumberText,
      addressText,
      notesMeetingText;

  // DateTime connectedOn, metOn;
  String connectedOnText, metOnText;
  @override
  Widget build(BuildContext context) {
    void addMethod(
        {@required String userId,
        @required String firstName,
        @required String lastName,
        @required String primaryEmail,
        @required String secondaryEmail,
        @required String designation,
        @required String companyName,
        @required String phoneNumber,
        @required String officeNumber,
        @required String address,
        @required String location,
        @required DateTime connectedOn,
        @required DateTime metOn,
        @required String notesMeeting,
        @required String linkedinURL,
        @required String facebookURL,
        @required String websiteURL,
        @required bool fav}) async {
      CollectionReference collectionReference =
          Firestore.instance.collection('Contacts');
      Map<String, dynamic> data = {
        "userUID": userId,
        "FirstName": firstName,
        "LastName": lastName,
        "PrimaryEmail": primaryEmail,
        "SecondaryEmail": secondaryEmail,
        "Designation": designation,
        "CompanyName": companyName,
        "PhoneNumber": phoneNumber,
        "OfficeNumber": officeNumber,
        "Address": address,
        "Location": location,
        "ConnectedOn": connectedOn,
        "MetOn": metOn,
        "MeetingNotes": notesMeeting,
        "LinkedInURL": linkedinURL,
        "FacebookURL": facebookURL,
        "WebsiteURL": websiteURL,
        "Favorite": fav,
      };
      await collectionReference.add(data).then((value) {
        print("Data successfully added");
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text('Contact successfully added'),
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
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (context) => ()));
      }).catchError((err) {
        print("Error in adding data");
      });
    }

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
      onChanged: (textVal) {
        setState(() {
          firstNameText = textVal;
        });
      },
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
      onChanged: (textVal) {
        setState(() {
          lastNameText = textVal;
        });
      },
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
      onChanged: (textVal) {
        setState(() {
          primaryEmailText = textVal;
        });
      },
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

    final designation = TextField(
      onChanged: (textVal) {
        setState(() {
          designationText = textVal;
        });
      },
      obscureText: false,
      style: TextStyle(
          fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        hintText: "Designation",
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
      onChanged: (textVal) {
        setState(() {
          companyNameText = textVal;
        });
      },
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
      onChanged: (textVal) {
        setState(() {
          mobileNumberText = textVal;
        });
      },
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
      onChanged: (textVal) {
        setState(() {
          addressText = textVal;
        });
      },
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
      onChanged: (textVal) {
        setState(() {
          notesMeetingText = textVal;
        });
      },
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
      onChanged: (textVal) {
        setState(() {
          metOnText = textVal;
        });
      },
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
      onChanged: (textVal) {
        setState(() {
          connectedOnText = textVal;
        });
      },
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
          onTap: () async {
            final FirebaseAuth auth = FirebaseAuth.instance;
            final FirebaseUser user = await auth.currentUser();
            final String uid = user.uid;
            //CHANGE THIS - DateTime
            addMethod(
                userId: nullcheck(uid),
                firstName: nullcheck(firstNameText),
                lastName: nullcheck(lastNameText),
                primaryEmail: nullcheck(primaryEmailText),
                secondaryEmail: "",
                designation: nullcheck(designationText),
                companyName: nullcheck(companyNameText),
                phoneNumber: nullcheck(mobileNumberText),
                officeNumber: "",
                address: nullcheck(addressText),
                location: "",
                connectedOn: DateTime.now(),
                metOn: DateTime.now(),
                notesMeeting: nullcheck(notesMeetingText),
                linkedinURL: "",
                facebookURL: "",
                websiteURL: "",
                fav: true);
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
          )),
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
                          padding:
                              EdgeInsets.fromLTRB(0, maxHeight * 0.03, 0, 0),
                          child: scanCard,
                        )),
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
                            SizedBox(height: maxHeight * 0.03),
                            designation,
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

nullcheck(String text) {
  return (text == null) ? "" : text;
}
