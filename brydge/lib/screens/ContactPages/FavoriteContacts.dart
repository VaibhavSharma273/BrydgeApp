import 'package:flutter/material.dart';
import '../../widgets/contact_card.dart';
import '../../providers/FavoriteContactsList.dart' as fcl;

class FavoriteContacts extends StatefulWidget {
  FavoriteContacts({Key key}) : super(key: key);
  @override
  _FavoriteContacts createState() => new _FavoriteContacts();
}

class _FavoriteContacts extends State<FavoriteContacts> {
  @override
  Widget build(BuildContext context) {
    // final maxHeight = MediaQuery.of(context).size.height;
    // final maxWidth = MediaQuery.of(context).size.width;
    var favoritesCount = 5;

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
            itemCount: favoritesCount,
            itemBuilder: (ctx, i) => ContactCard(
                fcl.favoriteItems[i].name,
                fcl.favoriteItems[i].designation,
                fcl.favoriteItems[i].company,
                fcl.favoriteItems[i].connectDate,
                fcl.favoriteItems[i].metDate,
                fcl.favoriteItems[i].fav,
                false,
                true),
          ),
        ));
  }
}
