import 'package:flutter/material.dart';
import 'package:sneve/components/card_component.dart';
import 'package:sneve/components/eventlist_card.dart';
import 'package:sneve/components/eventlist_view.dart';
import 'package:sneve/services/eventlist.dart';
import 'package:sneve/services/sneve_user.dart';

import '../services/event.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({Key? key}) : super(key: key);

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  EventList mlist = EventList(
      name: "Développement de l'appli Sneve",
      description: "Je et Marc développeons l'appli Sneve ensemble",
      alike: [],
      creationDate: DateTime.now(),
      numberOfSaves: 0,
      numberOfStarts: 0,
      author: SneveUser("alp"),
      events: [
        Event(
            name: "Having dinner at Deeba",
            imageUrl:
                "https://media-cdn.tripadvisor.com/media/photo-s/05/32/84/c6/interno.jpg")
      ]);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: ListView(
        children: [
          EventlistCard(eventlist: mlist),
        ],
      ),
    );
  }
}
