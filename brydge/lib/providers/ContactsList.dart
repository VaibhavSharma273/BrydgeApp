// import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// // class Contact {
// //   final String userId;
// //   final String firstName;
// //   final String lastName;
// //   final String primaryEmail;
// //   final String secondaryEmail;
// //   final String designation;
// //   final String companyName;
// //   final String phoneNumber;
// //   final String officeNumber;
// //   final String address;
// //   final String location;
// //   final DateTime connectedOn;
// //   final DateTime metOn;
// //   final String notesMeeting;
// //   final String linkedinURL;
// //   final String facebookURL;
// //   final String websiteURL;
// //   final bool fav;

// //   Contact({
// //     @required this.userId,
// //     @required this.firstName,
// //     @required this.lastName,
// //     @required this.primaryEmail,
// //     @required this.secondaryEmail,
// //     @required this.designation,
// //     @required this.companyName,
// //     @required this.phoneNumber,
// //     @required this.officeNumber,
// //     @required this.address,
// //     @required this.location,
// //     @required this.connectedOn,
// //     @required this.metOn,
// //     @required this.notesMeeting,
// //     @required this.linkedinURL,
// //     @required this.facebookURL,
// //     @required this.websiteURL,
// //     @required this.fav,
// //   });
// // }
// //   String userUID;
// // FirebaseAuth.instance.currentUser().then((value) {
// //     userUID = value.uid;
// //   });

// List<Contact> items;

// // List<Contact> items = Firestore.instance
// //     .collection('Contacts')
// //     .where("userUID", isEqualTo: userUID).getDocuments().then((value) => value = items);

// List<Contact> fetchFilteredData({@required String userUID}) {
//   Firestore.instance
//       .collection('Contacts')
//       .where("userUID", isEqualTo: userUID)
//       .getDocuments()
//       .then((value) {
//     value.documents.forEach((element) {
//       items.add(Contact(
//         userId: userUID,
//         firstName: element.data['First Name'],
//         lastName: element.data['Last Name'],
//         primaryEmail: element.data['Primary Email'],
//         secondaryEmail: element.data['Secondary Email'],
//         designation: element.data['Designation'],
//         companyName: element.data['Company Name'],
//         phoneNumber: element.data['Phone Number'],
//         officeNumber: element.data['Office Number'],
//         address: element.data['Address'],
//         location: element.data['Location'],
//         connectedOn: element.data['Connected On'],
//         metOn: element.data['Met On'],
//         notesMeeting: element.data['Meeting Notes'],
//         linkedinURL: element.data['LinkedIn URL'],
//         facebookURL: element.data['Facebook URL'],
//         websiteURL: element.data['Website URL'],
//         fav: element.data['Favorite'],
//       ));
//     });
//   });
//   return items;
// }

// // items needs to have a list of all contacts

// // final items = List<Contact>.generate(
// //     20,
// //     (i) => Contact(
// //           name: "Neel Malhotr",
// //           designation: "Developer",
// //           company: "STC",
// //           connectDate: "03/27/01",
// //           metDate: "09/27/01",
// //           fav: false,
// //         ));
// // //backend list of all contacts

// // var arr = [
// //   'Neel Malhotra',
// //   'Vaibhav Sharma',
// //   'Zahan Parekh',
// // ];

// // var desig = ['Student', 'Tech God', 'Math God'];

// // var comp = ['Unemployed circa 2023', 'Fb', 'GS'];

// // var connDate = ["03/27/01", '02/25/01', '04/05/01'];

// // var metD = ["03/27/01", '02/25/01', '04/05/01'];

// // var favorite = [false, false, true];

// // List<Contact> items = [
// //   Contact(
// //     userId: "",
// //     firstName: arr[0],
// //     lastName: "",
// //     primaryEmail: "",
// //     secondaryEmail: "",
// //     designation: desig[0],
// //     companyName: comp[0],
// //     phoneNumber: "",
// //     officeNumber: "",
// //     address: "",
// //     location: "",
// //     connectedOn: DateTime(2019, 10, 01),
// //     metOn: DateTime(2020, 09, 11),
// //     notesMeeting: "",
// //     linkedinURL: "",
// //     facebookURL: "",
// //     websiteURL: "",
// //     fav: true,
// //   ),
// //   Contact(
// //     userId: "",
// //     firstName: arr[1],
// //     lastName: "",
// //     primaryEmail: "",
// //     secondaryEmail: "",
// //     designation: desig[1],
// //     companyName: comp[1],
// //     phoneNumber: "",
// //     officeNumber: "",
// //     address: "",
// //     location: "",
// //     connectedOn: DateTime(2019, 10, 01),
// //     metOn: DateTime(2020, 09, 11),
// //     notesMeeting: "",
// //     linkedinURL: "",
// //     facebookURL: "",
// //     websiteURL: "",
// //     fav: true,
// //   ),
// //   Contact(
// //     userId: "",
// //     firstName: arr[2],
// //     lastName: "",
// //     primaryEmail: "",
// //     secondaryEmail: "",
// //     designation: desig[2],
// //     companyName: comp[2],
// //     phoneNumber: "",
// //     officeNumber: "",
// //     address: "",
// //     location: "",
// //     connectedOn: DateTime(2019, 10, 01),
// //     metOn: DateTime(2020, 09, 11),
// //     notesMeeting: "",
// //     linkedinURL: "",
// //     facebookURL: "",
// //     websiteURL: "",
// //     fav: true,
// //   ),
// // ];

// // String fetchData() {
// //   CollectionReference collectionReference =
// //       Firestore.instance.collection('Contacts');
// //   collectionReference.getDocuments().then((querySnapshot) {
// //     querySnapshot.documents.forEach((result) {
// //       print(result.data);
// //     });
// //   });
// //   return FirebaseAuth.instance.currentUser().toString();
// // }
