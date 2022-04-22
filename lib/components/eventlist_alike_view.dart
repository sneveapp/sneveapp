import 'package:flutter/material.dart';
import 'package:sneve/components/tag.dart';


class EventlistAlikeView extends StatelessWidget {
  const EventlistAlikeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildListDelegate([
      Container( child: Wrap(
        children: [
          Tag("Sneve"),
          Tag("Sneve"),
          Tag("Sneve"),
          Tag("Sneve"),
          Tag("Sneve"),
          Tag("Sneve"),
          Tag("Sneve"),
          Tag("Sneve"),
          Tag("Sneve"),
        ],
        alignment: WrapAlignment.spaceEvenly,
        spacing: 5,
        ),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9),
        ),
    ]));
  }
}