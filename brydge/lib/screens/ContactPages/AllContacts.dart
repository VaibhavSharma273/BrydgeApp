import 'package:flutter/material.dart';
import '../../widgets/contact_card.dart';
import '../../providers/ContactsList.dart' as pcl;

class AllContacts extends StatefulWidget {
  AllContacts({Key key}) : super(key: key);
  @override
  _AllContacts createState() => new _AllContacts();
}

class _AllContacts extends State<AllContacts> {
  @override
  Widget build(BuildContext context) {
    // final maxHeight = MediaQuery.of(context).size.height;
    // final maxWidth = MediaQuery.of(context).size.width;
    var allCount = 5;

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
            itemCount: allCount,
            itemBuilder: (ctx, i) => ContactCard(
                pcl.items[i].name,
                pcl.items[i].designation,
                pcl.items[i].company,
                pcl.items[i].connectDate,
                pcl.items[i].metDate,
                pcl.items[i].fav,
                false,
                true),
          ),
        ));
  }
}
