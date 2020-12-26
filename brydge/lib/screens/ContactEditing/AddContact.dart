// import 'package:brydge/ContactsPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../CameraControl/scanner.dart';

import 'package:camera/camera.dart';

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
      notesMeetingText,
      metOnDate = DateFormat("yyyy-MM-dd").format(DateTime.now()).toString(),
      connectedOnDate =
          DateFormat("yyyy-MM-dd").format(DateTime.now()).toString();

  final formKey = GlobalKey<FormState>();

  // DateTime connectedOn, metOn;
  String connectedOnText, metOnText;
  @override
  Widget build(BuildContext context) {
    void addMethod(
        {@required String firstName,
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
          onPressed: () async {
            WidgetsFlutterBinding.ensureInitialized();

            // Obtain a list of the available cameras on the device.
            final cameras = await availableCameras();

            // Get a specific camera from the list of available cameras.
            final firstCamera = cameras.first;

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Scanner(
                          camera: firstCamera,
                        )));
          },
        ),
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

    final companyName = TextFormField(
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

    final mobileNumber = TextFormField(
      keyboardType: TextInputType.number,
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
      keyboardType: TextInputType.streetAddress,
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
        hintText: "Add notes",
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

    final metDate = Material(
      borderRadius: BorderRadius.circular(30.0),
      child: Ink(
          child: Container(
        height: 0.05 * maxHeight,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(80.0)),
            border: Border.all(color: Colors.white, width: 5.0)),
        child: InkWell(
          onTap: () {
            DatePicker.showDatePicker(context,
                showTitleActions: true,
                minTime: DateTime(1990, 3, 5),
                maxTime: DateTime(2020, 11, 25), onChanged: (date) {
              //print('change $date');
              print('change $date');
              setState(() {
                metOnDate = DateFormat("yyyy-MM-dd").format(date).toString();
              });
            }, onConfirm: (date) {
              setState(() {
                metOnDate = DateFormat("yyyy-MM-dd").format(date).toString();
              });
            }, currentTime: DateTime.parse(metOnDate), locale: LocaleType.en);
          },
          child: Center(
            child: Text("Met On: $metOnDate",
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

    // final connectDate = TextFormField(
    //   initialValue: newFormat.format(DateTime.now()).toString(),
    //   keyboardType: TextInputType.datetime,
    //   onChanged: (textVal) {
    //     setState(() {
    //       connectedOnText = textVal;
    //     });
    //   },
    //   obscureText: false,
    //   style: TextStyle(
    //       fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
    //   decoration: InputDecoration(
    //     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    //     hintText: "Connected On",
    //     hintStyle:
    //         TextStyle(fontSize: 17, color: Colors.white.withOpacity(0.7)),
    //     enabledBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(32.0),
    //       borderSide: BorderSide(color: Colors.white, width: 5.0),
    //     ),
    //     focusedBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(32.0),
    //       borderSide: BorderSide(color: Colors.white, width: 5.0),
    //     ),
    //   ),
    // );

    // final connectDate = Material(
    //   borderRadius: BorderRadius.circular(30.0),
    //   child: Ink(
    //       child: Container(
    //     height: 0.05 * maxHeight,
    //     decoration: BoxDecoration(
    //         color: Colors.transparent,
    //         borderRadius: BorderRadius.all(Radius.circular(80.0)),
    //         border: Border.all(color: Colors.white, width: 5.0)),
    //     child: InkWell(
    //       onTap: () {
    //         DatePicker.showDatePicker(context,
    //             showTitleActions: true,
    //             minTime: DateTime(1990, 3, 5),
    //             maxTime: DateTime(2020, 11, 25), onChanged: (date) {
    //           //print('change $date');
    //           print('change $date');
    //           setState(() {
    //             connectedOnDate =
    //                 DateFormat("yyyy-MM-dd").format(date).toString();
    //           });
    //         }, onConfirm: (date) {
    //           setState(() {
    //             connectedOnDate =
    //                 DateFormat("yyyy-MM-dd").format(date).toString();
    //           });
    //         }, currentTime: DateTime.now(), locale: LocaleType.en);
    //       },
    //       child: Center(
    //         child: Text("Connected On: $connectedOnDate",
    //             textAlign: TextAlign.center,
    //             style: TextStyle(
    //               fontSize: 17,
    //               color: Color(0xFF3EBFED),
    //               fontWeight: FontWeight.bold,
    //             )),
    //       ),
    //     ),
    //   )),
    // );

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
            if (formKey.currentState.validate()) {
              formKey.currentState.save();
              addMethod(
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
                  metOn: DateTime.parse(metOnDate),
                  notesMeeting: nullcheck(notesMeetingText),
                  linkedinURL: "",
                  facebookURL: "",
                  websiteURL: "",
                  fav: true);
            }
            //CHANGE THIS - DateTime
            // addMethod(
            //     userId: nullcheck(uid),
            //     firstName: nullcheck(firstNameText),
            //     lastName: nullcheck(lastNameText),
            //     primaryEmail: nullcheck(primaryEmailText),
            //     secondaryEmail: "",
            //     designation: nullcheck(designationText),
            //     companyName: nullcheck(companyNameText),
            //     phoneNumber: nullcheck(mobileNumberText),
            //     officeNumber: "",
            //     address: nullcheck(addressText),
            //     location: "",
            //     connectedOn: DateTime.now(),
            //     metOn: DateTime.now(),
            //     notesMeeting: nullcheck(notesMeetingText),
            //     linkedinURL: "",
            //     facebookURL: "",
            //     websiteURL: "",
            //     fav: true);
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

    return Form(
      key: formKey,
      child: Container(
        child: Scaffold(
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
                            padding:
                                EdgeInsets.fromLTRB(0, maxHeight * 0.03, 0, 0),
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
                              padding: EdgeInsets.fromLTRB(
                                  0, maxHeight * 0.03, 0, 0),
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
        ),
      ),
    );
  }
}

nullcheck(String text) {
  return (text == null) ? "" : text;
}
