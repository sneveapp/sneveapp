import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneve/components/eventlist_popup.dart';
import 'package:sneve/notifications/EventlistPopupNotification.dart';
import 'package:sneve/services/eventlist.dart';

import 'eventlist_card.dart';

class EventlistView extends StatelessWidget {
  final EventList eventlist;
  final EventlistCard creator;
  const EventlistView(
      {Key? key, required this.eventlist, required this.creator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<EventlistPopupNotification>(
        onNotification: (notification) {
          print("catch!");
          creator.destroyPopupFromOutside();
          return false;
        },
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black.withOpacity(0.4),
            ),
            EventlistPopup(eventlist)
          ],
        ));
  }
}
