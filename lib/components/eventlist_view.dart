import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneve/components/eventlist_popup.dart';
import 'package:sneve/services/eventlist.dart';

class EventlistView extends StatelessWidget {
  final EventList eventlist;
  const EventlistView({Key? key, required this.eventlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black.withOpacity(0.4),
        ),
        EventlistPopup(eventlist)
      ],
    );
  }
}