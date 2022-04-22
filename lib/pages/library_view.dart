import 'package:flutter/material.dart';
import 'package:sneve/components/card_component.dart';
import 'package:sneve/components/eventlist_card.dart';
import 'package:sneve/components/eventlist_view.dart';
import 'package:sneve/services/eventlist.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({Key? key}) : super(key: key);

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  EventList mlist = EventList("Développement de l'appli Sneve");

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: ListView(
            children: [
              EventlistCard(eventlist: mlist),
            ],
          ),
        )
      ],
    );
  }
}
