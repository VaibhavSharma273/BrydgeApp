import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditContact extends StatefulWidget {
  final String documentID;
  final String name;
  final String designation;
  final String company;
  final String connectDate;
  final String metDate;
  final bool fav;
  final bool inverted;
  final bool shadowed;
  final String notes;
  final String email;
  final String address;
  final String number;
  EditContact(
      this.documentID,
      this.name,
      this.designation,
      this.company,
      this.connectDate,
      this.metDate,
      this.fav,
      this.inverted,
      this.shadowed,
      this.notes,
      this.email,
      this.address,
      this.number);
  @override
  _EditContact createState() => _EditContact();
}

class _EditContact extends State<EditContact> {
  String firstNameText,
      lastNameText,
      primaryEmailText,
      designationText,
      companyNameText,
      mobileNumberText,
      addressText,
      notesMeetingText;
  final formKey = GlobalKey<FormState>();
  String connectedOnText, metOnText;
  @override
  Widget build(BuildContext context) {
    final name = widget.name;
    // final designation = widget.designation;
    final company = widget.company;
    final connectDate = widget.connectDate;
    final metDate = widget.metDate;
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    final notes = widget.notes;
    final email = widget.email;
    final address = widget.address;
    final number = widget.number;
    final documentID = widget.documentID;

    final profilePicture = Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/linkedin.jpg")),
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
    final firstNameField = TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (textVal) {
        setState(() {
          firstNameText = textVal;
        });
      },
      validator: (fNameValue) {
        if (fNameValue.isEmpty) {
          return 'This field is mandatory';
        }

        return null;
      },
      initialValue: name,
      obscureText: false,
      style: TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        // hintText: name,
        hintStyle:
            TextStyle(fontSize: 15, color: Colors.white.withOpacity(1.0)),
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

    final lastNameField = TextFormField(
      onChanged: (textVal) {
        setState(() {
          lastNameText = textVal;
        });
      },
      initialValue: name,
      //fix this
      obscureText: false,
      style: TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        // hintText: name, //fix this
        hintStyle:
            TextStyle(fontSize: 15, color: Colors.white.withOpacity(1.0)),
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

    final primaryEmail = TextFormField(
      onChanged: (textVal) {
        setState(() {
          primaryEmailText = textVal;
        });
      },
      validator: (pEmailValue) {
        if (pEmailValue.isEmpty) {
          return 'This field is mandatory';
        }
        String regEmail = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
            "\\@" +
            "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
            "(" +
            "\\." +
            "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
            ")+";
        RegExp regExp = new RegExp(regEmail);

        if (!regExp.hasMatch(pEmailValue)) {
          // So, the email is valid
          return 'This is not a valid email';
        }
        return null;
      },
      initialValue: email,
      obscureText: false,
      style: TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        // hintText: email,
        hintStyle:
            TextStyle(fontSize: 15, color: Colors.white.withOpacity(1.0)),
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

    final companyNameField = TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (textVal) {
        setState(() {
          companyNameText = textVal;
        });
      },
      validator: (cValue) {
        if (cValue.isEmpty) {
          return 'This field is mandatory';
        }
        return null;
      },
      initialValue: company,
      obscureText: false,
      style: TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        // hintText: company,
        hintStyle:
            TextStyle(fontSize: 15, color: Colors.white.withOpacity(1.0)),
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

    final mobileNumberField = TextFormField(
      keyboardType: TextInputType.phone,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (textVal) {
        setState(() {
          mobileNumberText = textVal;
        });
      },
      validator: (mobileValue) {
        if (mobileValue.isNotEmpty &&
            mobileValue.contains(new RegExp(r'[A-Z]'))) {
          return 'Mobile Number can not have alphabets';
        }
        return null;
      },
      initialValue: number,
      obscureText: false,
      style: TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        // hintText: number,
        hintStyle:
            TextStyle(fontSize: 15, color: Colors.white.withOpacity(1.0)),
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

    final addressField = TextFormField(
      keyboardType: TextInputType.streetAddress,
      onChanged: (textVal) {
        setState(() {
          addressText = textVal;
        });
      },
      initialValue: address,
      obscureText: false,
      style: TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        // hintText: address,
        hintStyle:
            TextStyle(fontSize: 15, color: Colors.white.withOpacity(1.0)),
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

    final notesField = TextFormField(
      onChanged: (textVal) {
        setState(() {
          notesMeetingText = textVal;
        });
      },
      initialValue: notes,
      maxLines: 10,
      keyboardType: TextInputType.multiline,
      obscureText: false,
      style: TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
        // hintText: notes,
        hintStyle:
            TextStyle(fontSize: 15, color: Colors.black.withOpacity(1.0)),
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

    final metDateField = TextFormField(
      onChanged: (textVal) {
        setState(() {
          metOnText = textVal;
        });
      },
      initialValue: metDate,
      obscureText: false,
      style: TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        // hintText: metDate,
        hintStyle:
            TextStyle(fontSize: 15, color: Colors.white.withOpacity(1.0)),
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

    final connectDateField = TextFormField(
      onChanged: (textVal) {
        setState(() {
          connectedOnText = textVal;
        });
      },
      initialValue: connectDate,
      obscureText: false,
      style: TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        // hintText: connectDate,
        hintStyle:
            TextStyle(fontSize: 15, color: Colors.white.withOpacity(1.0)),
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
    final doneButton = Material(
      borderRadius: BorderRadius.circular(30.0),
      child: Ink(
        width: maxWidth * 0.5,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        child: MaterialButton(
            minWidth: maxWidth * 0.5,
            onPressed: () {
              updateMethod(
                  documentID: documentID,
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
                  fav: true); // Change here
            },
            child: Text("Save Contact",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF0CB2ED)))),
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xFF0CB2ED),
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
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50.0),
                              bottomRight: Radius.circular(50.0)),
                        ),
                        child: IconButton(
                            alignment: Alignment.center,
                            icon: Icon(Icons.arrow_back,
                                color: Color(0xFF0CB2ED)),
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
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              bottomLeft: Radius.circular(50.0)),
                        ),
                        child: IconButton(
                            alignment: Alignment.center,
                            icon: Icon(Icons.done, color: Color(0xFF3EBFED)),
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
                        top: 150,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: maxHeight * 0.02),
                          firstNameField,
                          SizedBox(height: maxHeight * 0.01),
                          lastNameField,
                          SizedBox(height: maxHeight * 0.01),
                          primaryEmail,
                          SizedBox(height: maxHeight * 0.01),
                          companyNameField,
                          SizedBox(height: maxHeight * 0.01),
                          mobileNumberField,
                          SizedBox(height: maxHeight * 0.01),
                          addressField,
                          SizedBox(height: maxHeight * 0.03),
                          notesField,
                          SizedBox(height: maxHeight * 0.03),
                          metDateField,
                          SizedBox(height: maxHeight * 0.01),
                          connectDateField,
                          SizedBox(height: maxHeight * 0.03),
                          doneButton,
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

  void updateMethod(
      {@required String documentID,
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
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseUser user = await auth.currentUser();
    final String userId = user.uid;
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
    await Firestore.instance
        .collection("Contacts")
        .document(documentID.toString())
        .updateData(data)
        .then((value) {
      print("Data successfully edited");
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text('Contact successfully edited'),
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
    }).catchError((err) {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text('Error in editing Contact. Please try again later.'),
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
      print("Error in editing data: " + err);
    });
  }
}

nullcheck(String text) {
  return (text == null) ? "" : text;
}
