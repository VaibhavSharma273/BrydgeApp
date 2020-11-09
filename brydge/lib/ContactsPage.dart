import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './screens/ContactPages/RecentContacts.dart';
import './screens/ContactPages/AllContacts.dart';
import './screens/ContactPages/FavoriteContacts.dart';
import './screens/ContactEditing/AddContact.dart';
import './screens//Settings/Settings.dart';
import './screens/MyProfile/MyProfile.dart';
// import 'firebase_auth_utils.dart';

class MyContacts extends StatefulWidget {
  final VoidCallback onSignOut;
  final String userUID, userEmail;

  MyContacts({Key key, this.onSignOut, @required this.userUID, this.userEmail})
      : super(key: key);
  @override
  _MyContacts createState() => new _MyContacts();
}

class _MyContacts extends State<MyContacts> {
  var pressedRecents = true;
  var pressedAll = false;
  var pressedFavorites = false;

  PageController controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    String uid;
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;
    //final curScaleFactor = MediaQuery.of(context).textScaleFactor; // Use this
    //PageController pageController = PageController(initialPage: 0);
    final addContact = Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, maxHeight * 0.06, 0, 0),
        child: Container(
          // width: maxWidth * 0.18,
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
              alignment: Alignment.center,
              icon: Icon(Icons.add, color: Colors.white),
              iconSize: 70,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddContact(
                              userUID: uid,
                            )));
              }),
        ),
      ),
    );

    final settingsButton = Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, maxHeight * 0.0, 0, 0),
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
              icon: Icon(Icons.settings, color: Color(0xFF3EBFED)),
              iconSize: 30,
              onPressed: () async {
                final FirebaseAuth auth = FirebaseAuth.instance;
                final FirebaseUser user = await auth.currentUser();
                uid = user.uid;
                Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
              }),
        ),
      ),
    );

    final myProfileButton = Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, maxHeight * 0.0, 0, 0),
        child: Container(
          width: maxWidth * 0.18,
          height: maxWidth * 0.12, //Why?
          padding: EdgeInsets.fromLTRB(maxWidth * 0.02, 0, 0, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                bottomLeft: Radius.circular(50.0)),
          ),
          child: IconButton(
              alignment: Alignment.center,
              icon: Icon(Icons.person, color: Color(0xFF3EBFED)),
              iconSize: 30,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfile()));
              }),
        ),
      ),
    );

    final searchBar = TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black.withOpacity(0.1),
          prefixIcon: Icon(Icons.search, color: Colors.white.withOpacity(0.5)),
          contentPadding: EdgeInsets.symmetric(vertical: 2), //Fix This
          hintText: "Search",
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 17,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: BorderSide(color: Colors.transparent)),
        ));

    final contactScreens = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              height: maxHeight * 0.03,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0)),
              ),
              child: FlatButton(
                  color:
                      pressedRecents ? Color(0xFF636366) : Colors.transparent,
                  child: Text(
                    "Recents",
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    setState(() {
                      pressedRecents = true;
                      pressedAll = false;
                      pressedFavorites = false;
                    });
                    controller.animateToPage(0,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.easeIn);
                  },
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)))
                  //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  ),
            ),
          ),
          Expanded(
            child: Container(
              height: maxHeight * 0.03,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
              ),
              child: FlatButton(
                color: pressedAll ? Color(0xFF636366) : Colors.transparent,
                child: Text(
                  "All",
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  setState(() {
                    pressedRecents = false;
                    pressedAll = true;
                    pressedFavorites = false;
                  });
                  controller.animateToPage(1,
                      duration: Duration(milliseconds: 250),
                      curve: Curves.easeIn);
                },
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: maxHeight * 0.03,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0)),
              ),
              child: FlatButton(
                  color:
                      pressedFavorites ? Color(0xFF636366) : Colors.transparent,
                  child: Text(
                    "Favorites",
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    setState(() {
                      pressedRecents = false;
                      pressedAll = false;
                      pressedFavorites = true;
                    });
                    controller.animateToPage(2,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.easeIn);
                  },
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)))
                  //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  ),
            ),
          ),
        ]);
    //Consider toggle button

    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                Color(0xFF0CB2ED),
                Color(0xFFC8E7F2),
              ],
            ),
          ),
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: settingsButton),
                    Expanded(child: addContact),
                    Expanded(child: myProfileButton),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: maxHeight * 0.04,
                      left: maxHeight * 0.02,
                      right: maxHeight * 0.02,
                      top: 10,
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            'Add a new contact',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: maxHeight * 0.02),
                        searchBar,
                        SizedBox(height: maxHeight * 0.02),
                        contactScreens,
                        SizedBox(height: maxHeight * 0.02),
                        Expanded(
                          child: PageView(
                            controller: controller,
                            onPageChanged: (index) {
                              if (index == 0) {
                                setState(() {
                                  pressedRecents = true;
                                  pressedAll = false;
                                  pressedFavorites = false;
                                });
                              } else if (index == 1) {
                                setState(() {
                                  pressedRecents = false;
                                  pressedAll = true;
                                  pressedFavorites = false;
                                });
                              } else if (index == 2) {
                                setState(() {
                                  pressedRecents = false;
                                  pressedAll = false;
                                  pressedFavorites = true;
                                });
                              }
                            },
                            children: <Widget>[
                              RecentContacts(),
                              AllContacts(),
                              FavoriteContacts(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
