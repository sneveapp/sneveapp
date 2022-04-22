import 'package:flutter/material.dart';
import 'package:sneve/services/eventlist.dart';

class EventlistDescriptionView extends StatelessWidget {
  final EventList eventList;
  const EventlistDescriptionView({required this.eventList, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      Column(children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          alignment: Alignment.topLeft,
          child: Text(eventList.description),
        ),
        Container(
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(color: Colors.grey, width: 0.5)),
            alignment: Alignment.topLeft,
            child: DefaultTextStyle(
              style: const TextStyle(color: Colors.grey),
              child: Column(children: [
                Align(
                  child: Text(
                    "Author: " + eventList.author.toStr(),
                  ),
                  alignment: Alignment.topLeft,
                ),
                Align(
                  child:
                      Text("Created: " + eventList.getCreationDateAsString()),
                  alignment: Alignment.topLeft,
                ),
                Align(
                  child: Text("Saved: ${eventList.numberOfSaves}"),
                  alignment: Alignment.topLeft,
                ),
                Align(
                  child: Text("Started: ${eventList.numberOfStarts}"),
                  alignment: Alignment.topLeft,
                )
              ]),
            ))
      ])
    ]));
  }
}
