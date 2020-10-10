// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import '../providers/ContactsList.dart';
import 'package:brydge/screens/ContactPages/AllContacts.dart';

class ContactCard extends StatefulWidget {
  final String name;
  final String designation;
  final String company;
  final String connectDate;
  final String metDate;
  final bool fav;
  final bool inverted;
  final bool shadowed;
  ContactCard(this.name, this.designation, this.company, this.connectDate,
      this.metDate, this.fav, this.inverted, this.shadowed);
  @override
  _ContactCard createState() => new _ContactCard();
}

//  ignore: must_be_immutable
class _ContactCard extends State<ContactCard> {
  //var fav = false; //favorite variable to indicate choice
  @override
  Widget build(BuildContext context) {
    var fav = widget.fav;
    final name = widget.name;
    final designation = widget.designation;
    final company = widget.company;
    final connectDate = widget.connectDate;
    final metDate = widget.metDate;
    final maxWidth = MediaQuery.of(context).size.width;

    final shadowed = widget.shadowed;
    final inverted = widget.inverted;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          //constraints: BoxConstraints.tight(Size(maxWidth, 130)),
          height: 125,
          width: maxWidth,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: inverted ? Color(0xFF1C8CB4) : Colors.white,
            elevation: shadowed ? 5.0 : 0.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding:
                              EdgeInsets.fromLTRB(0.0, 0, maxWidth * 0.02, 0),
                          child: Container(
                            width: 110,
                            height: 110,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/linkedin.jpg")),
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: inverted
                                      ? Colors.white
                                      : Color(0xFF1C8CB4))),
                          Text("$designation at $company",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: inverted
                                      ? Colors.white
                                      : Color(0xFF1C8CB4))),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text("Connected on: $connectDate",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w300,
                                  color: inverted
                                      ? Colors.white
                                      : Color(0xFF1C8CB4))),
                          Text("Met on: $metDate",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w300,
                                  color: inverted
                                      ? Colors.white
                                      : Color(0xFF1C8CB4))),
                        ],
                      ),
                    ],
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        child: IconButton(
                          icon: Icon(fav ? Icons.star : Icons.star_border,
                              color:
                                  inverted ? Colors.white : Color(0xFF1C8CB4)),
                          onPressed: () {
                            setState(() {
                              if (fav == false) {
                                fav = true;
                              } else {
                                fav = false;
                              }
                            });
                          },
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GroupedCard extends StatefulWidget {
  final List<Contact> group;
  final String category;
  final String connectDate;
  final String metDate;
  GroupedCard(this.group, this.category, this.connectDate, this.metDate);
  @override
  _GroupedCard createState() => new _GroupedCard();
}

class _GroupedCard extends State<GroupedCard> {
  var nested = false;

  @override
  Widget build(BuildContext context) {
    var newFormat = DateFormat("MM/dd/yyyy");
    final category = widget.category;
    final connectDate = newFormat.format(DateTime.parse(widget.connectDate));
    final metDate = newFormat.format(DateTime.parse(widget.metDate));
    final maxWidth = MediaQuery.of(context).size.width;
    final groupedContactList = widget.group;

    final frontCard = Padding(
      padding: EdgeInsets.only(top: 1.0),
      child: Container(
        height: 125,
        width: maxWidth,
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (nested == false) {
                nested = true;
              } else {
                nested = false;
              }
            });
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.white,
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding:
                              EdgeInsets.fromLTRB(0.0, 0, maxWidth * 0.02, 0),
                          child: Container(
                            width: 110,
                            height: 110,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/linkedin.jpg")),
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Your Contacts At",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1C8CB4))),
                          Text(category,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF1C8CB4))),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text("Connected on: $connectDate",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFF1C8CB4))),
                          Text("Met on: $metDate",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFF1C8CB4))),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    List<Widget> _createChildren() {
      List groupedContacts = List<Widget>();
      int len = groupedContactList.length;

      for (int i = len; i > 0; i--) {
        groupedContacts.add(
          AnimatedContainer(
            height: nested
                ? (125 * (i + 1)).toDouble()
                : (i < 3 ? 125 + (i * 5).toDouble() : 125 + (3 * 5).toDouble()),
            width: maxWidth,
            padding: nested
                ? EdgeInsets.only(top: (125 * i).toDouble())
                : (i < 3
                    ? EdgeInsets.only(top: (i * 5).toDouble())
                    : EdgeInsets.only(top: (3 * 5).toDouble())),
            duration: Duration(seconds: 1),
            curve: Curves.easeOut,
            child: ContactCard(
              groupedContactList[i - 1].firstName +
                  " " +
                  groupedContactList[i - 1].lastName,
              groupedContactList[i - 1].designation,
              groupedContactList[i - 1].companyName,
              newFormat
                  .format(groupedContactList[i - 1].connectedOn)
                  .toString(),
              newFormat.format(groupedContactList[i - 1].metOn).toString(),
              groupedContactList[i - 1].fav,
              true,
              !nested & (i > 3) ? false : true,
            ),
          ),
        );
      }
      groupedContacts.add(frontCard);
      return groupedContacts;
    }

    return Stack(
      children: _createChildren(),
    );
  }
}
