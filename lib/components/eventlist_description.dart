import 'package:flutter/material.dart';
import 'package:sneve/services/eventlist.dart';


class EventlistDescriptionView extends StatelessWidget {
  final EventList _eventList;
  const EventlistDescriptionView(this._eventList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildListDelegate([
      Column(children: [Container(
        width: MediaQuery.of(context).size.width * 0.9,
        alignment: Alignment.topLeft,
        child: Text(_eventList.getDescription()),
      ),
      Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          border: Border.all(color: Colors.grey, width: 0.5)
        ),
        alignment: Alignment.topLeft,
        child: Column(children: const [
          Text("Author:     "),
          Text("Created:    "),
          Text("Saved:      "),
          Text("Started     ")
        ]),
      )
      
      ])
    ]));
  }
}