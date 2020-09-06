import 'package:flutter/material.dart';
import '../../widgets/contact_card.dart';
import '../../providers/RecentContactsList.dart' as rcl;

class RecentContacts extends StatefulWidget {
  RecentContacts({Key key}) : super(key: key);
  @override
  _RecentContacts createState() => new _RecentContacts();
}

class _RecentContacts extends State<RecentContacts> {
  @override
  Widget build(BuildContext context) {
    // final maxHeight = MediaQuery.of(context).size.height;
    // final maxWidth = MediaQuery.of(context).size.width;
    var recentsCount = 5;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
            itemCount: recentsCount,
            itemBuilder: (ctx, i) => i != 3
                ? ContactCard(
                    rcl.recentItems[i].name,
                    rcl.recentItems[i].designation,
                    rcl.recentItems[i].company,
                    rcl.recentItems[i].connectDate,
                    rcl.recentItems[i].metDate,
                    rcl.recentItems[i].fav,
                    false,
                    true,
                  )
                : GroupedCard([
                    rcl.recentItems[i],
                    rcl.recentItems[i + 1],
                    rcl.recentItems[i + 2],
                    rcl.recentItems[i + 3]
                  ], rcl.recentItems[i].company, rcl.recentItems[i].connectDate,
                    rcl.recentItems[i].metDate)),
      ),
    );
  }
}
