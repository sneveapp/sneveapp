import 'package:flutter/material.dart';
import 'package:sneve/services/activity.dart';

import '../services/event.dart';
import '../services/eventlist.dart';
import 'card_component.dart';

class EventScrollView extends StatelessWidget {
  final EventList eventList;
  EventScrollView({required this.eventList, Key? key}) : super(key: key);

  List<Widget> activities = [];

  @override
  Widget build(BuildContext context) {
    for (Activity a in eventList.activities) {
      activities.add(
        Center(
            child: CardComponent(
          type: a.runtimeType == Event ? CardType.event : CardType.memory,
          name: a.name,
          imageUrl: a.imageUrl,
        )),
      );
    }

    return SliverPadding(
        padding: const EdgeInsets.only(top: 8),
        sliver: SliverList(
            delegate: SliverChildListDelegate(
             activities
        )));
  }
}
