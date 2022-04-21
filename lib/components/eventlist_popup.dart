import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sneve/pages/events_view.dart';
import 'package:sneve/services/eventlist.dart';

import 'card_component.dart';

class EventlistPopup extends StatefulWidget {
  final EventList _eventList;

  const EventlistPopup(this._eventList, {Key? key}) : super(key: key);

  @override
  State<EventlistPopup> createState() => _EventlistPopupState();

  EventList getEventList() {
    return _eventList;
  }
}

class _EventlistPopupState extends State<EventlistPopup> {
  bool bookmarked = false;

  void bookmarkTapped() {
    setState(() {
      bookmarked = !bookmarked;
    });
    if (kDebugMode) {
      print("Bookmark button has been pressed. Bookmarked is now $bookmarked");
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: .25,
      minChildSize: .1,
      maxChildSize: 1,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.elliptical(40, 20),
                    topRight: Radius.elliptical(40, 20))),
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  SizedBox(
                    height: 20,
                    child: Center(
                      child: Container(
                        height: 5,
                        width: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(99))),
                      ),
                    ),
                  )
                ])),
                SliverAppBar(
                  title: Container(
                    padding: const EdgeInsets.all(20),
                    child: Expanded(
                        child: Row(
                      children: [
                        Text(widget.getEventList().getName()),
                        const Spacer(),
                        IconButton(
                          onPressed: bookmarkTapped,
                          icon: bookmarked
                              ? const Icon(Icons.bookmark)
                              : const Icon(Icons.bookmark_add_outlined),
                          iconSize: 30,
                        ),
                        OutlinedButton(
                            onPressed: () => {},
                            style: const ButtonStyle(
                              alignment: Alignment.centerLeft,
                            ),
                            child: Row(children: const [
                              Icon(
                                Icons.play_arrow_outlined,
                                color: Colors.black,
                              ),
                              SizedBox(width: 12),
                              Text("Start",
                                  style: TextStyle(color: Colors.black))
                            ]))
                      ],
                    )),
                  ),
                  pinned: true,
                ),
                SliverList(
                    delegate: SliverChildListDelegate(
                  [
                    const SizedBox(
                      height: 12,
                    ),
                    const Center(
                        child: CardComponent(
                      type: CardType.memory,
                      name: "Having dinner at Deeba",
                      imageUrl:
                          "https://media-cdn.tripadvisor.com/media/photo-s/05/32/84/c6/interno.jpg",
                    )),
                    const Center(
                        child: CardComponent(
                      type: CardType.memory,
                      name: "Working on Sneve!",
                      imageUrl:
                          "https://www.ganz-muenchen.de/Media/bilder%20gastro/cafes/starbucks/leopoldstrasse/041114opening/041114starbucks_op35haus.jpg",
                    )),
                    const Center(
                        child: CardComponent(
                      type: CardType.memory,
                      name: "Having dinner at Honghong",
                      imageUrl:
                          "https://s2.qwant.com/thumbr/0x380/5/7/5ee8bbdac977d72850247d47fcf8e67d547bd14ef21285c55fa25b0c412fa5/680001_200615_165737NK_galerie4_800px.jpg?u=https%3A%2F%2Fgutscheinbuch.de%2Fdata%2Fcrm_vertrag%2F680001_200615_165737NK%2Fgalerie%2F680001_200615_165737NK_galerie4_800px.jpg&q=0&b=1&p=0&a=0",
                    )),
                    const Center(
                        child: CardComponent(
                      type: CardType.event,
                      name: "Working on Sneve! (again...)",
                      imageUrl:
                          "https://s1.qwant.com/thumbr/0x380/0/0/1b9b826b7a2125497cb22c857ae67fc62439886a46ba4b5b856b72201e5ecc/DSCN20258.jpg?u=http%3A%2F%2Fwww.starbuckseverywhere.net%2Fbigimages%2F20%2FDSCN20258.jpg&q=0&b=1&p=0&a=0",
                    )),
                  ],
                ))
              ],
            ));
      },
    );
  }
}
