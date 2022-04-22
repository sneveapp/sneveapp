import 'package:flutter/material.dart';


class EventlistDescriptionView extends StatelessWidget {
  const EventlistDescriptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildListDelegate([
      const Text("Description")
    ]));
  }
}