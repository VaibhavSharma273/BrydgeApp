import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../widgets/contact_card.dart';
// import '../../providers/ContactsList.dart' as pcl;

class Contact {
  final String userId;
  final String firstName;
  final String lastName;
  final String primaryEmail;
  final String secondaryEmail;
  final String designation;
  final String companyName;
  final String phoneNumber;
  final String officeNumber;
  final String address;
  final String location;
  final DateTime connectedOn;
  final DateTime metOn;
  final String notesMeeting;
  final String linkedinURL;
  final String facebookURL;
  final String websiteURL;
  final bool fav;

  Contact({
    @required this.userId,
    @required this.firstName,
    @required this.lastName,
    @required this.primaryEmail,
    @required this.secondaryEmail,
    @required this.designation,
    @required this.companyName,
    @required this.phoneNumber,
    @required this.officeNumber,
    @required this.address,
    @required this.location,
    @required this.connectedOn,
    @required this.metOn,
    @required this.notesMeeting,
    @required this.linkedinURL,
    @required this.facebookURL,
    @required this.websiteURL,
    @required this.fav,
  });
}

class AllContacts extends StatefulWidget {
  AllContacts({Key key}) : super(key: key);
  @override
  _AllContacts createState() => new _AllContacts();
}

String userUID;

class _AllContacts extends State<AllContacts> {
  @override
  Widget build(BuildContext context) {
    // final maxHeight = MediaQuery.of(context).size.height;
    // final maxWidth = MediaQuery.of(context).size.width;

    FirebaseAuth.instance.currentUser().then((user) {
      userUID = user.uid;
    });

    // print("User %s" + userUID);

    // Future<List<Contact>> getAllContacts({@required String userUID}) async {
    //   var firestore = Firestore.instance;
    //   QuerySnapshot qn = await firestore
    //       .collection('Contacts')
    //       .where("userUID", isEqualTo: userUID)
    //       .getDocuments();
    //   for (int i = 0; i < qn.documents.length; i++) {
    //     items.add(Contact(
    //       userId: userUID,
    //       firstName: qn.documents[i].data['First Name'],
    //       lastName: qn.documents[i].data['Last Name'],
    //       primaryEmail: qn.documents[i].data['Primary Email'],
    //       secondaryEmail: qn.documents[i].data['Secondary Email'],
    //       designation: qn.documents[i].data['Designation'],
    //       companyName: qn.documents[i].data['Company Name'],
    //       phoneNumber: qn.documents[i].data['Phone Number'],
    //       officeNumber: qn.documents[i].data['Office Number'],
    //       address: qn.documents[i].data['Address'],
    //       location: qn.documents[i].data['Location'],
    //       connectedOn: DateTime.now(),
    //       metOn: DateTime.now(),
    //       notesMeeting: qn.documents[i].data['Meeting Notes'],
    //       linkedinURL: qn.documents[i].data['LinkedIn URL'],
    //       facebookURL: qn.documents[i].data['Facebook URL'],
    //       websiteURL: qn.documents[i].data['Website URL'],
    //       fav: qn.documents[i].data['Favorite'],
    //     ));
    //   }
    //   return items;
    // }

    // Future getAllContacts({@required String userUID}) async {
    //   var firestore = Firestore.instance;
    //   QuerySnapshot qn = await firestore
    //       .collection('Contacts')
    //       .where("userUID", isEqualTo: userUID)
    //       .getDocuments();
    //   return qn.documents;
    // }

    // Firestore.instance
    //     .collection('Contacts')
    //     .where("userUID", isEqualTo: userUID)
    //     .getDocuments()
    //     .then((value) {
    //   value.documents.forEach((element) {
    //     items.add(Contact(
    //       userId: userUID,
    //       firstName: element.data['First Name'],
    //       lastName: element.data['Last Name'],
    //       primaryEmail: element.data['Primary Email'],
    //       secondaryEmail: element.data['Secondary Email'],
    //       designation: element.data['Designation'],
    //       companyName: element.data['Company Name'],
    //       phoneNumber: element.data['Phone Number'],
    //       officeNumber: element.data['Office Number'],
    //       address: element.data['Address'],
    //       location: element.data['Location'],
    //       connectedOn: DateTime.now(),
    //       metOn: DateTime.now(),
    //       notesMeeting: element.data['Meeting Notes'],
    //       linkedinURL: element.data['LinkedIn URL'],
    //       facebookURL: element.data['Facebook URL'],
    //       websiteURL: element.data['Website URL'],
    //       fav: element.data['Favorite'],
    //     ));
    //   });
    // });

    // var allCount = (items?.length);

    var newFormat = DateFormat("MM/dd/yyyy");

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: StreamBuilder(
              stream: Firestore.instance
                  .collection('Contacts')
                  .where("userUID", isEqualTo: userUID)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return _showLoading();
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (ctx, i) {
                        // DocumentSnapshot ds = snapshot.data.documents[i];
                        return ContactCard(
                            snapshot.data.documents[i].data['FirstName'] +
                                " " +
                                snapshot.data.documents[i].data['LastName'],
                            snapshot.data.documents[i].data['Designation'],
                            snapshot.data.documents[i].data['CompanyName'],
                            newFormat
                                .format(DateTime.parse(snapshot
                                    .data.documents[i].data['ConnectedOn']
                                    .toDate()
                                    .toString()))
                                .toString(), // To be changed - Date Format
                            newFormat
                                .format(DateTime.parse(snapshot
                                    .data.documents[i].data['MetOn']
                                    .toDate()
                                    .toString()))
                                .toString(),
                            // To be changed - Date Format
                            snapshot.data.documents[i].data['Favorite'],
                            false,
                            true
                            // ds['First Name'] + ds['Last Name'],
                            // ds['Designation'],
                            // ds['Company Name'],
                            // newFormat
                            //     .format(DateTime.now())
                            //     .toString(), // TO BE CHANGED
                            // newFormat.format(DateTime.now()).toString(),
                            // ds['Favorite'],
                            // false,
                            // true,
                            );
                      }
                      // snapshot.data.documents[i].data['First Name'] +
                      //     snapshot.data.documents[i].data['Last Name'],
                      // snapshot.data.documents[i].data['Designation'],
                      // snapshot.data.documents[i].data['Company Name'],
                      // newFormat
                      //     .format(DateTime.now())
                      //     .toString(), // To be changed - Date Format
                      // newFormat.format(DateTime.now()).toString(),
                      // // To be changed - Date Format
                      // snapshot.data.documents[i].data['Favorite'],
                      // false,
                      // true),

                      // ignore: null_aware_before_operator
                      // items[i]?.firstName + " " + items[i]?.lastName,
                      // items[i]?.designation,
                      // items[i]?.companyName,
                      // newFormat.format(items[i]?.connectedOn).toString(),
                      // newFormat.format(items[i]?.metOn).toString(),
                      // items[i]?.fav,
                      // false,
                      // true),
                      );
                }
              }),
        ));
  }
}

Widget _showLoading() {
  return Scaffold(
    body: Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    ),
  );
}
