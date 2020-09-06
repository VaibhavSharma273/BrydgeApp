import './ContactsList.dart';

var recentItems = List<Contact>.generate(
    20,
    (i) => Contact(
          name: "Neel Malhotra",
          designation: "Developer",
          company: "STC",
          connectDate: "03/27/01",
          metDate: "09/27/01",
          fav: false,
        ));

//backend list of recent contacts date-wise