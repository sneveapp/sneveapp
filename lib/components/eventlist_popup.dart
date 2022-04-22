// ignore_for_file: sized_box_for_whitespace

import 'package:sneve/services/sneve_user.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sneve/components/eventlist_popup_tab.dart';
import 'package:sneve/components/event_scroll_view.dart';
import 'package:sneve/components/eventlist_alike_view.dart';
import 'package:sneve/components/eventlist_description.dart';
import 'package:sneve/notifications/EventlistPopupNotification.dart';
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
  List views = [
    const EventScrollView(),
    EventlistDescriptionView(EventList(
        name: "",
        description: "",
        alike: [],
        creationDate: DateTime.now(),
        numberOfSaves: 0,
        numberOfStarts: 0,
        author: SneveUser(""),
        events: [])),
    const EventlistAlikeView()
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

  VoidCallback handleTabClick(int index) {
    return () {
      setState(() {
        _selectedIndex = index;
      });
    };
  }

  void handleSwipeLeft() {
    setState(() {
      if (_selectedIndex < 2) _selectedIndex++;
    });
  }

  void handleSwipeRight() {
    setState(() {
      if (_selectedIndex > 0) _selectedIndex--;
    });
  }

  @override
  Widget build(BuildContext context) {
    views[1] = EventlistDescriptionView(widget.getEventList());

    return NotificationListener<DraggableScrollableNotification>(
        onNotification: (notification) {
          if (notification.extent <= 0.2) {
            print("dispatch!");
            EventlistPopupNotification(eventlist: widget._eventList)
              ..dispatch(context);
          }
          return false;
        },
        child: DraggableScrollableSheet(
          initialChildSize: .5,
          minChildSize: .0,
          maxChildSize: 0.90,
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
                child: SwipeTo(
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverAppBar(
                        expandedHeight:
                            MediaQuery.of(context).size.height * .20,
                        collapsedHeight:
                            MediaQuery.of(context).size.height * .20,
                        backgroundColor: Colors.white.withOpacity(0),
                        flexibleSpace: Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12)),
                          ),
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20, bottom: 0),
                          child: Column(children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                              child: Center(
                                child: Container(
                                  height: 5,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(99))),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget._eventList.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                OutlinedButton(
                                    onPressed: () => {},
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all<
                                              EdgeInsetsGeometry>(
                                          EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 5,
                                              bottom: 5)),
                                      side:
                                          MaterialStateProperty.all<BorderSide>(
                                              BorderSide(
                                                  width: 0,
                                                  color: Colors.white
                                                      .withOpacity(0))),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.deepOrange),
                                      alignment: Alignment.centerLeft,
                                    ),
                                    child: Row(children: const [
                                      Icon(
                                        Icons.play_arrow_outlined,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 4),
                                      Text("Start",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16))
                                    ])),
                                IconButton(
                                  onPressed: bookmarkTapped,
                                  icon: bookmarked
                                      ? const Icon(Icons.bookmark)
                                      : const Icon(Icons.bookmark_add_outlined),
                                  iconSize: 30,
                                ),
                              ],
                            ),
                            Divider(),
                            Center(
                                child: Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Row(children: [
                                EventlistPopupTab(
                                    text: "Events",
                                    handler: handleTabClick(0),
                                    selected: _selectedIndex == 0),
                                Spacer(),
                                EventlistPopupTab(
                                    text: "Description",
                                    handler: handleTabClick(1),
                                    selected: _selectedIndex == 1),
                                Spacer(),
                                EventlistPopupTab(
                                    text: "Alike",
                                    handler: handleTabClick(2),
                                    selected: _selectedIndex == 2),
                              ]),
                            )),
                          ]),
                        ),
                        pinned: true,
                      ),
                      Container(child: views[_selectedIndex])
                    ],
                  ),
                  onLeftSwipe: handleSwipeLeft,
                  onRightSwipe: handleSwipeRight,
                  animationDuration: const Duration(milliseconds: 50),
                  offsetDx: 0,
                  iconSize: 0,
                ));
          },
        ));
  }
}
