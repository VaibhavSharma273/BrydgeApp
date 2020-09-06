import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String designation;
  final String company;
  final String connectDate;
  final String metDate;
  bool fav;

  Contact({
    @required this.name,
    @required this.designation,
    @required this.company,
    @required this.connectDate,
    @required this.metDate,
    @required this.fav,
  });
}

final items = List<Contact>.generate(
    20,
    (i) => Contact(
          name: "Vaibhav Sharma",
          designation: "Developer",
          company: "STC",
          connectDate: "03/27/01",
          metDate: "09/27/01",
          fav: false,
        ));
//backend list of all contacts