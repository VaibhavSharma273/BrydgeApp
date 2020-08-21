import 'package:flutter/material.dart';
import './ContactsPage.dart';
import './CreateMyPorfilePage.dart';

class CreateProfile extends StatefulWidget {
  CreateProfile({Key key}) : super(key: key);
  @override
  _CreateProfile createState() => new _CreateProfile();
}

class _CreateProfile extends State<CreateProfile> {
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;

    final createButton = Material(
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateMyProfile()),
            );
          },
          child: Center(
            child: Text("Create Profile",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF497ED3),
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
      )),
    );

    final laterButton = Material(
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyContacts()),
            );
          },
          child: Center(
            child: Text("Later",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF497ED3),
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
      )),
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: 
          Center(
            child: Container(
              height: maxHeight,
              width: maxWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  tileMode: TileMode.clamp,
                  colors: <Color>[
                    Color(0xFF9D91E2),
                    Color(0xFF497ED3),
                  ],
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, maxHeight * 0.08, 0, 0),
                      child: Container(
                        width: maxWidth * 0.18,
                        height: maxWidth * 0.12,
                        padding: EdgeInsets.fromLTRB(0, 0, maxWidth*0.02, 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50.0),
                              bottomRight: Radius.circular(50.0)),
                        ),
                        child: IconButton(
                          alignment: Alignment.center,
                            icon: Icon(Icons.arrow_back,
                                color: Color(0xFF9D91E2)),
                            iconSize: 30,
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(maxHeight * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          padding:
                              EdgeInsets.fromLTRB(5, maxHeight * 0.15, 5, 0),
                          child: Text(
                            'Create Your Profile!',
                            style: TextStyle(
                                fontSize: 0.06 *
                                    curScaleFactor *
                                    maxHeight, //FontSize
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Text(
                            'The profile you create will be used to make your digital business card, which can then be shared with other users of the app!',
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(height: maxHeight * 0.08),
                        createButton,
                        SizedBox(height: maxHeight * 0.04),
                        laterButton,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
