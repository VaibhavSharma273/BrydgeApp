import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../widgets/contact_card.dart';
// import '../../providers/FavoriteContactsList.dart' as fcl;

class FavoriteContacts extends StatefulWidget {
  FavoriteContacts({Key key}) : super(key: key);
  @override
  _FavoriteContacts createState() => new _FavoriteContacts();
}

String userUID;

class _FavoriteContacts extends State<FavoriteContacts> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.currentUser().then((value) {
      userUID = value.uid;
    });

    // Future getFavoriteContacts({@required String userUID}) async {
    //   var firestore = Firestore.instance;
    //   QuerySnapshot qn = await firestore
    //       .collection('Contacts')
    //       .where("userUID", isEqualTo: userUID)
    //       .where("Favorite", isEqualTo: true)
    //       .getDocuments();
    //   return qn.documents;
    // }

    // final maxHeight = MediaQuery.of(context).size.height;
    // final maxWidth = MediaQuery.of(context).size.width;
    // var favoritesCount = 5;

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
                  .where("Favorite", isEqualTo: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return _showLoading();
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.documents?.length,
                    itemBuilder: (ctx, i) => ContactCard(
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
                        snapshot.data.documents[i].data['PhoneNumber']),
                  );
                }
              }),
        ));
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
