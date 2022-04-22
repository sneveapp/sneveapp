import 'package:flutter/material.dart';
import 'package:sneve/components/tag.dart';
import 'package:sneve/services/eventlist.dart';

import '../services/activity.dart';

class EventlistAlikeView extends StatelessWidget {
  final EventList eventList;
  EventlistAlikeView({required this.eventList, Key? key}) : super(key: key);

  List<Widget> tags = [];

  @override
  Widget build(BuildContext context) {
    for (Activity a in eventList.activities) {
      for (String s in a.tags) {
        tags.add(Tag(s));
      }
    }

    return SliverList(
        delegate: SliverChildListDelegate([
      Container(
        child: Wrap(
          children: tags,
          alignment: WrapAlignment.spaceEvenly,
          spacing: 5,
        ),
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9),
      ),
    ]));
  }
}
