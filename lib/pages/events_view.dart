import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/card_component.dart';

class EventsView extends StatefulWidget {
  final ScrollController controller;
  const EventsView(this.controller, {Key? key}) : super(key: key);

  @override
  State<EventsView> createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView> {
  @override
  Widget build(BuildContext context) {
    return ListView(controller: widget.controller, children: const [
      SizedBox(
        height: 12,
      ),
      Center(
          child: CardComponent(
        type: CardType.memory,
        name: "Having dinner at Deeba",
        imageUrl:
            "https://media-cdn.tripadvisor.com/media/photo-s/05/32/84/c6/interno.jpg",
      )),
      Center(
          child: CardComponent(
        type: CardType.memory,
        name: "Working on Sneve!",
        imageUrl:
            "https://www.ganz-muenchen.de/Media/bilder%20gastro/cafes/starbucks/leopoldstrasse/041114opening/041114starbucks_op35haus.jpg",
      )),
      Center(
          child: CardComponent(
        type: CardType.memory,
        name: "Having dinner at Honghong",
        imageUrl:
            "https://s2.qwant.com/thumbr/0x380/5/7/5ee8bbdac977d72850247d47fcf8e67d547bd14ef21285c55fa25b0c412fa5/680001_200615_165737NK_galerie4_800px.jpg?u=https%3A%2F%2Fgutscheinbuch.de%2Fdata%2Fcrm_vertrag%2F680001_200615_165737NK%2Fgalerie%2F680001_200615_165737NK_galerie4_800px.jpg&q=0&b=1&p=0&a=0",
      )),
      Center(
          child: CardComponent(
        type: CardType.event,
        name: "Working on Sneve! (again...)",
        imageUrl:
            "https://s1.qwant.com/thumbr/0x380/0/0/1b9b826b7a2125497cb22c857ae67fc62439886a46ba4b5b856b72201e5ecc/DSCN20258.jpg?u=http%3A%2F%2Fwww.starbuckseverywhere.net%2Fbigimages%2F20%2FDSCN20258.jpg&q=0&b=1&p=0&a=0",
      )),
    ]);
  }
}
