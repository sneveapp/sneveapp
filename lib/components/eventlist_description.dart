import 'package:flutter/material.dart';
import 'package:sneve/services/eventlist.dart';

class EventlistDescriptionView extends StatelessWidget {
  final EventList _eventList;
  const EventlistDescriptionView(this._eventList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      Column(children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          alignment: Alignment.topLeft,
          child: Text(_eventList.description),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              border: Border.all(color: Colors.grey, width: 0.5)),
          alignment: Alignment.topLeft,
          child: Column(children: [
            Align(child: Text("Author: " + _eventList.author.toStr()), alignment: Alignment.topLeft,),
            Align(child: Text("Created: " + _eventList.getCreationDateAsString()), alignment: Alignment.topLeft,),
            Align(child: Text("Saved: ${_eventList.numberOfSaves}"), alignment: Alignment.topLeft,),
            Align(child: Text("Started: ${_eventList.numberOfStarts}"), alignment: Alignment.topLeft,)
          ]),
        )
      ])
    ]));
  }
}
