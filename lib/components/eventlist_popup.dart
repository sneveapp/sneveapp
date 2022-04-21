import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sneve/pages/events_view.dart';
import 'package:sneve/services/eventlist.dart';

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
            child: Column(
              children: [
                Container(
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
                      OutlinedButton(onPressed: () => {},
                      style: const ButtonStyle(
                        alignment: Alignment.centerLeft,
                      ),
                      child: Row(
                        children: 
                        const [Icon(Icons.play_arrow_outlined, color: Colors.black,),
                        SizedBox(width: 12),
                        Text("Start", style: TextStyle(color: Colors.black))
                        ]
                      ))
                    ],
                  )),
                ),
                const VerticalDivider(
                  color: Colors.black,
                  thickness: 3,
                ),
                Expanded(child: EventsView(scrollController))
              ],
            ));
      },
    );
  }
}
