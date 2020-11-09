// ****************** CONTACT VIEW PAGE SCREEN [FROM PARTIAL VIEW] ******************

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import '../ContactEditing/EditContact.dart';

class ContactView extends StatefulWidget {
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
  ContactView(
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
  _ContactView createState() => new _ContactView();
}

class _ContactView extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    final name = widget.name;
    final designation = widget.designation;
    final company = widget.company;
    final connectDate = widget.connectDate;
    final metDate = widget.metDate;
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    final notes = widget.notes;
    final email = widget.email;
    final address = widget.address;
    final number = widget.number;
    final fav = widget.fav;
    final documentID = widget.documentID;

    // bool favVal = fav;

    final profilePicture = Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/linkedin.jpg")),
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );

    final displayName = Text(name,
        style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1C8CB4)));
    final displayDesignationCompany = Text("$designation at $company",
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1C8CB4)));
    final displayConnectDate = Text("Connected on: $connectDate",
        style: TextStyle(
            fontSize: 15,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w300,
            color: Color(0xFF1C8CB4)));
    final displayMetDate = Text("Met on: $metDate",
        style: TextStyle(
            fontSize: 15,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w300,
            color: Color(0xFF1C8CB4)));
    final displayContactDetails = DecoratedBox(
        // height: maxHeight * 0.3,
        // padding: EdgeInsets.all(20.0),
        // width: maxWidth * 0.85,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(0xFF0CB2ED),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                      style: TextStyle(fontSize: 15, color: Colors.white),
                      children: [
                        TextSpan(
                            text: "Mail: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: email),
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      style: TextStyle(fontSize: 15, color: Colors.white),
                      children: [
                        TextSpan(
                            text: "Contact Number: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: number),
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      style: TextStyle(fontSize: 15, color: Colors.white),
                      children: [
                        TextSpan(
                            text: "Company: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: company),
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      style: TextStyle(fontSize: 15, color: Colors.white),
                      children: [
                        TextSpan(
                            text: "Address: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: address),
                      ]),
                ),
              ],
            ),
          ),
        ));

    final displayNotes = DecoratedBox(
        // height: maxHeight * 0.3,
        // padding: EdgeInsets.all(20.0),
        // width: maxWidth * 0.85,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(0xFF0CB2ED),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
                child: Column(children: [
              RichText(
                text: TextSpan(
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    children: [
                      TextSpan(
                          text: "Notes: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: notes),
                    ]),
              ),
              //   Text(
              //   "Notes: " + notes,
              //   style: TextStyle(fontSize: 15, color: Colors.white),
              // ),
            ]))));

    final genMailButton = Material(
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
              sendEmail();

              // Navigator.pop(context); // Change here
            },
            child: Text("Generate Mail",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: Colors.white))),
      ),
    );
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
                              var count = 0;
                              Navigator.popUntil(context, (route) {
                                return count++ == 2;
                              });
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
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditContact(
                                          documentID,
                                          name,
                                          designation,
                                          company,
                                          connectDate,
                                          metDate,
                                          fav,
                                          false,
                                          true,
                                          notes,
                                          email,
                                          address,
                                          number)));
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
                          displayName,
                          displayDesignationCompany,
                          SizedBox(height: maxHeight * 0.01),
                          displayConnectDate,
                          displayMetDate,
                          StreamBuilder(
                              stream: Firestore.instance
                                  .collection("Contacts")
                                  .document(documentID.toString())
                                  .snapshots(),
                              builder: (context, snapshot) {
                                return Container(
                                  child: IconButton(
                                    icon: Icon(
                                        snapshot.data['Favorite']
                                            ? Icons.star
                                            : Icons.star_border,
                                        color: Color(0xFF1C8CB4)),
                                    onPressed: () {
                                      setState(() {
                                        var instance = Firestore.instance
                                            .collection('Contacts')
                                            .document(documentID.toString());
                                        if (snapshot.data['Favorite'] ==
                                            false) {
                                          instance
                                              .updateData({"Favorite": true});
                                        } else {
                                          instance
                                              .updateData({"Favorite": false});
                                        }
                                      });
                                    },
                                  ),
                                );
                              }),
                          SizedBox(height: maxHeight * 0.02),
                          Text("Contact Information",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1C8CB4))),
                          SizedBox(height: maxHeight * 0.01),
                          displayContactDetails,
                          SizedBox(height: maxHeight * 0.01),
                          displayNotes,
                          SizedBox(height: maxHeight * 0.02),
                          genMailButton,
                          SizedBox(height: maxHeight * 0.01),
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

  void sendEmail() async {
    final Email email = Email(
      body: 'Email body',
      subject: 'Email subject',
      recipients: ['neelmalhotra01@gmail.com'],
      // cc: ['cc@example.com'],
      // bcc: ['bcc@example.com'],
      // attachmentPaths: ['/path/to/attachment.zip'],
      isHTML: false,
    );
    await FlutterEmailSender.send(email);
  }
}
