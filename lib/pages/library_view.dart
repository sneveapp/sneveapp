import 'package:flutter/material.dart';
import 'package:sneve/services/eventlist.dart';
import 'package:sneve/services/memory.dart';
import 'package:sneve/services/sneve_user.dart';

import '../components/eventlist_card.dart';
import '../services/event.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({Key? key}) : super(key: key);

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  List events = [
    EventList(
        name: "Développement de l'appli Sneve",
        description: "Je et Marc développeons l'appli Sneve ensemble",
        alike: [],
        creationDate: DateTime.now(),
        numberOfSaves: 0,
        numberOfStarts: 0,
        author: SneveUser("alp"),
        activities: [
          Event(
              tags: ["logiciel", "flutter"],
              name: "Having dinner at Deeba",
              imageUrl:
                  "https://media-cdn.tripadvisor.com/media/photo-s/05/32/84/c6/interno.jpg"),
          Memory(
              tags: ["appli", "développement"],
              imageUrl:
                  "https://s1.qwant.com/thumbr/0x380/a/5/206a9745fbc70f46e62c1eb786dd9985e0dc8d5e37c00d161616b61fa2f243/0abfb125b3939b4a68da3b01fc9ce2b2.jpg?u=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F0a%2Fbf%2Fb1%2F0abfb125b3939b4a68da3b01fc9ce2b2.jpg&q=0&b=1&p=0&a=0",
              name: "Eating Dumplings at LeDu!"),
          Event(
              tags: ["DraggableScrollableShit", "#IHateMyLife"],
              imageUrl: "http://photos.wikimapia.org/p/00/04/12/92/98_full.jpg",
              name: "Working on Sneve!")
        ]),
    EventList(
        name: "Apprendre le français!",
        description: "Je et Marc apprenons le français.",
        alike: [],
        creationDate: DateTime.now(),
        numberOfSaves: 0,
        numberOfStarts: 0,
        author: SneveUser("alp"),
        activities: [
          Event(
              tags: ["français", "French in Action"],
              name: "French in Action | First Episode",
              imageUrl:
                  "https://s2.qwant.com/thumbr/0x0/4/3/13083ebd0d73c41ffa28f3068b73d8eadc0564fc5c97af11eef401f2b6a037/fls-fia.jpg?u=https%3A%2F%2Fsierra.mmic.net%2Ffls-fia.jpg&q=0&b=1&p=0&a=0"),
          Memory(
              tags: ["l'informathique", "arbre", "logitheque"],
              imageUrl:
                  "https://s2.qwant.com/thumbr/0x380/6/f/4a7e4598032474a8597360bce3afd09c25e54f18a68bcbe7ef1e687d263880/image_article62.jpg?u=https%3A%2F%2Fwww.freelance-info.fr%2Ffreelance-info%2Ftags_articles%2Fimage_article62.jpg&q=0&b=1&p=0&a=0",
              name: "Apprendre les mots de l'informathique"),
          Event(
              tags: ["paris", "france", "ubahn"],
              imageUrl:
                  "https://s1.qwant.com/thumbr/0x380/b/7/72b3be697d0deb9f7c697bef6a45aabcf45ef0253a20f22a82bbcc61697e5a/tour-eiffel-paris-foule-pixabay-phil-riley-scaled.jpg?u=https%3A%2F%2F94.citoyens.com%2Fwp-content%2Fblogs.dir%2F2%2Ffiles%2F2021%2F01%2Ftour-eiffel-paris-foule-pixabay-phil-riley-scaled.jpg&q=0&b=1&p=0&a=0",
              name: "Notre voyage à la station de métro")
        ])
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> eventlists = [];
    for (EventList eventlist in events) {
      eventlists.add(EventlistCard(eventlist: eventlist));
    }
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: ListView(children: eventlists),
    );
  }
}
