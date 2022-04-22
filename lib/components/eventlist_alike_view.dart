import 'package:flutter/material.dart';


class EventlistAlikeView extends StatelessWidget {
  const EventlistAlikeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildListDelegate([
      const Text("Alike")
    ]));
  }
}