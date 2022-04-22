import 'package:flutter/material.dart';
import 'package:sneve/components/eventlist_view.dart';
import 'package:sneve/notifications/EventlistPopupNotification.dart';
import 'package:sneve/services/eventlist.dart';

class EventlistCard extends StatefulWidget {
  final EventList eventlist;

  late final _EventlistCardState _eventlistCardState;

  EventlistCard({Key? key, required this.eventlist}) : super(key: key);

  @override
  State<EventlistCard> createState() {
    _eventlistCardState = _EventlistCardState();
    return _eventlistCardState;
  }

  void destroyPopupFromOutside() {
    if (_eventlistCardState != null) {
      _eventlistCardState._destroyEventListPopup();
    }
  }
}

class _EventlistCardState extends State<EventlistCard> {
  late OverlayEntry? _popup;
  bool _destroyPopupInNextCycle = false;

  void requestDestroy() {
    setState(() {
      _destroyPopupInNextCycle = true;
    });
  }

  void _showEventlistPopup(BuildContext context) async {
    setState(() {
      _popup = OverlayEntry(builder: (context) {
        return DefaultTextStyle(
            style: TextStyle(color: Colors.black),
            child: EventlistView(
              eventlist: widget.eventlist,
              creator: widget,
            ));
      });
    });

    Overlay.of(context)!.insert(_popup!);
  }

  void _destroyEventListPopup() {
    if (_popup != null) {
      _popup!.remove();

      setState(() {
        _popup = null;
        _destroyPopupInNextCycle = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_destroyPopupInNextCycle) {
      _destroyEventListPopup();
    }
    return NotificationListener<EventlistPopupNotification>(
        onNotification: (notification) {
          print("notif");
          _destroyEventListPopup();
          return false;
        },
        child: GestureDetector(
            onTap: () {
              _showEventlistPopup(context);
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 8),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          spreadRadius: 0.5,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 2), // changes position of shadow
                        ),
                      ]
                    : null,
                border:
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? Border.all(color: Colors.grey, width: 0.5)
                        : null,
              ),
              child: Row(children: [
                Text(
                  widget.eventlist.name,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                )
              ]),
            )));
  }
}
