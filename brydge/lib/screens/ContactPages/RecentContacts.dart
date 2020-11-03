// import 'package:brydge/screens/ContactPages/FavoriteContacts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../widgets/contact_card.dart';
import 'AllContacts.dart';

// class Contact {
//   final String userId;
//   final String firstName;
//   final String lastName;
//   final String primaryEmail;
//   final String secondaryEmail;
//   final String designation;
//   final String companyName;
//   final String phoneNumber;
//   final String officeNumber;
//   final String address;
//   final String location;
//   final DateTime connectedOn;
//   final DateTime metOn;
//   final String notesMeeting;
//   final String linkedinURL;
//   final String facebookURL;
//   final String websiteURL;
//   final bool fav;

//   Contact({
//     @required this.userId,
//     @required this.firstName,
//     @required this.lastName,
//     @required this.primaryEmail,
//     @required this.secondaryEmail,
//     @required this.designation,
//     @required this.companyName,
//     @required this.phoneNumber,
//     @required this.officeNumber,
//     @required this.address,
//     @required this.location,
//     @required this.connectedOn,
//     @required this.metOn,
//     @required this.notesMeeting,
//     @required this.linkedinURL,
//     @required this.facebookURL,
//     @required this.websiteURL,
//     @required this.fav,
//   });
// }

class RecentContacts extends StatefulWidget {
  RecentContacts({Key key}) : super(key: key);
  @override
  _RecentContacts createState() => new _RecentContacts();
}

String userUID;

class _RecentContacts extends State<RecentContacts> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.currentUser().then((value) {
      userUID = value.uid;
    });

    // Future getRecentContacts({@required String userUID}) async {
    //   var firestore = Firestore.instance;
    //   QuerySnapshot qn = await firestore
    //       .collection('Contacts')
    //       .where("userUID", isEqualTo: userUID)
    //       .orderBy("ConnectedOn", descending: true)
    //       .getDocuments();
    //   return qn.documents;
    // }

    // final maxHeight = MediaQuery.of(context).size.height;
    // final maxWidth = MediaQuery.of(context).size.width;
    // var recentsCount = 5;

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
                .orderBy("ConnectedOn", descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                print("HIIIIIII " + snapshot.data.documents?.length.toString());
                return _showLoading();
              } else {
                return ListView.builder(
                    itemCount: (snapshot.data.documents?.length == null)
                        ? 0
                        : snapshot.data.documents?.length,
                    itemBuilder: (ctx, i) => i < 4
                        ? ContactCard(
                            snapshot.data.documents[i].documentID,
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
                            true,
                            snapshot.data.documents[i].data['MeetingNotes'],
                            snapshot.data.documents[i].data['PrimaryEmail'],
                            snapshot.data.documents[i].data['Address'],
                            snapshot.data.documents[i].data['PhoneNumber'])

                        //notes, email, address, number)
                        : GroupedCard(
                            [
                              Contact(
                                userId:
                                    snapshot.data.documents[i]?.data['userUID'],
                                firstName: snapshot
                                    .data.documents[i]?.data['FirstName'],
                                lastName: snapshot
                                    .data.documents[i]?.data['LastName'],
                                primaryEmail: snapshot
                                    .data.documents[i]?.data['PrimaryEmail'],
                                secondaryEmail: snapshot
                                    .data.documents[i]?.data['SecondaryEmail'],
                                designation: snapshot
                                    .data.documents[i]?.data['Designation'],
                                companyName: snapshot
                                    .data.documents[i]?.data['CompanyName'],
                                phoneNumber: snapshot
                                    .data.documents[i]?.data['PhoneNumber'],
                                officeNumber: snapshot
                                    .data.documents[i]?.data['OfficeNumber'],
                                address:
                                    snapshot.data.documents[i]?.data['Address'],
                                location: snapshot
                                    .data.documents[i]?.data['Location'],
                                connectedOn: newFormat
                                    .format(DateTime.parse(snapshot
                                        .data.documents[i]?.data['ConnectedOn']
                                        .toDate()
                                        .toString()))
                                    .toString(),
                                metOn: newFormat
                                    .format(DateTime.parse(snapshot
                                        .data.documents[i]?.data['MetOn']
                                        .toDate()
                                        .toString()))
                                    .toString(),
                                notesMeeting: snapshot
                                    .data?.documents[i]?.data['MeetingNotes'],
                                linkedinURL: snapshot
                                    .data.documents[i]?.data['LinkedInURL'],
                                facebookURL: snapshot
                                    .data.documents[i]?.data['FacebookURL'],
                                websiteURL: snapshot
                                    .data.documents[i]?.data['WebsiteURL'],
                                fav: snapshot
                                    .data?.documents[i]?.data['Favorite'],
                              ),
                              Contact(
                                userId: snapshot
                                    .data.documents[i + 1]?.data['userUID'],
                                firstName: snapshot
                                    .data.documents[i + 1]?.data['FirstName'],
                                lastName: snapshot
                                    .data.documents[i + 1]?.data['LastName'],
                                primaryEmail: snapshot.data.documents[i + 1]
                                    ?.data['PrimaryEmail'],
                                secondaryEmail: snapshot.data.documents[i + 1]
                                    ?.data['SecondaryEmail'],
                                designation: snapshot
                                    .data.documents[i + 1]?.data['Designation'],
                                companyName: snapshot
                                    .data.documents[i + 1]?.data['CompanyName'],
                                phoneNumber: snapshot
                                    .data.documents[i + 1]?.data['PhoneNumber'],
                                officeNumber: snapshot.data.documents[i + 1]
                                    ?.data['OfficeNumber'],
                                address: snapshot
                                    .data.documents[i + 1]?.data['Address'],
                                location: snapshot
                                    .data.documents[i + 1]?.data['Location'],
                                connectedOn: newFormat
                                    .format(DateTime.parse(snapshot.data
                                        .documents[i + 1]?.data['ConnectedOn']
                                        .toDate()
                                        .toString()))
                                    .toString(),
                                metOn: newFormat
                                    .format(DateTime.parse(snapshot
                                        .data.documents[i + 1]?.data['MetOn']
                                        .toDate()
                                        .toString()))
                                    .toString(),
                                notesMeeting: snapshot.data?.documents[i + 1]
                                    ?.data['MeetingNotes'],
                                linkedinURL: snapshot
                                    .data.documents[i + 1]?.data['LinkedInURL'],
                                facebookURL: snapshot
                                    .data.documents[i + 1]?.data['FacebookURL'],
                                websiteURL: snapshot
                                    .data.documents[i + 1]?.data['WebsiteURL'],
                                fav: snapshot
                                    .data?.documents[i + 1]?.data['Favorite'],
                                //   userId: snapshot.data[i + 1].data['userUID'],
                                //   firstName:
                                //       snapshot.data[i + 1].data['FirstName'],
                                //   lastName:
                                //       snapshot.data[i + 1].data['LastName'],
                                //   primaryEmail:
                                //       snapshot.data[i + 1].data['PrimaryEmail'],
                                //   secondaryEmail: snapshot
                                //       .data[i + 1].data['SecondaryEmail'],
                                //   designation:
                                //       snapshot.data[i + 1].data['Designation'],
                                //   companyName:
                                //       snapshot.data[i + 1].data['CompanyName'],
                                //   phoneNumber:
                                //       snapshot.data[i + 1].data['PhoneNumber'],
                                //   officeNumber:
                                //       snapshot.data[i + 1].data['OfficeNumber'],
                                //   address: snapshot.data[i + 1].data['Address'],
                                //   location:
                                //       snapshot.data[i + 1].data['Location'],
                                //   connectedOn: (DateTime.parse(snapshot
                                //       .data[i + 1].data['ConnectedOn']
                                //       .toDate()
                                //       .toString())),
                                //   metOn: (DateTime.parse(snapshot
                                //       .data[i + 1].data['MetOn']
                                //       .toDate()
                                //       .toString())),
                                //   notesMeeting:
                                //       snapshot.data[i + 1].data['MeetingNotes'],
                                //   linkedinURL:
                                //       snapshot.data[i + 1].data['LinkedInURL'],
                                //   facebookURL:
                                //       snapshot.data[i + 1].data['FacebookURL'],
                                //   websiteURL:
                                //       snapshot.data[i + 1].data['WebsiteURL'],
                                //   fav: snapshot.data[i + 1].data['Favorite'],
                              ),
                              Contact(
                                userId: snapshot
                                    .data.documents[i + 2]?.data['userUID'],
                                firstName: snapshot
                                    .data.documents[i + 2]?.data['FirstName'],
                                lastName: snapshot
                                    .data.documents[i + 2]?.data['LastName'],
                                primaryEmail: snapshot.data.documents[i + 2]
                                    ?.data['PrimaryEmail'],
                                secondaryEmail: snapshot.data.documents[i + 2]
                                    ?.data['SecondaryEmail'],
                                designation: snapshot
                                    .data.documents[i + 2]?.data['Designation'],
                                companyName: snapshot
                                    .data.documents[i + 2]?.data['CompanyName'],
                                phoneNumber: snapshot
                                    .data.documents[i + 2]?.data['PhoneNumber'],
                                officeNumber: snapshot.data.documents[i + 2]
                                    ?.data['OfficeNumber'],
                                address: snapshot
                                    .data.documents[i + 2]?.data['Address'],
                                location: snapshot
                                    .data.documents[i + 2]?.data['Location'],
                                connectedOn: newFormat
                                    .format(DateTime.parse(snapshot.data
                                        .documents[i + 2]?.data['ConnectedOn']
                                        .toDate()
                                        .toString()))
                                    .toString(),
                                metOn: newFormat
                                    .format(DateTime.parse(snapshot
                                        .data.documents[i + 2]?.data['MetOn']
                                        .toDate()
                                        .toString()))
                                    .toString(),
                                notesMeeting: snapshot.data?.documents[i + 2]
                                    ?.data['MeetingNotes'],
                                linkedinURL: snapshot
                                    .data.documents[i + 2]?.data['LinkedInURL'],
                                facebookURL: snapshot
                                    .data.documents[i + 2]?.data['FacebookURL'],
                                websiteURL: snapshot
                                    .data.documents[i + 2]?.data['WebsiteURL'],
                                fav: snapshot
                                    .data?.documents[i + 2]?.data['Favorite'],
                                // userId: snapshot.data[i + 2].data['userUID'],
                                // firstName:
                                //     snapshot.data[i + 2].data['FirstName'],
                                // lastName:
                                //     snapshot.data[i + 2].data['LastName'],
                                // primaryEmail:
                                //     snapshot.data[i + 2].data['PrimaryEmail'],
                                // secondaryEmail: snapshot
                                //     .data[i + 2].data['SecondaryEmail'],
                                // designation:
                                //     snapshot.data[i + 2].data['Designation'],
                                // companyName:
                                //     snapshot.data[i + 2].data['CompanyName'],
                                // phoneNumber:
                                //     snapshot.data[i + 2].data['PhoneNumber'],
                                // officeNumber:
                                //     snapshot.data[i + 2].data['OfficeNumber'],
                                // address: snapshot.data[i + 2].data['Address'],
                                // location:
                                //     snapshot.data[i + 2].data['Location'],
                                // connectedOn: (DateTime.parse(snapshot
                                //     .data[i + 2].data['ConnectedOn']
                                //     .toDate()
                                //     .toString())),
                                // metOn: (DateTime.parse(snapshot
                                //     .data[i + 2].data['MetOn']
                                //     .toDate()
                                //     .toString())),
                                // notesMeeting:
                                //     snapshot.data[i + 2].data['MeetingNotes'],
                                // linkedinURL:
                                //     snapshot.data[i + 2].data['LinkedInURL'],
                                // facebookURL:
                                //     snapshot.data[i + 2].data['FacebookURL'],
                                // websiteURL:
                                //     snapshot.data[i + 2].data['WebsiteURL'],
                                // fav: snapshot.data[i + 2].data['Favorite'],
                              ),
                              Contact(
                                userId: snapshot
                                    .data.documents[i + 3]?.data['userUID'],
                                firstName: snapshot
                                    .data.documents[i + 3]?.data['FirstName'],
                                lastName: snapshot
                                    .data.documents[i + 3]?.data['LastName'],
                                primaryEmail: snapshot.data.documents[i + 3]
                                    ?.data['PrimaryEmail'],
                                secondaryEmail: snapshot.data.documents[i + 3]
                                    ?.data['SecondaryEmail'],
                                designation: snapshot
                                    .data.documents[i + 3]?.data['Designation'],
                                companyName: snapshot
                                    .data.documents[i + 3]?.data['CompanyName'],
                                phoneNumber: snapshot
                                    .data.documents[i + 3]?.data['PhoneNumber'],
                                officeNumber: snapshot.data.documents[i + 3]
                                    ?.data['OfficeNumber'],
                                address: snapshot
                                    .data.documents[i + 3]?.data['Address'],
                                location: snapshot
                                    .data.documents[i + 3]?.data['Location'],
                                connectedOn: newFormat
                                    .format(DateTime.parse(snapshot.data
                                        .documents[i + 3]?.data['ConnectedOn']
                                        .toDate()
                                        .toString()))
                                    .toString(),
                                metOn: newFormat
                                    .format(DateTime.parse(snapshot
                                        .data.documents[i + 3]?.data['MetOn']
                                        .toDate()
                                        .toString()))
                                    .toString(),
                                notesMeeting: snapshot.data?.documents[i + 3]
                                    ?.data['MeetingNotes'],
                                linkedinURL: snapshot
                                    .data.documents[i + 3]?.data['LinkedInURL'],
                                facebookURL: snapshot
                                    .data.documents[i + 3]?.data['FacebookURL'],
                                websiteURL: snapshot
                                    .data.documents[i + 3]?.data['WebsiteURL'],
                                fav: snapshot
                                    .data?.documents[i + 3]?.data['Favorite'],
                                //   userId: snapshot.data[i + 3].data['userUID'],
                                //   firstName:
                                //       snapshot.data[i + 3].data['First Name'],
                                //   lastName:
                                //       snapshot.data[i + 3].data['Last Name'],
                                //   primaryEmail: snapshot
                                //       .data[i + 3].data['Primary Email'],
                                //   secondaryEmail: snapshot
                                //       .data[i + 3].data['Secondary Email'],
                                //   designation:
                                //       snapshot.data[i + 3].data['Designation'],
                                //   companyName:
                                //       snapshot.data[i + 3].data['Company Name'],
                                //   phoneNumber:
                                //       snapshot.data[i + 3].data['Phone Number'],
                                //   officeNumber: snapshot
                                //       .data[i + 3].data['Office Number'],
                                //   address: snapshot.data[i + 3].data['Address'],
                                //   location:
                                //       snapshot.data[i + 3].data['Location'],
                                //   connectedOn: (DateTime.parse(snapshot
                                //       .data[i + 3].data['Connected On']
                                //       .toDate()
                                //       .toString())),
                                //   metOn: (DateTime.parse(snapshot
                                //       .data[i + 3].data['Met On']
                                //       .toDate()
                                //       .toString())),
                                //   notesMeeting: snapshot
                                //       .data[i + 3].data['Meeting Notes'],
                                //   linkedinURL:
                                //       snapshot.data[i + 3].data['LinkedIn URL'],
                                //   facebookURL:
                                //       snapshot.data[i + 3].data['Facebook URL'],
                                //   websiteURL:
                                //       snapshot.data[i + 3].data['Website URL'],
                                //   fav: snapshot.data[i + 3].data['Favorite'],
                              ),
                            ],
                            snapshot.data.documents[i].data['CompanyName'],
                            newFormat
                                .format(DateTime.parse(snapshot
                                    .data.documents[i].data['ConnectedOn']
                                    .toDate()
                                    .toString()))
                                .toString(),
                            newFormat.format(DateTime.parse(snapshot
                                .data.documents[i].data['MetOn']
                                .toDate()
                                .toString())),
                          ));
              }
            }),
      ),
    );
  }

  Widget _showLoading() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
