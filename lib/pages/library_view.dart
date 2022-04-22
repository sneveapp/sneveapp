import 'package:flutter/material.dart';
import 'package:sneve/components/card_component.dart';
import 'package:sneve/components/eventlist_view.dart';
import 'package:sneve/services/eventlist.dart';
import 'package:sneve/services/sneve_user.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        Center(
            child: Column(children: [
          CardComponent(
            type: CardType.event,
            name: "Débogage de Sneve",
            imageUrl:
                "https://s2.qwant.com/thumbr/0x380/5/3/a1c27641a67895a805bd66f5a599d83001c50c5d73b4a0d59f84d04c48f7e0/coffee-fellows-1.JPG?u=https%3A%2F%2Fwww.mux.de%2Fimages%2F1500x1200z%2Fobject%2F54%2F1188509354%2Fcoffee-fellows-1.JPG&q=0&b=1&p=0&a=0",
          ),
          Center(
              child: CardComponent(
            type: CardType.event,
            name: "Débogage de Sneve 2",
            imageUrl:
                "https://s2.qwant.com/thumbr/0x380/5/3/a1c27641a67895a805bd66f5a599d83001c50c5d73b4a0d59f84d04c48f7e0/coffee-fellows-1.JPG?u=https%3A%2F%2Fwww.mux.de%2Fimages%2F1500x1200z%2Fobject%2F54%2F1188509354%2Fcoffee-fellows-1.JPG&q=0&b=1&p=0&a=0",
          )),
        ])),
        EventlistView(eventlist: EventList("Développement de l'appli Sneve", "The analyzer produces this diagnostic when a library that declares a function named loadLibrary is imported using a deferred import. A deferred import introduces an implicit function named loadLibrary. This function is used to load the contents of the deferred library, and the implicit function hides the explicit declaration in the deferred library.", [], DateTime.now(), 10, 3, SneveUser("Alp Kaan"))),
      ],
    ));
  }
}
