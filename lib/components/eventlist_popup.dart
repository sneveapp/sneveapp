// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sneve/components/event_scroll_view.dart';
import 'package:sneve/components/eventlist_alike_view.dart';
import 'package:sneve/components/eventlist_description.dart';
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
  var views = const [
    EventScrollView(),
    EventlistDescriptionView(),
    EventlistAlikeView()
  ];
  int _selectedIndex = 0;

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
      initialChildSize: .5,
      minChildSize: .0,
      maxChildSize: 0.95,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(0, -1),
                      blurRadius: 5,
                      spreadRadius: 1)
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverAppBar(
                  expandedHeight: MediaQuery.of(context).size.height * .15,
                  collapsedHeight: MediaQuery.of(context).size.height * .15,
                  backgroundColor: Colors.white.withOpacity(0),
                  flexibleSpace: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                        child: Center(
                          child: Container(
                            height: 5,
                            width: 50,
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(99))),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(widget.getEventList().getName(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                          const Spacer(),
                          IconButton(
                            onPressed: bookmarkTapped,
                            icon: bookmarked
                                ? const Icon(Icons.bookmark)
                                : const Icon(Icons.bookmark_add_outlined),
                            iconSize: 32,
                          ),
                          OutlinedButton(
                              onPressed: () => {},
                              style: ButtonStyle(
                                side: MaterialStateProperty.all(
                                    const BorderSide(
                                        width: 2.0,
                                        color: Colors.grey,
                                        style: BorderStyle.solid)),
                                alignment: Alignment.centerLeft,
                              ),
                              child: Row(children: const [
                                Icon(
                                  Icons.play_arrow_outlined,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 8),
                                Text("Start",
                                    style: TextStyle(color: Colors.black))
                              ]))
                        ],
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Row(children: const [
                            Text("Events"),
                            Spacer(),
                            Text("Description"),
                            Spacer(),
                            Text("Alike")
                          ]),
                        ),
                      )
                    ]),
                  ),
                  pinned: true,
                ),
                Container(
                  child: views[_selectedIndex],
                )
              ],
            ));
      },
    );
  }
}
